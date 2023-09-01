import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/main_new.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/models/sort_data.dart';
import 'package:nendoroid_db/networks/services/firebase_service.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_provider.freezed.dart';

part 'nendo_provider.g.dart';

@riverpod
class Nendo extends _$Nendo {
  @override
  FutureOr<NendoState> build() async {
    return fetchData();
  }

  // 넨도리스트를 로컬 or 원격에서 가져온다.
  Future<NendoState> fetchData() async {
    // 로컬에 데이터가 있는지 유무를 판단하기 위해서 로컬DB를 가져온다.
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    final Box setBox = ref.watch(hiveProvider).nendoBox;

    // 로컬이 비어있을경우 파이어베이스에서 다운로드
    if (nendoBox.isEmpty) {
      final NendoState nendoState = await fetchFromFirebase();
      state = AsyncData(nendoState);
      return nendoState;
    }
    // 로컬에서 넨도와 세트 정보를 가져온 후 정렬
    else {
      try {
        final List<NendoData> nendoList = nendoBox.values.map((e) => e as NendoData).toList();
        logger.i(setBox.values.toString());
        final List<SetData> setList = setBox.values.map((e) => e as SetData).toList();

        sortNenedoList(nendoList);
        final NendoState nendoState = NendoState(
          nendoList: nendoList,
          filteredNendoList: nendoList,
          setList: setList,
        );
        state = AsyncData(nendoState);
        return nendoState;
      } catch (error, stackTrace) {
        logger.e(error, stackTrace: stackTrace);
        state = AsyncError(error, stackTrace);
        return Future.error(error, stackTrace);
      }
    }
  }

  // 파이어베이스를 통해서 넨도로이드 초기 데이터를 받아온다.
  Future<NendoState> fetchFromFirebase() async {
    final result = await ref.watch(firebaseServiceProvider).getInitData();

    return result.when(
      success: (value) async {
        logger.i(value.setList.toString());

        final List<NendoData> sortList = [...value.nendoList];
        sortNenedoList(sortList);

        await saveLocalDB(
          nendoList: sortList,
          setList: value.setList,
        );

        final NendoState nendoState = NendoState(
          nendoList: value.nendoList,
          setList: value.setList,
          filteredNendoList: value.nendoList,
        );
        state = AsyncData(nendoState);
        return nendoState;
      },
      error: (error, stackTrace) {
        state = AsyncError(error, stackTrace);
        return Future.error(error, stackTrace);
      },
    );
  }

  // 입력받은 검색어를 통해서 넨도목록 필터링을 진행한다.
  void searchToWord(String word) {
    if (word.isEmpty) {
      filterClear();
      return;
    }

    RegExp digitPattern = RegExp(r'\d+');

    late List<NendoData> tempList;

    // 숫자 범위 검색, 숫자와 ~가 있을때만 ~검색 사용
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

      tempList = state.value!.nendoList
          .where((item) =>
              (item.name.ko?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
              (item.name.en?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
              (item.series.ko?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
              (start <= int.parse(item.num.replaceAll(RegExp(r"[^0-9]"), "")) && int.parse(item.num.replaceAll(RegExp(r"[^0-9]"), "")) <= end))
          .toList();
    }
    // 일반 검색
    else {
      tempList = state.value!.nendoList
          .where((item) =>
              (item.name.ko?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
              (item.name.en?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
              (item.series.ko?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
              (item.num) == word)
          .toList();
    }

    // 검색어에 맞는 넨도 리스트의 필터링을 진행
    filteringList(nendoList: tempList);
  }

  // 특정 규칙에 따라서 리스트를 필터링 해준다.
  void filteringList({List<NendoData>? nendoList}) {
    final settingState = ref.watch(nendoListSettingProvider);
    FilterData filterData = settingState.filterData;

    // 특정 넨도 리스트(파라미터로 받은 값)을 대상으로 진행할지 전체 리스트로 진행할지 결정
    List<NendoData> tempList = nendoList ?? [...state.value!.nendoList];

    if (filterData.haveFilter) {
      tempList = tempList.where((item) => item.have).toList();
    } else if (filterData.notHaveFilter) {
      tempList = tempList.where((item) => !item.have).toList();
    }

    if (filterData.wishFilter) {
      tempList = tempList.where((item) => item.wish).toList();
    }

    if (filterData.expectedFilter) {
      DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
      tempList = tempList.where((item) {
        if (item.releaseDate.isEmpty) {
          return false;
        }
        DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
        // 출시일이 오늘 날짜와 같거나 클때
        return !itemDate.isBefore(today);
      }).toList();
    }

    if (filterData.femaleFilter) {
      tempList = tempList.where((item) => item.gender == "F").toList();
    } else if (filterData.maleFilter) {
      tempList = tempList.where((item) => item.gender == "M").toList();
    } else if (filterData.etcFilter) {
      tempList = tempList.where((item) => item.gender != "F" && item.gender != "M").toList();
    }

    // 필터링 완료한 리스트를 넣어준다.
    state = AsyncData(
      state.value!.copyWith(
        filteredNendoList: tempList,
      ),
    );
  }

  // 입력받은 리스트를 로컬DB에 저장해준다.
  Future<void> saveLocalDB({
    required List<NendoData> nendoList,
    required List<SetData> setList,
  }) async {
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    final Box setBox = ref.watch(hiveProvider).setBox;

    for (NendoData data in nendoList) {
      await nendoBox.put(data.num, data);
    }
    for (SetData data in setList) {
      await setBox.put(data.setName, data);
    }
  }

  // 넨도로이드 리스트 정렬
  void sortNenedoList(List<NendoData> nendoList) {
    final settingState = ref.watch(nendoListSettingProvider);

    nendoList.sort(
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

  void filterClear() {
    if (state.value == null) {
      return;
    }
    state = AsyncData(
      state.value!.copyWith(
        filteredNendoList: state.value!.nendoList,
      ),
    );
  }

  void setFilteredList(List<NendoData> nendoList) {
    if (state.value == null) {
      return;
    }
    state = AsyncData(
      state.value!.copyWith(
        filteredNendoList: nendoList,
      ),
    );
  }

/*void _filterNendoList(bool Function(NendoData) filterCondition) {
    state = AsyncData(
      state.requireValue.copyWith(
        filteredNendoList: state.requireValue.filteredNendoList.where(filterCondition).toList(),
      ),
    );
  }

  void filteringList() {
    if (state.value == null) {
      return;
    }

    final filterData = ref.read(nendoListSettingProvider).filterData;

    if (filterData.haveFilter) {
      _filterNendoList((item) => item.have);
    } else if (filterData.notHaveFilter) {
      _filterNendoList((item) => !item.have);
    }

    if (filterData.wishFilter) {
      _filterNendoList((item) => item.wish);
    }

    if (filterData.expectedFilter) {
      DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
      _filterNendoList((item) {
        if (item.releaseDate.isEmpty) {
          return false;
        }
        DateTime itemDate = DateFormat("yyyy/MM").parse(item.releaseDate[item.releaseDate.length - 1]);
        // 출시일이 오늘 날짜와 같거나 클때
        return !itemDate.isBefore(today);
      });
    }

    if (filterData.femaleFilter) {
      _filterNendoList((item) => item.gender == "F");
    } else if (filterData.maleFilter) {
      _filterNendoList((item) => item.gender == "M");
    } else if (filterData.etcFilter) {
      _filterNendoList((item) => item.gender != "F" && item.gender != "M");
    }
  }*/
}

@freezed
class NendoState with _$NendoState {
  const factory NendoState({
    @Default([]) List<NendoData> nendoList,
    @Default([]) List<NendoData> filteredNendoList,
    @Default([]) List<SetData> setList,
  }) = _NendoState;
}
