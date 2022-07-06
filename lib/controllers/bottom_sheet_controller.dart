import 'package:get/get.dart';

import '../models/sort_data.dart';
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

  RxInt modeIndex = 0.obs;
  int nendoFilterIndex = -1;
  Rx<SortData> sortData = SortData(
    numSortOrder: descending,
    releaseSortOrder: descending,
    sortingMethod: num,
  ).obs;

  void setNendoFilterIndex(int index) {
    NendoController nendoController = Get.find<NendoController>();
    if (nendoFilterIndex == index) {
      nendoFilterIndex = -1;
      nendoController.filteringList(true);
    } else {
      if (nendoFilterIndex == -1) {
        nendoFilterIndex = index;
        nendoController.filteringList(false);
      } else {
        nendoFilterIndex = index;
        nendoController.filteringList(true);
      }
    }
    update();
  }

  void resetNendoFilter() {
    NendoController nendoController = Get.find<NendoController>();
    nendoFilterIndex = -1;
    nendoController.filteringList(true);
    update();
  }

  void changeMode(int index) {
    modeIndex.value = index;
    Get.find<NendoController>().nendoList.refresh();
  }

  void setNameSort() {
    if (sortData.value.sortingMethod == num) {
      sortData.value.numSortOrder = !sortData.value.numSortOrder;
    } else {
      sortData.value.sortingMethod = num;
    }
    sortData.refresh();
    Get.find<NendoController>().sortNendoList();
  }

  void setReleaseSort() {
    if (sortData.value.sortingMethod == release) {
      sortData.value.releaseSortOrder = !sortData.value.releaseSortOrder;
    } else {
      sortData.value.sortingMethod = release;
    }
    sortData.refresh();
    Get.find<NendoController>().sortNendoList();
  }
}
