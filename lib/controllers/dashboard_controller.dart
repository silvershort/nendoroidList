import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/debounce.dart';
import '../utilities/page_queue.dart';
import 'bottom_sheet_controller.dart';
import 'my_controller.dart';
import 'nendo_controller.dart';

class DashboardController extends GetxController {

  final NendoController nendoController = Get.find<NendoController>();
  final MyController myController = Get.find<MyController>();
  final PageQueue pageQueue = PageQueue();
  DateTime? backPressTime;

  final RxInt _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  set tabIndex(int tabIndex) => _tabIndex.value = tabIndex;

  final RxBool _searchMode = false.obs;
  bool get searchMode => _searchMode.value;
  set searchMode(bool searchMode) => _searchMode.value = searchMode;

  final RxString _searchText = "".obs;
  String get searchText => _searchText.value;
  set searchText(String searchText) => _searchText.value = searchText;

  final TextEditingController searchEditingController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final Debounce debounce = Debounce(milliseconds: 100);

  void clearTextField() {
    searchEditingController.clear();
    _searchText.value = "";
    nendoController.searchInWord("");
  }

  void controlSearching(String str) {
    nendoController.searchInWord(str);
  }

  String getAppBarTitle() {
    switch (Get.find<BottomSheetController>().modeIndex) {
      case 1:
        return "보유 넨도로이드 편집";
      case 2:
        return "위시 넨도로이드 편집";
      case 0:
      default:
        return "넨도로이드 목록";
    }
  }
}