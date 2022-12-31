import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/main.dart';

import '../models/exchange_rate_yen.dart';
import '../models/gender_rate.dart';
import '../models/most_series.dart';
import '../models/nendo_data.dart';
import '../models/set_data.dart';
import '../services/rest_client.dart';

class MyController extends GetxController {

  final NendoController nendoController = Get.find<NendoController>();

  // 필터 적용중에는 넨도리스트가 줄어들기 때문에 마이페이지에서 보여줄 넨도 리스트를 임시로 담는다.
  RxList<NendoData> myNendoList = <NendoData>[].obs;

  // 오늘의 엔화 환율
  final RxInt _todayYen = 0.obs;
  int get todayYen => _todayYen.value;

  @override
  void onInit() {
    super.onInit();
    getTodayYen();
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
        double exchangeRate = todayYen == 0 ? 10 : todayYen / 100;
        totalPrice += (element.price * exchangeRate * element.count).toInt();
      }
    }
    return totalPrice;
  }

  void setMyNendoList() {
    myNendoList.value = nendoController.getLocalNendoList();
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
    List<NendoData> haveList = myNendoList.where((item) => item.have).toList();
    List<NendoData> sortList = haveList..sort((a, b) => b.count.compareTo(a.count));

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
    for (SetData setData in nendoController.setList) {
      // 보유한 넨도 리스트에서 같은 시리즈 이름을 가진 리스트를 뽑고 거기서 넨도 번호를 받아온다.
      List<String> tempHaveSetList = haveList.where((item) => (item.series.ko ?? "").contains(setData.setName)).map((e) => e.num).toList();

      // TODO: 추후 사용자 선택에 따라서 파생제품까지 세트 컴플리트 조건으로 할지 결정하도록 수정
      if (true) {
        // 순수 숫자만 남기고 중복되는 숫자를 제거하여 DX같은 파생상품을 지운다
        for (int i = 0; i < setData.list.length; i++) {
          setData.list[i] = setData.list[i].replaceAll(RegExp(r"[^0-9]"), "");
        }
        for (int i = 0; i < tempHaveSetList.length; i++) {
          tempHaveSetList[i] = tempHaveSetList[i].replaceAll(RegExp(r"[^0-9]"), "");
        }
        tempHaveSetList = tempHaveSetList.toSet().toList();
        setData.list = setData.list.toSet().toList();
      }

      // 리스트 비교를 위해 오름차순 정렬
      tempHaveSetList.sort();
      setData.list.sort();

      // 세트 전체 넨도 번호 리스트와 보유한 넨도 리스트가 같은지 비교 후 같다면 completeList에 추가한다.
      if (listEquals(tempHaveSetList, setData.list)) {
        completeList.add(setData.setName);
      }
    }
    // 혹시라도 중복해서 세트가 들어갔다면 중복 아이템을 제거
    return completeList.toSet().toList();
  }

  // 이번달 출시예정인 구매 넨도
  List<NendoData> getThisMonthHaveList() {
    List<NendoData> haveList = myNendoList.where((item) => item.have).toList();
    DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
    return haveList.where((item) {
      if (item.releaseDate.isEmpty) {
        return false;
      }
      DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
      return itemDate.compareTo(today) == 0;
    }).toList();
  }

  // 이번달 출시예정인 위시 넨도
  List<NendoData> getThisMonthWishList() {
    List<NendoData> wishList = myNendoList.where((item) => item.wish).toList();
    DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
    return wishList.where((item) {
      if (item.releaseDate.isEmpty) {
        return false;
      }
      DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
      return itemDate.compareTo(today) == 0;
    }).toList();
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

  // 환율 정보를 받아옴
  void getTodayYen() async {
    try {
      List<ExchangeRateYen> list = await RestClient(Dio()).getExchangeRate();
      _todayYen.value = list[0].ttSellingPrice?.toInt() ?? 0;
    } catch (error, stackTrace) {
      logger.e(error, stackTrace);
    }
  }
}