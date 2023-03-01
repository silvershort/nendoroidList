import 'package:get/get.dart';
import 'package:nendoroid_db/models/filter_data.dart';
import 'package:nendoroid_db/models/sort_data.dart';

import 'nendo_controller.dart';

class BottomSheetController extends GetxController {
  static const int normalMode = 0;
  static const int haveEdit = 1;
  static const int wishEdit = 2;

  static const bool ascending = true;
  static const bool descending = false;
  static const int num = 0;
  static const int release = 1;

  static const int haveFilter = 0;
  static const int notHaveFilter = 1;
  static const int wishFilter = 2;
  static const int expectedFilter = 3;
  static const int maleFilter = 4;
  static const int femaleFilter = 5;
  static const int etcFilter = 6;

  final RxInt _modeIndex = 0.obs;
  int get modeIndex => _modeIndex.value;
  set modeIndex(int modeIndex) => _modeIndex.value = modeIndex;

  final Rx<SortData> _sortData = SortData(
    numSortOrder: descending,
    releaseSortOrder: descending,
    sortingMethod: num,
  ).obs;
  SortData get sortData => _sortData.value;

  FilterData filterData = FilterData();

  void setNendoFilterIndex(int index) {
    NendoController nendoController = Get.find<NendoController>();

    switch (index) {
      case haveFilter:
        if (filterData.notHaveFilter) {
          filterData.notHaveFilter = false;
        }
        if (filterData.haveFilter) {
          filterData.haveFilter = false;
        } else {
          filterData.haveFilter = true;
        }
        break;
      case notHaveFilter:
        if (filterData.haveFilter) {
          filterData.haveFilter = false;
        }
        if (filterData.notHaveFilter) {
          filterData.notHaveFilter = false;
        } else {
          filterData.notHaveFilter = true;
        }
        break;
      case wishFilter:
        if (filterData.wishFilter) {
          filterData.wishFilter = false;
        } else {
          filterData.wishFilter = true;
        }
        break;
      case expectedFilter:
        if (filterData.expectedFilter) {
          filterData.expectedFilter = false;
        } else {
          filterData.expectedFilter = true;
        }
        break;
      case maleFilter:
        filterData.femaleFilter = false;
        filterData.etcFilter = false;
        if (filterData.maleFilter) {
          filterData.maleFilter = false;
        } else {
          filterData.maleFilter = true;
        }
        break;
      case femaleFilter:
        filterData.maleFilter = false;
        filterData.etcFilter = false;
        if (filterData.femaleFilter) {
          filterData.femaleFilter = false;
        } else {
          filterData.femaleFilter = true;
        }
        break;
      case etcFilter:
        filterData.maleFilter = false;
        filterData.femaleFilter = false;
        if (filterData.etcFilter) {
          filterData.etcFilter = false;
        } else {
          filterData.etcFilter = true;
        }
        break;
    }

    update();

    nendoController.filteringList(true);
  }

  void resetNendoFilter() {
    NendoController nendoController = Get.find<NendoController>();
    filterData = FilterData();
    nendoController.filteringList(true);
    update();
  }

  bool filterApplied() {
    return !filterData.noFilter();
  }

  void changeMode(int index) {
    modeIndex = index;
    Get.find<NendoController>().nendoList.refresh();
  }

  void setNameSort() {
    if (sortData.sortingMethod == num) {
      sortData.numSortOrder = !sortData.numSortOrder;
    } else {
      sortData.sortingMethod = num;
    }
    _sortData.refresh();
    Get.find<NendoController>().sortNendoList();
  }

  void setReleaseSort() {
    if (sortData.sortingMethod == release) {
      sortData.releaseSortOrder = !sortData.releaseSortOrder;
    } else {
      sortData.sortingMethod = release;
    }
    _sortData.refresh();
    Get.find<NendoController>().sortNendoList();
  }
}
