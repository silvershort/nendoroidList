import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:korea_regexp/korea_regexp.dart';
import 'package:nendoroid_db/main_new.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/networks/services/firebase_service.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_provider.freezed.dart';
part 'nendo_provider.g.dart';

@Riverpod(keepAlive: true)
class Nendo extends _$Nendo {
  String _lastSearch = '';

  @override
  FutureOr<NendoState> build() async {
    return fetchData();
  }

  // 넨도리스트를 로컬 or 원격에서 가져온다.
  Future<NendoState> fetchData() async {
    // 로컬에 데이터가 있는지 유무를 판단하기 위해서 로컬DB를 가져온다.
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    final Box setBox = ref.watch(hiveProvider).setBox;

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
        nendoList.sortBySetting(ref.read(nendoListSettingProvider));

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
        sortList.sortBySetting(ref.read(nendoListSettingProvider));

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
    _lastSearch = word;

    if (word.isEmpty) {
      filterListClear();
      return;
    }

    // 초성검색, 대소문자무시
    RegExp regExp = getRegExp(
      word.trim(),
      RegExpOptions(
        initialSearch: true,
        ignoreCase: true,
      ),
    );

    late List<NendoData> tempList;

    // 일반 검색
    tempList = state.value!.nendoList
        .where((item) =>
            regExp.hasMatch(item.name.ko?.toLowerCase() ?? "") ||
            regExp.hasMatch(item.name.en?.toLowerCase() ?? "") ||
            regExp.hasMatch(item.series.ko?.toLowerCase() ?? "") ||
            regExp.hasMatch(item.num))
        .toList();

    // 숫자 범위 검색, 숫자와 ~가 있을때만 ~검색 사용
    // RegExp digitPattern = RegExp(r'\d+');
    // if (word.contains("~") && digitPattern.hasMatch(word)) {
    //   String startString = word.split("~").first.trim();
    //   String endString = word.split("~").last.trim();
    //
    //   if (startString.isEmpty) {
    //     startString = "0";
    //   }
    //   if (endString.isEmpty) {
    //     endString = "9999999";
    //   }
    //
    //   int start = int.parse(startString.replaceAll(RegExp(r"[^0-9]"), ""));
    //   int end = int.parse(endString.replaceAll(RegExp(r"[^0-9]"), ""));
    //
    //   tempList = state.value!.nendoList
    //       .where((item) =>
    //           (item.name.ko?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
    //           (item.name.en?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
    //           (item.series.ko?.toLowerCase() ?? "").contains(word.toLowerCase()) ||
    //           (start <= int.parse(item.num.replaceAll(RegExp(r"[^0-9]"), "")) && int.parse(item.num.replaceAll(RegExp(r"[^0-9]"), "")) <= end))
    //       .toList();
    // }

    // 검색어에 맞는 넨도 리스트의 필터링을 진행
    filteringList(nendoList: tempList, searchComplete: true);
  }

  // 특정 규칙에 따라서 리스트를 필터링 해준다.
  void filteringList({List<NendoData>? nendoList, bool searchComplete = false}) {
    // 검색어가 남아있을 경우 검색어에 따른 필터링을 우선적으로 진행한다.
    if (_lastSearch.isNotEmpty && !searchComplete) {
      searchToWord(_lastSearch);
      return;
    }

    // 필터 설정정보를 가져온다.
    final settingState = ref.read(nendoListSettingProvider);
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

  void resortingList() {
    if (state.value == null) {
      return;
    }
    final List<NendoData> sortList = [...state.requireValue.filteredNendoList];
    sortList.sortBySetting(ref.read(nendoListSettingProvider));
    state = AsyncData(
      state.requireValue.copyWith(
        filteredNendoList: sortList,
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

  void filterListClear() {
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

  // 선택한 넨도의 보유 여부를 수정함
  void updateHaveNendo(String number) async {
    if (state.value == null) {
      return;
    }

    NendoData item = state.requireValue.nendoList.where((element) => element.num == number).first;
    item.have = !item.have;
    // 보유넨도가 됐을경우 수량을 1로 수정
    if (item.have && item.count == 0) {
      item.count = 1;
    }
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    nendoBox.put(item.num, item);
    state = AsyncData(state.requireValue);
  }

  // 선택한 넨도의 위시 여부를 수정함
  void updateWishNendo(String number) async {
    if (state.value == null) {
      return;
    }

    NendoData item = state.requireValue.nendoList.where((element) => element.num == number).first;
    item.wish = !item.wish;

    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    nendoBox.put(item.num, item);
    state = AsyncData(state.requireValue);
  }

  // 넨도 구매 가격 변경
  void setNendoPurchasePrice(String number, int? price) {
    if (state.value == null) {
      return;
    }
    NendoData item = state.requireValue.nendoList.where((element) => element.num == number).first;
    item.myPrice = price;

    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    nendoBox.put(item.num, item);
    state = AsyncData(state.requireValue);
  }

  // 보유 넨도개수 조절
  void setNendoHaveCount(String number, int count) async {
    if (state.value == null) {
      return;
    }
    // 소유하고 있다면 1개 밑으로 내려갈 수 없으므로
    if (count <= 0) {
      return;
    }
    NendoData item = state.requireValue.nendoList.where((element) => element.num == number).first;
    item.count = count;
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    nendoBox.put(item.num, item);
    state = AsyncData(state.requireValue);
  }

  // 넨도 메모 저장
  void setNendoMemo(String number, List<String> memo) {
    if (state.value == null) {
      return;
    }
    NendoData item = state.requireValue.nendoList.where((element) => element.num == number).first;
    if (item.memo != null) {
      item.memo!.addAll(memo);
    } else {
      item.memo = [...memo];
    }
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    nendoBox.put(item.num, item);
    state = AsyncData(state.requireValue);
  }

  // 넨도 메모 삭제
  void deleteNendoMemo(String number, String memo) {
    if (state.value == null) {
      return;
    }
    NendoData item = state.requireValue.nendoList.where((element) => element.num == number).first;
    if (item.memo != null) {
      item.memo!.remove(memo);
    }
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    nendoBox.put(item.num, item);
    state = AsyncData(state.requireValue);
  }

  // 번호에 맞는 넨도 반환
  NendoData getNendoDataByNumber(String number) {
    return state.requireValue.nendoList.where((element) => element.num == number).first;
  }
}

@freezed
class NendoState with _$NendoState {
  const factory NendoState({
    @Default([]) List<NendoData> nendoList,
    @Default([]) List<NendoData> filteredNendoList,
    @Default([]) List<SetData> setList,
  }) = _NendoState;
}
