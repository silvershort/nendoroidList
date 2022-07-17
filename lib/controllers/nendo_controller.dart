import 'dart:convert';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/models/exchange_rate_yen.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/gender_rate.dart';
import 'package:nendoroid_db/models/most_series.dart';
import 'package:nendoroid_db/models/sort_data.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';

import '../models/nendo_data.dart';
import '../models/repo.dart';
import '../models/set_data.dart';
import '../services/rest_client.dart';
import 'bottom_sheet_controller.dart';

class NendoController extends GetxController {
  // 폴더목록 필터링을 위한 정규식
  final RegExp folderReg = RegExp(r"[0-9][-][0-9]");

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
  // 필터 적용중에는 넨도리스트가 줄어들기 때문에 마이페이지에서 보여줄 넨도 리스트를 임시로 담는다.
  RxList<NendoData> myNendoList = <NendoData>[].obs;

  // 앱 실행시 초기화까지 걸리는 로딩
  RxBool initComplete = false.obs;

  // API 호출로 데이터를 받아올때 로딩
  RxBool downloadLoading = false.obs;

  // 데이터 다운 완료 플래그
  RxBool downloadComplete = false.obs;
  RxBool downloadError = false.obs;

  // 다운로드 진행사항
  RxInt currentStep = 0.obs;
  RxInt totalStep = 0.obs;

  // 마지막 커밋 날짜
  RxString localCommitDate = "".obs;
  RxString serverCommitDate = "".obs;

  // 오늘의 엔화 환율
  RxInt todayYen = 0.obs;

  // 다운로드 용량
  String dataSize = "0MB";

  // 개인 Github Token
  RxString githubToken = "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".obs;

  // 최초 실행시 데이터 세팅
  Future init() async {
    getTodayYen();
    nendoBox = await Hive.openBox<NendoData>(HiveName.nendoBoxName);
    setBox = await Hive.openBox<SetData>(HiveName.setBoxName);
    settingBox = await Hive.openBox<String>(HiveName.settingBoxName);

    // github 토큰값 세팅
    String? tokenKey = settingBox.get(HiveName.githubTokenKey);
    if (tokenKey != null && tokenKey.isNotEmpty) {
      githubToken.value = tokenKey;
    }

    getRepoSize();

    if (nendoBox.isEmpty) {
      getRepoSize();
    } else {
      setList.value = setBox.values.toList() as List<SetData>;
      initNendoList();
      downloadComplete.value = true;
      try {
        // 서버에 있는 커밋날짜를 받아와준다.
        serverCommitDate.value = IntlUtil.convertDate(gmtTime: await getCommitDate());
      } catch (e) {
        print(e);
      }
      // 로컬에 있는 커밋날짜를 받아와준다.
      localCommitDate.value = settingBox.get(HiveName.localCommitDateKey);
    }
    initComplete.value = true;
  }

  Future fetchData() async {
    // 다운로드 관련 데이터 초기화
    downloadComplete.value = false;
    downloadLoading.value = true;
    downloadError.value = false;
    currentStep.value = 0;
    totalStep.value = 0;

    // 서버에러로 리스트를 원복해야할 경우
    recoveryNendoList = nendoList.toList();
    nendoList.value = [];

    try {
      // 서버 커밋 날짜 가져오기
      String commitDate = IntlUtil.convertDate(gmtTime: await getCommitDate());
      serverCommitDate.value = commitDate;

      // 로컬 커밋날짜 저장
      settingBox.put(HiveName.localCommitDateKey, IntlUtil.convertDate());
      localCommitDate.value = IntlUtil.convertDate();

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
        currentStep.value = currentIndex + 1;
      }
    } catch (e) {
      nendoList.value = recoveryNendoList.toList();
      downloadComplete.value = false;
      downloadLoading.value = false;
      downloadError.value = true;
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
    downloadComplete.value = true;
    downloadLoading.value = false;
  }

  void initNendoList() {
    nendoList.value = getLocalNendoList();
  }

  void setMyNendoList() {
    myNendoList.value = getLocalNendoList();
  }

  List<NendoData> getLocalNendoList() {
    // 내부 DB 에서 넨도리스트를 받아온다.
    return (nendoBox.values.toList() as List<NendoData>)
    ..sort((a, b) {
      // 넨도번호를 숫자 크기로 비교하기 위해서 순수하게 숫자만 남겨준다.
      int numA = int.parse(a.num.replaceAll(RegExp(r"[^0-9]"), ""));
      int numB = int.parse(b.num.replaceAll(RegExp(r"[^0-9]"), ""));


      String releaseA = a.releaseDate.isEmpty ? "" : a.releaseDate[a.releaseDate.length - 1];
      String releaseB = b.releaseDate.isEmpty ? "" : b.releaseDate[b.releaseDate.length - 1];
      // String releaseA = a.num;
      // String releaseB = b.num;

      SortData sortData = Get.find<BottomSheetController>().sortData.value;

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
    });
  }

  // DB 업데이트전에 데이터 백업
  void backupData() {
    // 소지하고 있거나 위시넨도일경우 백업리스트에 저장
    backupNendoList = nendoList.where((item) => item.have || item.wish).toList();
  }

  void sortNendoList() {
    nendoList.sort((a, b) {
      // 넨도번호를 숫자 크기로 비교하기 위해서 순수하게 숫자만 남겨준다.
      int numA = int.parse(a.num.replaceAll(RegExp(r"[^0-9]"), ""));
      int numB = int.parse(b.num.replaceAll(RegExp(r"[^0-9]"), ""));

      String releaseA = a.releaseDate.isEmpty ? "" : a.releaseDate[a.releaseDate.length - 1];
      String releaseB = b.releaseDate.isEmpty ? "" : b.releaseDate[b.releaseDate.length - 1];

      SortData sortData = Get.find<BottomSheetController>().sortData.value;

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
    });
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
        .where((item) => (item.name.ko ?? "").contains(word) || (item.name.en ?? "").contains(word) || (item.series.ko ?? "").contains(word))
        .toList();
    nendoList.value = tempList;
    filteringList(false);
  }

  // 선택한 넨도의 보유 여부를 수정함
  void updateHaveNendo(String number) async {
    NendoData item = nendoList.where((element) => element.num == number).first;
    item.have = !item.have;
    // 보유하고 있다면 개수 1로 수정, 미보유라면 0으로 수정
    if (item.have) {
      item.count = 1;
    } else {
      item.count = 0;
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

  // 현재 보유한 넨도로이드 개수를 알려줌
  int getHaveNendo() {
    return myNendoList.where((item) => item.have).length;
  }

  // 현재 보유한 넨도로이드 개수를 %로 보여줌
  double getHaveRate() {
    if (myNendoList.where((item) => item.have).isEmpty) {
      return 0;
    } else {
      return myNendoList.where((item) => item.have).length / myNendoList.length * 100;
    }
  }

  // 내가 구매한 넨도가격을 합산해줌
  int getSumPrice() {
    List<NendoData> haveList = myNendoList.where((item) => item.have).toList();
    int totalPrice = 0;
    for (NendoData element in haveList) {
      // 가격 * 보유개수
      if (element.myPrice != null) {
        totalPrice += element.myPrice! * element.count;
      } else {
        // 오늘의 환율을 정상적으로 못받았을경우 기본값 10
        double exchangeRate = todayYen.value == 0 ? 10 : todayYen.value / 100;
        totalPrice += (element.price * exchangeRate * element.count).toInt();
      }
    }
    return totalPrice;
  }

  // 넨도로이드 성별 비율과 개수를 반환
  List<GenderRate> getGenderRate() {
    List<NendoData> haveList = myNendoList.where((item) => item.have).toList();
    int femaleCount = haveList.where((item) => item.gender == "F").length;
    int maleCount = haveList.where((item) => item.gender == "M").length;
    int etcCount = haveList.where((item) => (item.gender != "F" && item.gender != "M")).length;

    List<GenderRate> genderRateList = [];
    genderRateList.add(GenderRate(
      gender: "여성",
      count: femaleCount,
      rate: haveList.isEmpty ? 0 : femaleCount / haveList.length * 100,
    ));
    genderRateList.add(GenderRate(
      gender: "남성",
      count: maleCount,
      rate: haveList.isEmpty ? 0 : maleCount / haveList.length * 100,
    ));
    genderRateList.add(GenderRate(
      gender: "기타",
      count: etcCount,
      rate: haveList.isEmpty ? 0 : etcCount / haveList.length * 100,
    ));
    genderRateList.sort((a, b) => b.rate.compareTo(a.rate));
    return genderRateList;
  }

  // 가장 많이 가지고 있는 넨도로이드 시리즈와 개수를 반환
  MostSeries? getMostHaveSeries() {
    List<NendoData> haveList = myNendoList.where((item) => item.have).toList();
    String mostSeries = "";
    int mostCount = 0;
    Set<String> completion = <String>{};

    for (int i = 0; i < haveList.length; i++) {
      // null 체크 및 완료리스트에 없는지 확인
      if (haveList[i].series.ko != null && !completion.contains(haveList[i].series.ko)) {
        // 완료리스트에 추가
        completion.add(haveList[i].series.ko!);
        // 같은 시리즈 넨도 리스트를 모아줌
        List<NendoData> tempList = haveList.where((element) => element.series.ko == haveList[i].series.ko).toList();
        // 해당 시리즈 넨도의 갯수 총합을 구함
        int currentCount = tempList.map((e) => e.count).fold(0, (previousValue, amount) => previousValue + amount);

        if (mostCount < currentCount) {
          mostSeries = haveList[i].series.ko!;
          mostCount = currentCount;
        }
      }
    }

    // 가장 많은 시리즈가 단 1개일경우 보여주지 않는다.
    if (mostCount == 1) {
      return null;
    } else {
      return MostSeries(series: mostSeries, count: mostCount);
    }
  }

  // 가장 많이 가지고 있는 넨도로이드를 반환
  List<NendoData> getMostHaveNendo() {
    List<NendoData> sortList = myNendoList.toList()..sort((a, b) => b.count.compareTo(a.count));

    if (sortList.isEmpty) {
      return [];
    }

    List<NendoData> mostHaveList = [];
    int mostCount = sortList[0].count;

    // 2개 이상 가진 넨도가 없다면 빈 리스트를 반환
    if (mostCount < 2) {
      return mostHaveList;
    }

    // 최대 개수인 넨도가 여러개일 수 있으므로 내림차순으로 정렬된 리스트를 돌면서 mostCount 가 같은 넨도를 모두 추가한다.
    for (var element in sortList) {
      if (element.count == mostCount) {
        mostHaveList.add(element);
      } else {
        break;
      }
    }
    return mostHaveList;
  }

  // 내가 보유한 넨도 세트 리스트를 반환해줌
  List<String> getCompleteSetList() {
    List<String> completeList = [];
    List<NendoData> haveList = myNendoList.where((item) => item.have).toList();
    for (SetData setData in setList) {
      // 보유한 넨도 리스트에서 같은 시리즈 이름을 가진 리스트를 뽑고 거기서 넨도 번호를 받아온다.
      List<String> tempHaveSetList = haveList.where((item) => (item.series.ko ?? "").contains(setData.setName)).map((e) => e.num).toList();

      // 리스트 비교를 위해 오름차순 정렬
      tempHaveSetList.sort();
      setData.list.sort();

      // 세트 전체 넨도 번호 리스트와 보유한 넨도 리스트가 같은지 비교 후 같다면 completeList에 추가한다.
      if (listEquals(tempHaveSetList, setData.list)) {
        completeList.add(setData.setName);
      }
    }
    return completeList;
  }

  // 이번달 출시예정인 구매 넨도
  List<NendoData> getThisMonthHaveList() {
    List<NendoData> haveList = myNendoList.where((item) => item.have).toList();
    DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);

    return haveList.where((item) {
      DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
      return itemDate.compareTo(today) == 0;
    }).toList();
  }

  // 이번달 출시예정인 위시 넨도
  List<NendoData> getThisMonthWishList() {
    List<NendoData> wishList = myNendoList.where((item) => item.wish).toList();
    DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
    return wishList.where((item) {
      DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
      return itemDate.compareTo(today) == 0;
    }).toList();
  }

  // 환율 정보를 받아옴
  void getTodayYen() async {
    try {
      List<ExchangeRateYen> list = await RestClient(Dio()).getExchangeRate();
      todayYen.value = list[0].basePrice?.toInt() ?? 0;
    } catch (e) {
      print(e);
    }
  }

  // 개인용 깃허브 API 키를 등록해줌
  void setGithubTokenKey(String tokenKey) {
    if (tokenKey.isEmpty) {
      settingBox.delete(HiveName.githubTokenKey);
      return;
    }
    settingBox.put(HiveName.githubTokenKey, tokenKey);
    githubToken.value = tokenKey;
  }

  String? getGithubTokenKey() {
    if (githubToken.value == "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" || githubToken.value.isEmpty) {
      return null;
    } else {
      return githubToken.value;
    }
  }

  // 넨도로이드 폴더명을 받아옴.
  Future fetchFolderNameList() async {
    List<Repo> repoList = await getRepoClient().getRepoList("");
    List<String> nameList = repoList.map((e) => e.name).toList();
    // 정규식을 통해서 유효한 넨도 폴더명만 남겨둔다 ex) Set폴더 제외
    nameList = nameList.where((element) => folderReg.hasMatch(element)).toList();
    folderNameList.value = nameList;
    totalStep.value = nameList.length;
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

  // 헤더에 Github API 호출을 위한 토큰값 추가
  RestClient getRepoClient() {
    return RestClient(Dio()..options.headers["Authorization"] = githubToken.value);
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

  // DB 데이터의 마지막 업데이트(커밋) 날짜를 받아옴
  Future<String> getCommitDate() async {
    Dio dio = Dio()..options.headers["Authorization"] = githubToken.value;
    final response = await dio.get("https://api.github.com/repos/KhoraLee/NendoroidDB/branches/master");
    String date = response.data['commit']['commit']['author']['date'];
    return date;
  }

  // DB 데이터의 총 용량을 받아옴
  Future<void> getRepoSize() async {
    try {
      Dio dio = Dio()..options.headers["Authorization"] = githubToken.value;
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
