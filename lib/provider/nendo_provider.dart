import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:korea_regexp/korea_regexp.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/nendo_group.dart';
import 'package:nendoroid_db/models/nendo_setting_sealed.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/networks/repositories/firebase_repository.dart';
import 'package:nendoroid_db/networks/services/firebase_service.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
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
  String _lastSearch = '';
  late final Box _nendoBox;
  late final Box _nenDollBox;
  late final Box _setBox;
  late final Box _settingBox;

  @override
  FutureOr<NendoState> build() async {
    // 로컬에 데이터가 있는지 유무를 판단하기 위해서 로컬DB를 가져온다.
    _nendoBox = ref.watch(hiveProvider).nendoBox;
    _nenDollBox = ref.watch(hiveProvider).nenDollBox;
    _setBox = ref.watch(hiveProvider).setBox;
    _settingBox = ref.watch(hiveProvider).settingBox;

    ref.listen(nendoListSettingProvider.select((value) => value.dataType), (previous, next) {
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
            print("@@@ : ${state.requireValue.nenDollList.toString()}");
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
    final int remoteVersion = ref.read(remoteConfigManagerProvider).getFirestoreVersion();
    final int localVersion = _settingBox.get(HiveName.localDataVersionKey, defaultValue: 0);

    // 업데이트가 필요함
    if (remoteVersion > localVersion) {
      fetchData(forceDownload: true);
    }
  }

  // 넨도리스트를 로컬 or 원격에서 가져온다.
  Future<NendoState> fetchData({bool forceDownload = true}) async {
    state = const AsyncLoading();

    // 로컬이 비어있을경우 파이어베이스에서 다운로드,
    if (_nendoBox.isEmpty || forceDownload) {
      final NendoState nendoState = await fetchFromFirebase();
      // 다운로드 완료시 로컬 데이터 버전 수정
      _settingBox.put(
        HiveName.localDataVersionKey,
        ref.read(remoteConfigManagerProvider).getFirestoreVersion(),
      );
      state = AsyncData(nendoState);
      return nendoState;
    }
    // 로컬에서 넨도와 세트 정보를 가져온 후 정렬
    else {
      try {
        final List<NendoData> nendoList = _nendoBox.values.map((e) => e as NendoData).toList();
        final List<NendoData> nenDollList = _nenDollBox.values.map((e) => e as NendoData).toList();
        final List<SetData> setList = _setBox.values.map((e) => e as SetData).toList();
        nendoList.sortBySetting(ref.read(nendoListSettingProvider));

        final NendoState nendoState = NendoState(
          nendoList: nendoList,
          nenDollList: nenDollList,
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
    final result = await ref.watch(firebaseServiceProvider).readInitData();

    return result.when(
      success: (value) async {
        logger.i(value.setList.toString());

        final List<NendoData> sortList = [...value.nendoList];
        sortList.sortBySetting(ref.read(nendoListSettingProvider));
        logger.i('nendolist : ${sortList.length}');

        await saveLocalDB(
          nendoList: sortList,
          nenDollList: value.nenDollList,
          setList: value.setList,
        );

        final NendoState nendoState = NendoState(
          nendoList: value.nendoList,
          nenDollList: value.nenDollList,
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

  // 파이어스토어에 저장된 데이터를 복구한다.
  Future<void> restoreBackupList(String documentID) async {
    if (state.value == null) {
      return;
    }
    final result = await ref.read(firebaseServiceProvider).readUserBackupData(documentID: documentID);

    result.when(
      success: (value) {
        // 깊은 복사를 해야 'Cannot remove from an unmodifiable list' 에러를 피할 수 있음.
        final backupNendoList = value.nendoList.toList();

        for (int i = backupNendoList.length - 1; i >= 0; i--) {
          NendoData backupData = backupNendoList[i];
          NendoData? nendoData = state.requireValue.nendoList.firstWhereOrNull((newItem) => newItem.num == backupData.num);
          if (nendoData != null) {
            nendoData = nendoData.copyWith(
              count: backupData.count,
              have: backupData.have,
              wish: backupData.wish,
              myPrice: backupData.myPrice,
              memo: backupData.memo?.toList(),
            );

            _nendoBox.put(nendoData.num, nendoData);

            // 계속해서 백업데이터를 확인하지 않도록 제거해준다.
            backupNendoList.removeAt(i);
          }
        }
        state = AsyncData(state.requireValue);
      },
      error: (error, stackTrace) {
        return Future.error(error, stackTrace);
      },
    );
  }

  // 넨도로이드 백업을 진행한다.
  Future<void> backupDataToFirestore({required User user}) async {
    if (state.value == null) {
      return;
    }

    // 소지하고 있거나 위시넨도일경우 백업리스트에 저장
    final backupNendoList = state.requireValue.nendoList.where((item) => (item.have || item.wish) || item.memo != null).toList();

    final result = await ref.read(firebaseServiceProvider).createBackupData(
          documentID: user.uid,
          backupData: BackupData(
            nendoList: backupNendoList,
            setList: [],
            email: user.email!,
            commitHash: '',
            backupDate: DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
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

  // 넨도 그룹핑
  List<NendoGroup> getNendoGroupList(Grouping grouping) {
    if (state.value == null) {
      return [];
    }

    final List<NendoGroup> nendoGroupList = [];

    switch (grouping) {
      case NumberGroup():
        state.requireValue.filteredNendoList.getNendoNumberGroupList().forEach((key, value) {
          nendoGroupList.add(NendoGroup(name: key.rangeName(), nendoList: value));
        });
      case SeriesGroup():
        state.requireValue.filteredNendoList.getNendoSeriesGroupList().forEach((key, value) {
          nendoGroupList.add(NendoGroup(name: key, nendoList: value));
        });
    }

    return nendoGroupList;
  }

  // 보유 넨도로이드를 텍스트로 반환
  String getHaveNendoText() {
    if (state.value == null) {
      return '';
    }

    final String total = '수집한 넨도로이드 총 개수 : ${state.requireValue.nendoList.getHaveCount()}\n\n';

    final List<String> list = state.requireValue.nendoList.map((e) {
      if (e.count <= 1) {
        return '[${e.num}] ${e.name.ko}';
      } else {
        return '[${e.num}] ${e.name.ko} - ${e.count}개';
      }
    }).toList();

    return total + list.join('\n');
  }
}
