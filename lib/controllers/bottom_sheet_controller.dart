import 'package:get/get.dart';

import 'nendo_controller.dart';

class BottomSheetController extends GetxController {
  RxInt modeIndex = 0.obs;
  int nendoFilterIndex = -1;
  RxBool descendingSort = true.obs;

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

  void changeSorting(bool sort) {
    descendingSort.value = sort;
    Get.find<NendoController>().sortNendoList(descendingSort.value);
  }
}