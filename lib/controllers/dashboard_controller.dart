import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool searchMode = false.obs;
  RxString searchText = "".obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}