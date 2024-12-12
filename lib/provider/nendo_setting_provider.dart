import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/models/nendo_list_setting/doll_filter_data.dart';
import 'package:nendoroid_db/models/nendo_list_setting/grid_visible_data.dart';
import 'package:nendoroid_db/models/nendo_list_setting/nendo_setting_sealed.dart';
import 'package:nendoroid_db/models/nendo_list_setting/filter_data.dart';
import 'package:nendoroid_db/models/nendo_list_setting/sort_data.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_setting_provider.freezed.dart';

part 'nendo_setting_provider.g.dart';

@freezed
class NendoListSettingState with _$NendoListSettingState {
  const factory NendoListSettingState({
    required DataType dataType,
    required ViewMode viewMode,
    required EditMode editMode,
    required FilterData filterData,
    required DollFilterData dollFilterData,
    required SortData sortData,
    required GridVisibleData gridVisibleData,
  }) = _NendoListSettingState;
}

@Riverpod(keepAlive: true)
class NendoListSetting extends _$NendoListSetting {
  @override
  NendoListSettingState build() {
    return NendoListSettingState(
      dataType: NendoroidData(),
      viewMode: ListViewMode(),
      editMode: Normal(),
      filterData: const FilterData(),
      dollFilterData: const DollFilterData(),
      sortData: const SortData(),
      gridVisibleData: const GridVisibleData(),
    );
  }

  void changeDataType(DataType dataType) {
    state = state.copyWith(
      dataType: dataType,
    );
  }

  void changeViewMode(ViewMode viewMode) {
    state = state.copyWith(
      viewMode: viewMode,
    );
  }

  void changeEditMode(EditMode editMode) {
    state = state.copyWith(
      editMode: editMode,
    );
  }

  void changeFilterData(FilterData filterData) {
    state = state.copyWith(
      filterData: filterData,
    );
    ref.read(nendoProvider.notifier).filteringList();
  }

  void changeFilterDollData(DollFilterData filterData) {
    state = state.copyWith(
      dollFilterData: filterData,
    );
    ref.read(nendoProvider.notifier).filteringDollList();
  }

  void setNumSort() {
    switch (state.sortData.sortingMethod) {
      case SortingMethodNum():
        state = state.copyWith(
          sortData: state.sortData.toggleOrderValue(),
        );
      case SortingMethodRelease():
        state = state.copyWith(
            sortData: state.sortData.copyWith(
          sortingMethod: const SortingMethodNum(),
        ));
    }
    ref.read(nendoProvider.notifier).resortingList();
  }

  void setReleaseSort() {
    switch (state.sortData.sortingMethod) {
      case SortingMethodNum():
        state = state.copyWith(
            sortData: state.sortData.copyWith(
          sortingMethod: const SortingMethodRelease(),
        ));
      case SortingMethodRelease():
        state = state.copyWith(
          sortData: state.sortData.toggleOrderValue(),
        );
    }
    ref.read(nendoProvider.notifier).resortingList();
  }

  void setGridVisibleData(GridVisibleData gridVisibleData) {
    state = state.copyWith(
      gridVisibleData: gridVisibleData,
    );
  }
}
