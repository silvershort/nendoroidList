import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:korea_regexp/korea_regexp.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/models/doll_filter_data.dart';
import 'package:nendoroid_db/models/doll_type.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/nendo_group.dart';
import 'package:nendoroid_db/models/nendo_setting_sealed.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/models/sort_data.dart';
import 'package:nendoroid_db/networks/services/firebase_service.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/provider/remote_config_provider.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';
import 'package:nendoroid_db/utilities/extension/num_extension.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_provider.freezed.dart';

part 'nendo_provider.g.dart';

@freezed
class NendoState with _$NendoState {
  const factory NendoState({
    @Default([]) List<NendoData> nendoList,
    @Default([]) List<NendoData> nenDollList,
    @Default([]) List<NendoData> filteredNendoList,
    @Default([]) List<SetData> setList,
  }) = _NendoState;
}

@Riverpod(keepAlive: true)
class Nendo extends _$Nendo {
  List<SetData> _newSetData = [];
  Map<String, List<NendoData>> _renewalMap = {};
  String _lastSearch = '';
  late final Box _nendoBox;
  late final Box _nenDollBox;
  late final Box _setBox;
  late final Box _settingBox;

  List<NendoData> _backupNendoList = [];

  @override
  FutureOr<NendoState> build() async {
    // 로컬에 데이터가 있는지 유무를 판단하기 위해서 로컬DB를 가져온다.
    _nendoBox = ref.watch(hiveProvider).nendoBox;
    _nenDollBox = ref.watch(hiveProvider).nenDollBox;
    _setBox = ref.watch(hiveProvider).setBox;
    _settingBox = ref.watch(hiveProvider).settingBox;

    ref.listen(nendoListSettingProvider.select((value) => value.dataType),
        (previous, next) {
      if (state.value == null) {
        return;
      }
      if (previous != next) {
        switch (next) {
          case NendoroidData():
            state = AsyncData(state.requireValue.copyWith(
              filteredNendoList: state.requireValue.nendoList,
            ));
          case NendoroidDollData():
            state = AsyncData(state.requireValue.copyWith(
              filteredNendoList: state.requireValue.nenDollList,
            ));
        }
      }
    });

    return fetchData();
  }

  void updateData() {
    // 데이터 다운로드중일때는 업데이트를 진행하지 않음
    if (!state.hasValue || state is AsyncLoading) {
      return;
    }
    final int remoteVersion =
        ref.read(remoteConfigManagerProvider).getFirestoreVersion();
    final int localVersion =
        _settingBox.get(HiveName.localDataVersionKey, defaultValue: 0);

    talker.info('remoteVersion : $remoteVersion');
    talker.info('localVersion : $localVersion');

    // 업데이트가 필요함
    if (remoteVersion > localVersion) {
      fetchData(forceDownload: true);
    }
  }

  // 넨도리스트를 로컬 or 원격에서 가져온다.
  Future<NendoState> fetchData({bool forceDownload = false}) async {
    state = const AsyncLoading();

    // 원격저장소에서 다운로드를 받기 전에 현재 데이터 정보를 임시 저장해둔다.
    backupDataToCache();

    // 로컬이 비어있을경우 파이어베이스에서 다운로드,
    if (_nendoBox.isEmpty || forceDownload) {
      final NendoState nendoState = await fetchFromFirebase();
      // 다운로드 완료시 로컬 데이터 버전 수정
      await _settingBox.put(
        HiveName.localDataVersionKey,
        ref.read(remoteConfigManagerProvider).getFirestoreVersion(),
      );
      state = AsyncData(nendoState);
      return nendoState;
    }
    // 로컬에서 넨도와 세트 정보를 가져온 후 정렬
    else {
      try {
        final List<NendoData> nendoList =
            _nendoBox.values.map((e) => e as NendoData).toList();
        final List<NendoData> nenDollList =
            _nenDollBox.values.map((e) => e as NendoData).toList();
        final List<SetData> setList =
            _setBox.values.map((e) => e as SetData).toList();
        nendoList.sortBySetting(ref
            .read(nendoListSettingProvider.select((value) => value.sortData)));

        final NendoState nendoState = NendoState(
          nendoList: nendoList,
          nenDollList: nenDollList,
          filteredNendoList: nendoList,
          setList: setList,
        );
        state = AsyncData(nendoState);
        return nendoState;
      } catch (error, stackTrace) {
        talker.error(error, error, stackTrace);
        state = AsyncError(error, stackTrace);
        return Future.error(error, stackTrace);
      }
    }
  }

  // 파이어베이스를 통해서 넨도로이드 초기 데이터를 받아온다.
  Future<NendoState> fetchFromFirebase() async {
    final result = await ref.watch(firebaseServiceProvider).readInitData();

    return result.when(
      success: (value) async {
        talker.info(value.setList.toString());

        List<NendoData> sortList = [...value.nendoList];
        sortList.sortBySetting(ref
            .read(nendoListSettingProvider.select((value) => value.sortData)));
        talker.info('nendolist : ${sortList.length}');

        // 임시 백업 데이터가 있을 경우 백업을 진행
        if (_backupNendoList.isNotEmpty) {
          talker.info("backupData : ${_backupNendoList.toString()}");

          for (int i = _backupNendoList.length - 1; i >= 0; i--) {
            final backupData = _backupNendoList[i];
            int index = sortList
                .indexWhere((e) => e.gscProductNum == backupData.gscProductNum);

            if (index >= 0) {
              sortList[index] = sortList[index].copyWith(
                count: backupData.count,
                have: backupData.have,
                wish: backupData.wish,
                preOrder: backupData.preOrder,
                myPrice: backupData.myPrice,
                memo: backupData.memo?.toList(),
              );
            }
          }
        }

        await saveLocalDB(
          nendoList: sortList,
          nenDollList: value.nenDollList,
          setList: value.setList,
        );

        final NendoState nendoState = NendoState(
          nendoList: sortList,
          nenDollList: value.nenDollList,
          setList: value.setList,
          filteredNendoList: sortList,
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

  // 파이어스토어에 저장된 데이터를 복구한다.
  Future<void> restoreBackupList(String documentID) async {
    if (state.value == null) {
      return;
    }

    final ApiResult<BackupData> result = await ref
        .read(firebaseServiceProvider)
        .readUserBackupData(documentID: documentID);

    result.when(
      success: (value) async {
        // 깊은 복사를 해야 'Cannot remove from an unmodifiable list' 에러를 피할 수 있음.
        final backupNendoList = value.nendoList.toList();

        for (int i = backupNendoList.length - 1; i >= 0; i--) {
          NendoData backupData = backupNendoList[i];
          NendoData? nendoData = state.requireValue.nendoList
              .firstWhereOrNull((newItem) => newItem.num == backupData.num);
          if (nendoData != null) {
            nendoData = nendoData.copyWith(
              count: backupData.count,
              have: backupData.have,
              wish: backupData.wish,
              preOrder: backupData.preOrder,
              myPrice: backupData.myPrice,
              memo: backupData.memo?.toList(),
            );

            await _nendoBox.put(nendoData.num, nendoData);

            // 계속해서 백업데이터를 확인하지 않도록 제거해준다.
            backupNendoList.removeAt(i);
          }
        }
        state = AsyncData(
          state.requireValue.copyWith(
            nendoList: getLocalNendoList(),
          ),
        );
        return;
      },
      error: (error, stackTrace) {
        return Future.error(error, stackTrace);
      },
    );
  }

  // DB 업데이트전에 데이터 백업
  void backupDataToCache() {
    // 소지하고 있거나 위시넨도일경우 백업리스트에 저장
    _backupNendoList = getLocalNendoList()
        .where((item) =>
            (item.have || item.wish || item.preOrder) ||
            item.myPrice != null ||
            item.memo != null)
        .toList();
  }

  // 넨도로이드 백업을 진행한다.
  Future<void> backupDataToFirestore({required User user}) async {
    if (state.value == null) {
      return;
    }

    // 소지하고 있거나 위시넨도일경우 백업리스트에 저장
    final backupNendoList = getLocalNendoList()
        .where((item) => (item.have || item.wish || item.preOrder) || item.memo != null)
        .toList();

    final String backupDate =
        DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now());

    final result = await ref.read(firebaseServiceProvider).createBackupData(
          documentID: user.uid,
          backupData: BackupData(
            nendoList: backupNendoList,
            setList: [],
            email: user.email!,
            commitHash: '',
            backupDate: backupDate,
            commitDate: '',
          ),
        );

    result.when(
      success: (value) {
        return;
      },
      error: (error, stackTrace) {
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

    final rawList = switch (ref.read(nendoListSettingProvider).dataType) {
      NendoroidData() => state.value!.nendoList,
      NendoroidDollData() => state.value!.nenDollList,
    };

    // 일반 검색
    // 2.0 같은 단어를 검색했을때 숫자 2로 검색한것과 동일한 효과가 있기에 소수점을 제외하고 매칭시킨다.
    tempList = rawList
        .where((item) =>
            regExp.hasMatch(item.name.ko?.toLowerCase() ?? "") ||
            regExp.hasMatch(item.name.en?.toLowerCase() ?? "") ||
            regExp.hasMatch(item.series.ko?.toLowerCase() ?? "") ||
            (!word.contains('.') && regExp.hasMatch(item.num)))
        .toList();

    // 검색어에 맞는 넨도 리스트의 필터링을 진행
    switch (ref.read(nendoListSettingProvider).dataType) {
      case NendoroidData():
        filteringList(nendoList: tempList, searchComplete: true);
      case NendoroidDollData():
        filteringDollList(nendoList: tempList, searchComplete: true);
    }

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

    if (filterData.preOrderFilter) {
      tempList = tempList.where((item) => item.preOrder).toList();
    }

    // if (filterData.expectedFilter) {
    //   DateTime today = DateTime(DateTime.now().year, DateTime.now().month, 1);
    //   tempList = tempList.where((item) {
    //     if (item.releaseDate.isEmpty) {
    //       return false;
    //     }
    //     DateTime itemDate = DateFormat("yyyy/MM")
    //         .parse(item.releaseDate[item.releaseDate.length - 1]);
    //     // 출시일이 오늘 날짜와 같거나 클때
    //     return !itemDate.isBefore(today);
    //   }).toList();
    // }

    if (filterData.femaleFilter) {
      tempList = tempList.where((item) => item.gender == "F").toList();
    } else if (filterData.maleFilter) {
      tempList = tempList.where((item) => item.gender == "M").toList();
    } else if (filterData.etcFilter) {
      tempList = tempList
          .where((item) => item.gender != "F" && item.gender != "M")
          .toList();
    }

    // 필터링 완료한 리스트를 넣어준다.
    state = AsyncData(
      state.value!.copyWith(
        filteredNendoList: tempList,
      ),
    );
  }

  void filteringDollList(
      {List<NendoData>? nendoList, bool searchComplete = false}) {
    // 검색어가 남아있을 경우 검색어에 따른 필터링을 우선적으로 진행한다.
    if (_lastSearch.isNotEmpty && !searchComplete) {
      searchToWord(_lastSearch);
      return;
    }

    // 필터 설정정보를 가져온다.
    final settingState = ref.read(nendoListSettingProvider);
    DollFilterData filterData = settingState.dollFilterData;

    // 특정 넨도 리스트(파라미터로 받은 값)을 대상으로 진행할지 전체 리스트로 진행할지 결정
    List<NendoData> tempList = nendoList ?? [...state.value!.nenDollList];

    if (!filterData.bodyFilter) {
      tempList = tempList
          .where(
              (item) => (item.type ?? '') != DollType.body.name.toLowerCase())
          .toList();
    }

    if (!filterData.clothesFilter) {
      tempList = tempList
          .where((item) =>
              (item.type ?? '') != DollType.clothes.name.toLowerCase())
          .toList();
    }

    if (!filterData.customizingFilter) {
      tempList = tempList
          .where((item) =>
              (item.type ?? '') != DollType.customizing.name.toLowerCase())
          .toList();
    }

    if (!filterData.dollFilter) {
      tempList = tempList
          .where(
              (item) => (item.type ?? '') != DollType.doll.name.toLowerCase())
          .toList();
    }

    // 필터링 완료한 리스트를 넣어준다.
    state = AsyncData(
      state.value!.copyWith(
        filteredNendoList: tempList,
      ),
    );
  }

  // 로컬 저장소에 저장된 넨도로이드 리스트 반환
  List<NendoData> getLocalNendoList() {
    return _nendoBox.values.map((e) => e as NendoData).toList();
  }

  void resortingList() {
    if (state.value == null) {
      return;
    }
    final List<NendoData> sortList = [...state.requireValue.filteredNendoList];
    sortList.sortBySetting(
        ref.read(nendoListSettingProvider.select((value) => value.sortData)));
    state = AsyncData(
      state.requireValue.copyWith(
        filteredNendoList: sortList,
      ),
    );
  }

  // 입력받은 리스트를 로컬DB에 저장해준다.
  Future<void> saveLocalDB({
    List<NendoData>? nendoList,
    List<NendoData>? nenDollList,
    List<SetData>? setList,
  }) async {
    for (NendoData data in nendoList ?? state.requireValue.nendoList) {
      await _nendoBox.put(data.num, data);
    }
    for (NendoData data in nenDollList ?? state.requireValue.nenDollList) {
      await _nenDollBox.put(data.num, data);
    }
    for (SetData data in setList ?? state.requireValue.setList) {
      await _setBox.put(data.setName, data);
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

  // 넨도 데이터를 갱신해줌
  void renewalData() {
    if (state.value == null) {
      return;
    }
    state = AsyncData(state.requireValue.copyWith(
      nendoList: getLocalNendoList()
        ..sortBySetting(ref
            .read(nendoListSettingProvider.select((value) => value.sortData))),
    ));
    filteringList();
  }

  // 선택한 넨도의 보유 여부를 수정함
  void updateHaveNendo(String number) async {
    if (state.value == null) {
      return;
    }

    NendoData item = state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
    item.have = !item.have;
    // 보유넨도가 됐을경우 수량을 1로 수정
    if (item.have && item.count == 0) {
      item.count = 1;
    }
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    await nendoBox.put(item.num, item);
    renewalData();
  }

  // 모든 넨도로이드를 보유 상태로 변경(테스트 용)
  void updateHaveAllNendo() async {
    if (state.value == null) {
      return;
    }

    for (final nendo in state.requireValue.nendoList) {
      nendo.have = true;
      if (nendo.count == 0) {
        nendo.count = 1;
      }
    }
    renewalData();
  }

  // 선택한 넨도의 위시 여부를 수정함
  void updateWishNendo(String number) async {
    if (state.value == null) {
      return;
    }

    NendoData item = state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
    item.wish = !item.wish;

    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    await nendoBox.put(item.num, item);
    renewalData();
  }

  // 선택한 넨도의 예약 여부를 수정함
  void updatePreOrderNendo(String number) async {
    if (state.value == null) {
      return;
    }

    NendoData item = state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
    item.preOrder = !item.preOrder;

    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    await nendoBox.put(item.num, item);
    renewalData();
  }

  // 넨도 구매 가격 변경
  void setNendoPurchasePrice(String number, int? price) async {
    if (state.value == null) {
      return;
    }
    NendoData item = state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
    item.myPrice = price;

    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    await nendoBox.put(item.num, item);
    renewalData();
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
    NendoData item = state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
    item.count = count;
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    await nendoBox.put(item.num, item);
    renewalData();
  }

  // 넨도 메모 저장
  void setNendoMemo(String number, List<String> memo) async {
    if (state.value == null) {
      return;
    }
    NendoData item = state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
    if (item.memo != null) {
      item.memo!.addAll(memo);
    } else {
      item.memo = [...memo];
    }
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    await nendoBox.put(item.num, item);
    renewalData();
  }

  // 넨도 메모 삭제
  void deleteNendoMemo(String number, String memo) async {
    if (state.value == null) {
      return;
    }
    NendoData item = state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
    if (item.memo != null) {
      item.memo!.remove(memo);
    }
    final Box nendoBox = ref.watch(hiveProvider).nendoBox;
    await nendoBox.put(item.num, item);
    renewalData();
  }

  // 번호에 맞는 넨도 반환
  NendoData getNendoDataByNumber(String number) {
    return state.requireValue.nendoList
        .where((element) => element.num == number)
        .first;
  }

  // 넨도 그룹핑
  List<NendoGroup> getNendoGroupList(Grouping grouping) {
    if (state.value == null) {
      return [];
    }

    final List<NendoGroup> nendoGroupList = [];

    switch (grouping) {
      case NumberGroup():
        state.requireValue.filteredNendoList
            .getNendoNumberGroupList()
            .forEach((key, value) {
          nendoGroupList.add(NendoGroup(
              name: '${key.rangeName()} [${value.length}개]', nendoList: value));
        });
      case SeriesGroup():
        state.requireValue.filteredNendoList
            .getNendoSeriesGroupList()
            .forEach((key, value) {
          nendoGroupList.add(
              NendoGroup(name: '$key [${value.length}개]', nendoList: value));
        });
    }

    return nendoGroupList;
  }

  // 보유 넨도로이드를 텍스트로 반환
  String getHaveNendoText() {
    if (state.value == null) {
      return '';
    }

    final String total =
        '수집한 넨도로이드 총 개수 : ${state.requireValue.nendoList.getHaveCount()}\n\n';
    final sortedList = state.requireValue.nendoList.getHaveList()
      ..sortBySetting(const SortData(sortingOrder: ASC()));
    final List<String> list = sortedList.map((e) {
      if (e.count <= 1) {
        return '[${e.num}] ${e.name.ko}';
      } else {
        return '[${e.num}] ${e.name.ko} - ${e.count}개';
      }
    }).toList();

    return total + list.join('\n');
  }

  // 보유한 넨도 세트 리스트 반환(임시)
  // 현재 세트데이터와 실제 넨도 세트데이터와 한국어 시리즈 이름이 정확하게 일치하지 않음.
  // 따라서 그냥 시리즈 이름을 기준으로 세트 데이터를 생성하고 비교해서 컴플리트 여부를 확인한다.
  List<({String name, int count})> getCompleteSetList() {
    if (state.value == null) {
      return [];
    }
    if (_newSetData.isEmpty) {
      _createNewSetData();
    }
    if (_renewalMap.isEmpty) {
      _createRenewalMap();
    }

    List<({String name, int count})> completeList = [];
    List<NendoData> haveList =
        state.requireValue.nendoList.where((item) => item.have).toList();

    // 2.0 상품이 있을 경우 구넨과 신넨을 모두 보유처리로 만들어 준다.
    for (int i = haveList.length - 1; i >= 0; i--) {
      final nendoData = haveList[i];
      final nendoName = nendoData.name.ko!.replaceAll('2.0', '').trim();
      if (_renewalMap.containsKey(nendoName)) {
        haveList.addAll(_renewalMap[nendoName] ?? []);
      }
    }

    // 중복 제거
    haveList = haveList.toSet().toList();

    for (SetData setData in _newSetData) {
      // 보유한 넨도 리스트에서 같은 시리즈 이름을 가진 리스트를 뽑고 거기서 넨도 번호를 받아온다.
      List<String> tempHaveSetList = haveList
          .where((item) => (item.series.ko ?? "") == setData.setName)
          .map((e) => e.num)
          .toList();

      // 순수 숫자만 남기고 중복되는 숫자를 제거하여 DX같은 파생상품을 지운다
      for (int i = 0; i < setData.list.length; i++) {
        setData.list[i] = setData.list[i].replaceAll(RegExp(r"[^0-9]"), "");
      }
      for (int i = 0; i < tempHaveSetList.length; i++) {
        tempHaveSetList[i] =
            tempHaveSetList[i].replaceAll(RegExp(r"[^0-9]"), "");
      }

      // 중복 제거
      tempHaveSetList = tempHaveSetList.toSet().toList();
      setData.list = setData.list.toSet().toList();

      // 리스트 비교를 위해 오름차순 정렬
      tempHaveSetList.sort();
      setData.list.sort();

      // 세트 전체 넨도 번호 리스트와 보유한 넨도 리스트가 같은지 비교 후 같다면 completeList에 추가한다.
      if (listEquals(tempHaveSetList, setData.list)) {
        completeList.add((name: setData.setName, count: setData.list.length));
      }
    }
    // 혹시라도 중복해서 세트가 들어갔다면 중복 아이템을 제거
    // return completeList.toSet().toList();

    // 세트 개수가 가장 많은 순으로 정렬해준다.
    return completeList
      ..sort(
        (a, b) {
          return b.count.compareTo(a.count);
        },
      );
  }

  void _createNewSetData() {
    Map<String, List<String>> setMap = {};

    // 넨도 데이터를 돌면서 같은 시리즈끼리 묶어줌
    for (NendoData nendoData in state.requireValue.nendoList) {
      if (nendoData.series.ko == null) {
        continue;
      }
      if (!setMap.containsKey(nendoData.series.ko)) {
        setMap[nendoData.series.ko!] = [];
      }
      setMap[nendoData.series.ko!]!.add(nendoData.num);
    }

    for (var entry in setMap.entries) {
      // 1개밖에 없는 작품은 세트 데이터에서 제외한다.
      if (entry.value.length < 2) {
        continue;
      }
      _newSetData.add(
        SetData(setName: entry.key, list: entry.value),
      );
    }
  }

  /// 2.0 같은 리뉴얼 넨도 상품의 이름을 가져온다.
  void _createRenewalMap() {
    // 중복데이터를 막기위해 임시로 리스트를 만든 후 전역변수에 대입해준다.
    final Map<String, List<NendoData>> renewalMap = {};
    final List<NendoData> nendoList = state.requireValue.nendoList;

    // 2.0 넨도는 무조건 나중에 나오기 때문에 역순으로 탐색한다.
    for (int i = nendoList.length - 1; i >= 0; i--) {
      final nendoData = nendoList[i];

      if (nendoData.name.ko == null) {
        continue;
      }

      final nendoName = nendoData.name.ko!;

      // 넨도 이름에 2.0이 들어갈 경우 넨도 이름을 키값으로 번호를 값으로 저장한다.
      if (nendoName.contains('2.0')) {
        renewalMap[nendoName.replaceAll('2.0', '').trim()] = [nendoData];
      }

      // 넨도의 이름이 키값과 같다는건 2.0 넨도를 가지고 있는 구넨이라는 뜻
      // 구넨의 번호를 같은 키값에 저장을 해준다.
      if (renewalMap.containsKey(nendoName)) {
        renewalMap[nendoName] = [nendoData, ...renewalMap[nendoName]!];
      }
    }
    _renewalMap = renewalMap;
  }

  // 로컬 넨도로이드 데이터를 리셋
  Future<void> resetLocalData() async {
    if (state.value == null) {
      return;
    }

    final List<NendoData> resetList = getLocalNendoList().resetList();

    await saveLocalDB(
      nendoList: resetList,
    );

    resetList.sortBySetting(
        ref.read(nendoListSettingProvider.select((value) => value.sortData)));

    state = AsyncData(state.requireValue.copyWith(
      nendoList: resetList,
    ));

    filteringList();
  }
}
