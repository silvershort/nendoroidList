import 'dart:convert';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/sort_data.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';

import '../models/nendo_data.dart';
import '../models/repo.dart';
import '../models/set_data.dart';
import '../services/rest_client.dart';
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
        // 서버에 있는 커밋날짜를 받아와준다.
        _serverCommitDate.value = IntlUtil.convertDate(gmtTime: await fetchServerCommitDate());
      } catch (e) {
        print(e);
      }
      // 로컬에 있는 커밋날짜를 받아와준다.
      _localCommitDate.value = settingBox.get(HiveName.localCommitDateKey);
    }
    _initComplete.value = true;
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
      // 서버 커밋 날짜 가져오기
      String commitDate = IntlUtil.convertDate(gmtTime: await fetchServerCommitDate());
      _serverCommitDate.value = commitDate;

      // 넨도로이드 폴더 목록 가져오기
      await fetchFolderNameList();
      // 세트리스트 가져오기
      await fetchSetList(nameList: fetchSetNameList());

      // 넨도 폴더리스트를 순차적으로 돌면서 json 파싱
      for (int currentIndex = 0; currentIndex < folderNameList.length; currentIndex++) {
        await fetchNendoList(
          nameList: fetchJsonNameList(currentIndex: currentIndex),
          currentIndex: currentIndex,
        );
        // 다운로드 진행 상태 +1
        _currentStep.value = currentIndex + 1;
      }

      // 로컬 커밋날짜 저장
      settingBox.put(HiveName.localCommitDateKey, IntlUtil.convertDate());
      _localCommitDate.value = IntlUtil.convertDate();
    } catch (e) {
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
  void backupData() {
    // 소지하고 있거나 위시넨도일경우 백업리스트에 저장
    backupNendoList = nendoList.where((item) => item.have || item.wish).toList();
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
    }
  }

  // 입력받은 단어에 일치하는 리스트를 필터링해준다
  void searchInWord(String word) {
    lastWord = word;
    if (word.isEmpty) {
      initNendoList();
      return;
    }
    List<NendoData> tempList = getLocalNendoList()
        .where((item) => (item.name.ko?.toLowerCase() ?? "").contains(word.toLowerCase())
        || (item.name.en?.toLowerCase() ?? "").contains(word.toLowerCase())
        || (item.series.ko?.toLowerCase() ?? "").contains(word.toLowerCase())
        || (item.num) == word)
        .toList();
    nendoList.value = tempList;
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
  Future fetchNendoList({required Future<List<String>> nameList, required int currentIndex}) async {
    await nameList.then((value) async {
      FutureGroup<NendoData> futureGroup = FutureGroup();
      for (int i = 0; i < value.length; i++) {
        futureGroup.add(getNendoClient().getNendoData(folderNameList[currentIndex], value[i]));
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
    });
  }

  // 세트 리스트를 가져옴
  Future fetchSetList({required Future<List<String>> nameList}) async {
    await nameList.then((value) async {
      FutureGroup<SetData> futureGroup = FutureGroup();
      for (int i = 0; i < value.length; i++) {
        futureGroup.add(getNendoClient().getSetData("Set", value[i]));
      }
      futureGroup.close();
      final List<SetData> result = await futureGroup.future;
      setList.addAll(result);
    });
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
  Future<String> fetchServerCommitDate() async {
    Dio dio = Dio()..options.headers["Authorization"] = githubToken;
    final response = await dio.get("https://api.github.com/repos/KhoraLee/NendoroidDB/branches/master");
    String date = response.data['commit']['commit']['author']['date'];
    return date;
  }

  // 헤더에 Github API 호출을 위한 토큰값 추가
  RestClient getRepoClient() {
    return RestClient(Dio()..options.headers["Authorization"] = githubToken);
  }

  // 넨도 json rawFile 을 읽었을때 json 이 아닌 text/plain 으로 읽어오기 때문에 json 으로 디코딩해주는 작업이 필요
  // 넨도 json 파일을 읽을때는 깃허브 API 권한이 필요없기 때문에 헤더값에 토큰값은 넣지 않음
  RestClient getNendoClient() {
    return RestClient(Dio()
      ..interceptors.add(InterceptorsWrapper(onResponse: (res, handler) async {
        if (res.headers.map[Headers.contentTypeHeader]?.first.startsWith('text') == true) {
          res.data = jsonDecode(res.data as String);
          return handler.next(res);
        }
        return handler.next(res);
      })));
  }

  // DB 데이터의 총 용량을 받아옴
  Future<void> getRepoSize() async {
    try {
      Dio dio = Dio()..options.headers["Authorization"] = githubToken;
      final response = await dio.get("https://api.github.com/repos/KhoraLee/NendoroidDB");
      int data = response.data['size'];
      double mbSize = data / 1000;
      dataSize = "${mbSize.toStringAsFixed(2)}MB";
    } catch (e) {
      print(e);
      dataSize = "2MB";
    }
  }
}
