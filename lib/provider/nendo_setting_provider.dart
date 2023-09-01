import 'package:nendoroid_db/models/edit_mode.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/sort_data.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nendo_setting_provider.g.dart';

part 'nendo_setting_provider.freezed.dart';

@riverpod
class NendoListSetting extends _$NendoListSetting {
  @override
  NendoListSettingState build() {
    return NendoListSettingState(
      editMode: Normal(),
      filterData: const FilterData(),
      sortData: const SortData(),
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
          sortingMethod: const SortingMethodRelease(),
        ));
    }
  }

  void setReleaseSort() {
    switch (state.sortData.sortingMethod) {
      case SortingMethodNum():
        state = state.copyWith(
            sortData: state.sortData.copyWith(
          sortingMethod: const SortingMethodNum(),
        ));
      case SortingMethodRelease():
        state = state.copyWith(
          sortData: state.sortData.toggleOrderValue(),
        );
    }
  }

  List<NendoData> getCurrentNendoList() {
    return ref.watch(nendoProvider).value?.nendoList ?? [];
  }
}

@freezed
class NendoListSettingState with _$NendoListSettingState {
  const factory NendoListSettingState({
    required EditMode editMode,
    required FilterData filterData,
    required SortData sortData,
  }) = _NendoListSettingState;
}
