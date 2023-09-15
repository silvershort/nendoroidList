import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/models/gender_rate.dart';
import 'package:nendoroid_db/models/most_series.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/models/sort_data.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/utilities/extension/num_extension.dart';
import 'package:nendoroid_db/utilities/extension/string_extension.dart';

extension NendoListExtension on List<NendoData> {
  // 넨도로이드를 정렬 조건에 맞춰 정렬
  void sortBySetting(NendoListSettingState settingState) {
    sort(
      (a, b) {
        // 넨도번호를 숫자 크기로 비교하기 위해서 순수하게 숫자만 남겨준다.
        int numA = int.parse(a.num.replaceAll(RegExp(r"[^0-9]"), ""));
        int numB = int.parse(b.num.replaceAll(RegExp(r"[^0-9]"), ""));

        String releaseA = a.releaseDate.isEmpty ? "" : a.releaseDate[a.releaseDate.length - 1];
        String releaseB = b.releaseDate.isEmpty ? "" : b.releaseDate[b.releaseDate.length - 1];

        SortData sortData = settingState.sortData;

        switch (sortData.sortingMethod) {
          case SortingMethodNum():
            switch (sortData.sortingOrder) {
              case ASC():
                // 숫자 오름차순 정렬
                if (numA > numB) {
                  return 1;
                } else if (numA < numB) {
                  return -1;
                } else {
                  return a.num.compareTo(b.num);
                }
              case DESC():
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
          // 출시일 기준 정렬
          case SortingMethodRelease():
            switch (sortData.sortingOrder) {
              case ASC():
                return releaseA.compareTo(releaseB);
              case DESC():
                return releaseB.compareTo(releaseA);
            }
        }
      },
    );
  }

  // 중복을 제외한 보유 넨도 개수
  int getHaveCount() {
    return where((item) => item.have).length;
  }

  // 중복을 포함한 총 보유 넨도 개수
  int getTotalHaveCount() {
    List<NendoData> haveList = where((item) => item.have).toList();
    return haveList.fold(0, (previousValue, element) => previousValue + element.count);
  }

  // 보유한 넨도의 비율
  double getHaveRate() {
    if (where((item) => item.have).isEmpty) {
      return 0;
    } else {
      return where((item) => item.have).length / length * 100;
    }
  }

  // 내가 보유한 넨도 세트 리스트를 반환해줌
  List<String> getCompleteSetList(List<SetData> setList) {
    List<String> completeList = [];
    List<NendoData> haveList = where((item) => item.have).toList();
    for (SetData setData in setList) {
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

  // 보유한 넨도의 성별 비율을 보여줌
  List<GenderRate> getGenderRate() {
    List<NendoData> haveList = where((item) => item.have).toList();
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

  // 가장 많이 가지고 있는 넨도로이드를 반환
  List<NendoData> getMostHaveNendo() {
    List<NendoData> haveList = where((item) => item.have).toList();
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

  // 가장 많이 가지고 있는 넨도로이드 시리즈와 개수를 반환
  MostSeries? getMostHaveSeries() {
    List<NendoData> haveList = where((item) => item.have).toList();
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

  // 이번달 출시예정인 구매 넨도
  List<NendoData> getThisMonthHaveList() {
    List<NendoData> haveList = where((item) => item.have).toList();
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
    List<NendoData> wishList = where((item) => item.wish).toList();
    DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
    return wishList.where((item) {
      if (item.releaseDate.isEmpty) {
        return false;
      }
      DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
      return itemDate.compareTo(today) == 0;
    }).toList();
  }

  // 내가 구매한 넨도가격을 합산해줌
  int getSumPrice(int todayYen) {
    List<NendoData> haveList = where((item) => item.have).toList();
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

  // 넨도 그룹핑 작업을 해준다.
  Map<int, List<NendoData>> getNendoNumberGroupList() {
    // 그룹화된 데이터를 저장할 맵
    Map<int, List<NendoData>> groupedData = {};

    for (NendoData nendoData in this) {
      int groupKey = nendoData.num.onlyNumber.roundTo100();
      if (!groupedData.containsKey(groupKey)) {
        groupedData[groupKey] = [];
      }
      groupedData[groupKey]!.add(nendoData);
    }
    return groupedData;
  }

  Map<String, List<NendoData>> getNendoSeriesGroupList() {
    // 그룹화된 데이터를 저장할 맵
    Map<String, List<NendoData>> groupedData = {};

    for (NendoData nendoData in this) {
      String groupKey = nendoData.series.ko ?? '알수없음';
      if (!groupedData.containsKey(groupKey)) {
        groupedData[groupKey] = [];
      }
      groupedData[groupKey]!.add(nendoData);
    }
    return groupedData;
  }
}
