import 'dart:convert';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/controllers/firestore_controller.dart';
import 'package:nendoroid_db/legacy/main.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/repo.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/models/sort_data.dart';
import 'package:nendoroid_db/services/rest_client.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';
import '../intl_util.dart';

import 'bottom_sheet_controller.dart';

/// 넨도데이터를 저장하고, 공용으로 사용하는 넨도 관련 메소드를 관리하는 컨트롤러

class NendoController extends GetxController {
  // 폴더목록 필터링을 위한 정규식
  final RegExp folderReg = RegExp(r"[0-9][-][0-9]");

  // 넨도 리스트 스크롤 컨트롤러
  final ScrollController scrollController = ScrollController();

  // 마지막 검색 단어
  String lastWord = "";

  // 로컬 DB Box
  late Box nendoBox;
  late Box setBox;
  late Box settingBox;

  // 폴더목록 이름을 리스트로 담아둠 ex) '0000-0099', '0099-0199' ...
  RxList<String> folderNameList = <String>[].obs;
  RxList<NendoData> nendoList = <NendoData>[].obs;
  RxList<SetData> setList = <SetData>[].obs;
  List<NendoData> backupNendoList = [];
  List<NendoData> recoveryNendoList = [];

  // 앱 실행시 초기화까지 걸리는 로딩
  final RxBool _initComplete = false.obs;
  bool get initComplete => _initComplete.value;

  // API 호출로 데이터를 받아올때 로딩
  final RxBool _downloadLoading = false.obs;
  bool get downloadLoading => _downloadLoading.value;

  // 데이터 다운 완료 플래그
  final RxBool _downloadComplete = false.obs;
  bool get downloadComplete => _downloadComplete.value;
  final RxBool _downloadError = false.obs;
  bool get downloadError => _downloadError.value;
  set downloadError(bool downloadError) => _downloadError.value = downloadError;

  // 다운로드 진행사항
  final RxInt _currentStep = 0.obs;
  int get currentStep => _currentStep.value;
  final RxInt _totalStep = 0.obs;
  int get totalStep => _totalStep.value;

  // 마지막 커밋 날짜
  final RxString _localCommitDate = "".obs;
  String get localCommitDate => _localCommitDate.value;
  final RxString _serverCommitDate = "".obs;
  String get serverCommitDate => _serverCommitDate.value;

  // Commit SHA-1 Hash
  final RxString _localCommitHash = "".obs;
  String get localCommitHash => _localCommitHash.value;

  // 다운로드 용량
  String dataSize = "0MB";

  // 개인 Github Token
  // 디버그 모드일때는 다른 토큰키를 쓰도록 설정
  final RxString _githubToken = kDebugMode ? "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".obs
      : "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".obs;
  String get githubToken => _githubToken.value;
  set githubToken(String githubToken) => _githubToken.value = githubToken;

  @override
  void onInit() async {
    super.onInit();
    nendoBox = await Hive.openBox<NendoData>(HiveName.nendoBoxName);
    setBox = await Hive.openBox<SetData>(HiveName.setBoxName);
    settingBox = await Hive.openBox<String>(HiveName.settingBoxName);

    // github 토큰값 세팅
    String? tokenKey = settingBox.get(HiveName.githubTokenKey);
    if (tokenKey != null && tokenKey.isNotEmpty) {
      githubToken = tokenKey;
    }
    initData();
  }

  // 최초 실행시 데이터 세팅
  Future initData() async {
    getRepoSize();
    if (nendoBox.isEmpty) {
      getRepoSize();
    } else {
      setList.value = setBox.values.toList() as List<SetData>;
      initNendoList();
      _downloadComplete.value = true;
      try {      
        // Get server commit data
        dynamic data = await fetchServerCommitData();

        // 서버에 있는 커밋날짜를 받아와준다.
        _serverCommitDate.value = IntlUtil.convertDate(gmtTime: data['commit']['commit']['author']['date']);
      } catch (error, stackTrace) {
        logger.e(error.toString());
        logger.e(stackTrace.toString());
      }
      // 로컬에 있는 커밋날짜를 받아와준다.
      _localCommitDate.value = settingBox.get(HiveName.localCommitDateKey);
      _localCommitHash.value = settingBox.get(HiveName.localCommitHashKey) ?? "null";
    }
    _initComplete.value = true;
  }

  Future updateDB() async {
    // 다운로드 관련 데이터 초기화
    _downloadComplete.value = false;
    _downloadLoading.value = true;
    _downloadError.value = false;
    _currentStep.value = 0;
    _totalStep.value = 0;
    List<NendoData> downloadedNendoList = [];
    List<SetData> downloadedSetList = [];

    try {
      // Load commit hash
      String remoteCommitHash = (await fetchServerCommitData())['commit']['sha'];

      // Load commit diff
      Dio dio = Dio()..options.headers["Authorization"] = githubToken;
      final response = await dio.get("https://api.github.com/repos/KhoraLee/NendoroidDB/compare/$localCommitHash...$remoteCommitHash");

      // Load file changes
      List<dynamic> changedFiles = response.data['files'].map((e) => e['filename']).map((e) => e.replaceAll("Nendoroid/", "")).toList();
      _totalStep.value = changedFiles.length;

      // Fetch changed files
      for (String file in changedFiles) {
        if (file.startsWith("Set")) {
          List<String> path = file.split("/");
          SetData set = await getNendoClient().getSetData(path[0], path[1]);
          downloadedSetList.add(set);
        } else {
          List<String> path = file.split("/");
          NendoData nendo = await getNendoClient().getNendoData(path[0], path[1]);
          NendoData? backupData = backupNendoList.firstWhereOrNull((e) => e.num == nendo.num);
          // Restore backup data if exist
          if (backupData != null) {
            nendo.count = backupData.count;
            nendo.have = backupData.have;
            nendo.wish = backupData.wish;
            nendo.myPrice = backupData.myPrice;
            nendo.memo = backupData.memo?.toList();
            backupNendoList.remove(backupData);
          }
          downloadedNendoList.add(nendo);
        }
        _currentStep.value++;
      }

      // Save commit data to local
      settingBox.put(HiveName.localCommitDateKey, IntlUtil.convertDate());
      settingBox.put(HiveName.localCommitHashKey, remoteCommitHash);
      _localCommitDate.value = IntlUtil.convertDate();
    } catch (error, stackTrace) {
      logger.e(error);
      logger.e(stackTrace.toString());

      _downloadComplete.value = false;
      _downloadLoading.value = false;
      _downloadError.value = true;
      return;
    }

    // Apply changes
    for (NendoData data in downloadedNendoList) {
      await nendoBox.put(data.num, data);
    }
    for (SetData data in downloadedSetList) {
      await setBox.put(data.setName, data);
    }

    // Reload data
    setList.value = setBox.values.toList() as List<SetData>;
    initNendoList();

    // Sort
    sortNendoList();

    // 다운로드 완료 후 설정
    _downloadComplete.value = true;
    _downloadLoading.value = false;
  }

  Future<void> fetchDataInFirestore({String? documentID}) async {
    _downloadComplete.value = false;
    _downloadLoading.value = true;
    _downloadError.value = false;
    _currentStep.value = 0;
    _totalStep.value = 1;

    final FirestoreController controller = Get.find<FirestoreController>();

    saveBackupData();

    controller.initDefaultSetting();
    BackupData? initialData = await controller.readData();
    if (initialData == null) {
      _downloadComplete.value = false;
      _downloadLoading.value = false;
      _downloadError.value = true;
      return;
    }

    nendoList.value = [];

    _currentStep.value++;
    setList.addAll(initialData.setList);
    nendoList.addAll(initialData.nendoList);

    if (backupNendoList.isNotEmpty) {
      for (int i = backupNendoList.length - 1; i >= 0; i--) {
        NendoData backupData = backupNendoList[i];
        int index = nendoList.indexWhere((newItem) => newItem.num == backupData.num);
        if (index >= 0) {
          nendoList[index] = backupData.copyWith();
        }
      }
    }

    // 넨도데이터 로컬 DB에 저장
    for (NendoData data in nendoList) {
      await nendoBox.put(data.num, data);
    }

    // 세트데이터 로컬 DB에 저장
    for (SetData data in setList) {
      await setBox.put(data.setName, data);
    }
    
    // 로컬 커밋날짜 저장
    DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm");
    String localCommitDate = formatter.format(DateTime.parse(initialData.backupDate));

    settingBox.put(HiveName.localCommitDateKey, localCommitDate);
    settingBox.put(HiveName.localCommitHashKey, initialData.commitHash);
    _localCommitDate.value = localCommitDate;
    _localCommitHash.value = initialData.commitHash;

    // 서버에 있는 커밋날짜를 받아와준다.
    try {
      dynamic data = await fetchServerCommitData();
      _serverCommitDate.value = IntlUtil.convertDate(gmtTime: data['commit']['commit']['author']['date']);
    } catch (error, stackTrace) {
      logger.e(error.toString());
      logger.e(stackTrace.toString());
    }

    // 정렬
    sortNendoList();

    // 다운로드 완료 후 설정
    backupNendoList = [];
    _downloadComplete.value = true;
    _downloadLoading.value = false;
    return;
  }

  Future fetchData() async {
    // 다운로드 관련 데이터 초기화
    _downloadComplete.value = false;
    _downloadLoading.value = true;
    _downloadError.value = false;
    _currentStep.value = 0;
    _totalStep.value = 0;

    // 서버에러로 리스트를 원복해야할 경우
    recoveryNendoList = nendoList.toList();
    nendoList.value = [];

    try {
      // Get server commit data
      dynamic data = await fetchServerCommitData();

      // 서버 커밋 날짜 가져오기
      String commitDate = IntlUtil.convertDate(gmtTime: data['commit']['commit']['author']['date']);
      String commitHash = data['commit']['sha'];
      _serverCommitDate.value = commitDate;

      // 넨도로이드 폴더 목록 가져오기
      await fetchFolderNameList();

      // 세트리스트 가져오기
      List<String> nameList = await fetchSetNameList();
      await fetchSetList(nameList: nameList);

      // 넨도 폴더리스트를 순차적으로 돌면서 json 파싱
      for (int currentIndex = 0; currentIndex < folderNameList.length; currentIndex++) {
        List<String> jsonNameList = await fetchJsonNameList(currentIndex: currentIndex);
        await fetchNendoList(
          jsonList: jsonNameList,
          currentIndex: currentIndex,
        );
        // 다운로드 진행 상태 +1
        _currentStep.value = currentIndex + 1;
      }

      // 로컬 커밋날짜 저장
      settingBox.put(HiveName.localCommitDateKey, IntlUtil.convertDate());
      settingBox.put(HiveName.localCommitHashKey, commitHash);

      _localCommitDate.value = IntlUtil.convertDate();
      _localCommitHash.value = commitHash;
    } catch (error, stackTrace) {
      logger.d(error.toString());
      logger.d(stackTrace.toString());
      nendoList.value = recoveryNendoList.toList();
      _downloadComplete.value = false;
      _downloadLoading.value = false;
      _downloadError.value = true;
      return;
    }

    // 넨도데이터 로컬 DB에 저장
    for (NendoData data in nendoList) {
      await nendoBox.put(data.num, data);
    }

    // 세트데이터 로컬 DB에 저장
    for (SetData data in setList) {
      await setBox.put(data.setName, data);
    }

    // 정렬
    sortNendoList();

    // 다운로드 완료 후 설정
    backupNendoList = [];
    _downloadComplete.value = true;
    _downloadLoading.value = false;
  }

  void initNendoList() {
    nendoList.value = getLocalNendoList();
  }

  List<NendoData> getLocalNendoList() {
    // 내부 DB 에서 넨도리스트를 받아온다.
    return (nendoBox.values.toList() as List<NendoData>)..sort(sortOption);
  }

  void sortNendoList() {
    nendoList.sort(sortOption);
  }

  int sortOption(NendoData a, NendoData b) {
    // 넨도번호를 숫자 크기로 비교하기 위해서 순수하게 숫자만 남겨준다.
    int numA = int.parse(a.num.replaceAll(RegExp(r"[^0-9]"), ""));
    int numB = int.parse(b.num.replaceAll(RegExp(r"[^0-9]"), ""));

    String releaseA = a.releaseDate.isEmpty ? "" : a.releaseDate[a.releaseDate.length - 1];
    String releaseB = b.releaseDate.isEmpty ? "" : b.releaseDate[b.releaseDate.length - 1];

    SortData sortData = Get.find<BottomSheetController>().sortData;

    switch (sortData.sortingMethod) {
      case BottomSheetController.release:
        if (sortData.releaseSortOrder) {
          // 출시일 오름차순
          return releaseA.compareTo(releaseB);
        } else {
          return releaseB.compareTo(releaseA);
        }
      case BottomSheetController.num:
      default:
        if (sortData.numSortOrder) {
          // 오름차순 정렬
          if (numA > numB) {
            return 1;
          } else if (numA < numB) {
            return -1;
          } else {
            return a.num.compareTo(b.num);
          }
        } else {
          // 숫자 내림차순 정렬
          if (numA < numB) {
            return 1;
          } else if (numA > numB) {
            return -1;
          } else {
            // 숫자가 같은 넨도라는건 뒤에 문자가 붙는다는 뜻임 ex) 80-a, 80-b, 1080-DX 등등
            // 이럴경우 문자열 정렬 기능을 이용하여 정렬해준다.
            return b.num.compareTo(a.num);
          }
        }
    }
  }

  // DB 업데이트전에 데이터 백업
  void saveBackupData() {
    // 소지하고 있거나 위시넨도일경우 백업리스트에 저장
    backupNendoList = getLocalNendoList().where((item) => (item.have || item.wish) || item.memo != null).toList();
  }

  // 특정 규칙에 따라서 리스트를 필터링 해준다.
  void filteringList(bool refresh) {
    FilterData filterData = Get.find<BottomSheetController>().filterData;

    if (refresh) {
      searchInWord(lastWord);
    }

    if (filterData.haveFilter) {
      nendoList.value = nendoList.where((item) => item.have).toList();
    } else if (filterData.notHaveFilter) {
      nendoList.value = nendoList.where((item) => !item.have).toList();
    }

    if (filterData.wishFilter) {
      nendoList.value = nendoList.where((item) => item.wish).toList();
    }

    if (filterData.expectedFilter) {
      DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
      nendoList.value = nendoList.where((item) {
        if (item.releaseDate.isEmpty) {
          return false;
        }
        DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
        // 출시일이 오늘 날짜와 같거나 클때
        return !itemDate.isBefore(today);
      }).toList();
    }

    if (filterData.femaleFilter) {
      nendoList.value = nendoList.where((item) => item.gender == "F").toList();
    } else if (filterData.maleFilter) {
      nendoList.value = nendoList.where((item) => item.gender == "M").toList();
    } else if (filterData.etcFilter) {
      nendoList.value = nendoList.where((item) => item.gender != "F" && item.gender != "M").toList();
    }
  }

  // 입력받은 단어에 일치하는 리스트를 필터링해준다
  void searchInWord(String word) {
    lastWord = word;

    if (word.isEmpty) {
      initNendoList();
      return;
    }

    RegExp digitPattern = RegExp(r'\d+');

    // 숫자와 ~가 있을때만 ~검색 사용
    if (word.contains("~") && digitPattern.hasMatch(word)) {
      String startString = word.split("~").first.trim();
      String endString = word.split("~").last.trim();

      if (startString.isEmpty) {
        startString = "0";
      }
      if (endString.isEmpty) {
        endString = "9999999";
      }

      int start = int.parse(startString.replaceAll(RegExp(r"[^0-9]"), ""));
      int end = int.parse(endString.replaceAll(RegExp(r"[^0-9]"), ""));

      List<NendoData> tempList = getLocalNendoList()
          .where((item) => (item.name.ko?.toLowerCase() ?? "").contains(word.toLowerCase())
          || (item.name.en?.toLowerCase() ?? "").contains(word.toLowerCase())
          || (item.series.ko?.toLowerCase() ?? "").contains(word.toLowerCase())
          || (start <= int.parse(item.num.replaceAll(RegExp(r"[^0-9]"), ""))
              && int.parse(item.num.replaceAll(RegExp(r"[^0-9]"), "")) <= end))
          .toList();
      nendoList.value = tempList;

    } else {
      List<NendoData> tempList = getLocalNendoList()
          .where((item) => (item.name.ko?.toLowerCase() ?? "").contains(word.toLowerCase())
          || (item.name.en?.toLowerCase() ?? "").contains(word.toLowerCase())
          || (item.series.ko?.toLowerCase() ?? "").contains(word.toLowerCase())
          || (item.num) == word)
          .toList();
      nendoList.value = tempList;
    }

    filteringList(false);
  }

  // 선택한 넨도의 보유 여부를 수정함
  void updateHaveNendo(String number) async {
    NendoData item = nendoList.where((element) => element.num == number).first;
    item.have = !item.have;
    // 보유넨도가 됐을경우 수량을 1로 수정
    if (item.have && item.count == 0) {
      item.count = 1;
    }
    nendoBox.put(item.num, item);
    nendoList.refresh();
  }

  // 선택한 넨도의 위시 여부를 수정함
  void updateWishNendo(String number) async {
    NendoData item = nendoList.where((element) => element.num == number).first;
    item.wish = !item.wish;
    nendoBox.put(item.num, item);
    nendoList.refresh();
  }

  // 번호로 넨도 데이터 가져오기
  NendoData getNendoData(String number) {
    return nendoList.where((item) => item.num == number).first;
  }

  // 넨도 구매 가격 변경
  void setNendoPurchasePrice(String number, int? price) {
    NendoData item = nendoList.where((element) => element.num == number).first;
    item.myPrice = price;
    nendoBox.put(item.num, item);
    nendoList.refresh();
  }

  // 보유 넨도개수 조절
  void setNendoHaveCount(String number, int count) async {
    // 소유하고 있다면 1개 밑으로 내려갈 수 없으므로
    if (count <= 0) {
      return;
    }
    NendoData item = nendoList.where((element) => element.num == number).first;
    item.count = count;
    nendoBox.put(item.num, item);
    nendoList.refresh();
  }

  // 넨도 메모 저장
  void setNendoMemo(String number, List<String> memo) {
    NendoData item = nendoList.where((element) => element.num == number).first;
    if (item.memo != null) {
      item.memo!.addAll(memo);
    } else {
      item.memo = [...memo];
    }
    nendoBox.put(item.num, item);
    nendoList.refresh();
  }

  // 넨도 메모 삭제
  void deleteNendoMemo(String number, String memo) {
    NendoData item = nendoList.where((element) => element.num == number).first;
    if (item.memo != null) {
      item.memo!.remove(memo);
    }
    nendoBox.put(item.num, item);
    nendoList.refresh();
  }

  String? getGithubTokenKey() {
    if (githubToken == "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" || githubToken.isEmpty) {
      return null;
    } else {
      return githubToken;
    }
  }

  // 넨도로이드 폴더명을 받아옴.
  Future fetchFolderNameList() async {
    List<Repo> repoList = await getRepoClient().getRepoList("");
    List<String> nameList = repoList.map((e) => e.name).toList();
    // 정규식을 통해서 유효한 넨도 폴더명만 남겨둔다 ex) Set폴더 제외
    nameList = nameList.where((element) => folderReg.hasMatch(element)).toList();
    folderNameList.value = nameList;
    _totalStep.value = nameList.length;
  }

  // 넨도로이드 json 파일명을 받아옴
  Future<List<String>> fetchJsonNameList({required int currentIndex}) async {
    String number = folderNameList[currentIndex];
    List<Repo> repoList = await getRepoClient().getRepoList(number);
    List<String> nameList = repoList.map((e) => e.name).toList();
    return nameList;
  }

  // Set json 파일명을 받아옴
  Future<List<String>> fetchSetNameList() async {
    List<Repo> repoList = await getRepoClient().getRepoList("Set");
    List<String> nameList = repoList.map((e) => e.name).toList();
    return nameList;
  }

  // json 이름이 적힌 리스트를 받아서 넨도로이드 json 을 디코딩한뒤 리스트로 저장한다.
  Future fetchNendoList({required List<String> jsonList, required int currentIndex}) async {
      FutureGroup<NendoData> futureGroup = FutureGroup();
      for (int i = 0; i < jsonList.length; i++) {
        futureGroup.add(getNendoClient().getNendoData(folderNameList[currentIndex], jsonList[i]));
      }
      futureGroup.close();
      final List<NendoData> result = await futureGroup.future;
      // 백업 데이터가 있을경우 백업
      if (backupNendoList.isNotEmpty) {
        for (int i = backupNendoList.length - 1; i >= 0; i--) {
          NendoData backupData = backupNendoList[i];
          NendoData? newNendoData = result.firstWhereOrNull((newItem) => newItem.num == backupData.num);
          if (newNendoData != null) {
            newNendoData.count = backupData.count;
            newNendoData.have = backupData.have;
            newNendoData.wish = backupData.wish;
            newNendoData.myPrice = backupData.myPrice;
            newNendoData.memo = backupData.memo?.toList();
            // 계속해서 백업데이터를 확인하지 않도록 제거해준다.
            backupNendoList.removeAt(i);
          }
        }
      }
      nendoList.addAll(result);
  }

  // 파이어스토어에 저장된 데이터를 복구한다.
  Future<void> restoreBackupList(BackupData backupData) {
    _localCommitDate.value = backupData.commitDate;
    _localCommitHash.value = backupData.commitHash;
    // 깊은 복사를 해야 'Cannot remove from an unmodifiable list' 에러를 피할 수 있음.
    backupNendoList = backupData.nendoList.toList();

    try {
      for (int i = backupNendoList.length - 1; i >= 0; i--) {
            NendoData backupData = backupNendoList[i];
            NendoData? nendoData = nendoList.firstWhereOrNull((newItem) => newItem.num == backupData.num);
            if (nendoData != null) {
              nendoData.count = backupData.count;
              nendoData.have = backupData.have;
              nendoData.wish = backupData.wish;
              nendoData.myPrice = backupData.myPrice;
              nendoData.memo = backupData.memo?.toList();

              nendoBox.put(nendoData.num, nendoData);
              // 계속해서 백업데이터를 확인하지 않도록 제거해준다.
              backupNendoList.removeAt(i);
            }
            nendoList.refresh();
          }
      return Future.value();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // 세트 리스트를 가져옴
  Future fetchSetList({required List<String> nameList}) async {
    setList.clear();
    int loopCount = nameList.length ~/ 100 + 1;
    for (int j = 0; j < loopCount; j++) {
      FutureGroup<SetData> futureGroup = FutureGroup();
      for (int i = j * 100; i < (j + 1) * 100; i++) {
        if (i == nameList.length) {
          break;
        }
        futureGroup.add(getNendoClient().getSetData("Set", nameList[i]));
      }
      futureGroup.close();
      final List<SetData> result = await futureGroup.future;
      setList.addAll(result);
    }
  }

  // 넨도 데이터 다운로드가 필요한지 확인
  bool needNendoDataDownload() {
    return nendoList.isEmpty &&
        initComplete &&
        downloadComplete &&
        downloadLoading &&
        downloadError;
  }

  // DB 데이터의 마지막 업데이트(커밋) 날짜를 받아옴
  Future<dynamic> fetchServerCommitData() async {
    Dio dio = Dio()..options.headers["Authorization"] = githubToken;
    final response = await dio.get("https://api.github.com/repos/KhoraLee/NendoroidDB/branches/master");
    return response.data;
  }

  // 헤더에 Github API 호출을 위한 토큰값 추가
  RestClient getRepoClient() {
    return RestClient(Dio()..options.headers["Authorization"] = githubToken);
  }

  // 넨도 json rawFile 을 읽었을때 json 이 아닌 text/plain 으로 읽어오기 때문에 json 으로 디코딩해주는 작업이 필요
  // 넨도 json 파일을 읽을때는 깃허브 API 권한이 필요없기 때문에 헤더값에 토큰값은 넣지 않음
  // 23/03/01 dio 버전 업데이트 이후에 바로 json으로 인식 되는듯?.... 오히려 변환시키면 Map타입을 String 타입으로 바꿀 수 없다고 에러가 발생함.
  RestClient getNendoClient() {
    return RestClient(Dio()
      /*..interceptors.add(InterceptorsWrapper(onResponse: (res, handler) async {
        logger.i('res : ${res.data.toString()}');
        if (res.headers.map[Headers.contentTypeHeader]?.first.startsWith('text') == true) {
          res.data = jsonDecode(res.data as String);
          return handler.next(res);
        }
        return handler.next(res);
      }))*/);
  }

  // DB 데이터의 총 용량을 받아옴
  Future<void> getRepoSize() async {
    try {
      Dio dio = Dio()..options.headers["Authorization"] = githubToken;
      final response = await dio.get("https://api.github.com/repos/KhoraLee/NendoroidDB");
      int data = response.data['size'];
      double mbSize = data / 1000;
      dataSize = "${mbSize.toStringAsFixed(2)}MB";
    } catch (error, stackTrace) {
      logger.d(error.toString());
      logger.d(stackTrace.toString());
      dataSize = "2MB";
    }
  }
}
