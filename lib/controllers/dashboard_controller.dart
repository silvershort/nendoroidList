import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/app_version_controller.dart';
import 'package:nendoroid_db/widgets/dialog/app_update_dialog.dart';
import 'package:nendoroid_db/widgets/dialog/notice_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utilities/debounce.dart';
import '../utilities/page_queue.dart';
import 'bottom_sheet_controller.dart';
import 'my_controller.dart';
import 'nendo_controller.dart';

class DashboardController extends GetxController {
  final NendoController nendoController = Get.find<NendoController>();
  final MyController myController = Get.find<MyController>();
  final AppVersionController appVersionController = Get.put(AppVersionController());

  // 메인 백버튼 관리
  final PageQueue pageQueue = PageQueue();
  DateTime? backPressTime;

  // 메인 바텀네비탭
  final RxInt _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  set tabIndex(int tabIndex) => _tabIndex.value = tabIndex;

  // 검색 상태인지 확인하는 플래그 변수
  final RxBool _searchMode = false.obs;

  bool get searchMode => _searchMode.value;

  set searchMode(bool searchMode) => _searchMode.value = searchMode;

  // 검색 텍스트
  final RxString _searchText = "".obs;

  String get searchText => _searchText.value;

  set searchText(String searchText) => _searchText.value = searchText;

  // 검색창 관련
  final TextEditingController searchEditingController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final Debounce debounce = Debounce(milliseconds: 150);

  @override
  void onInit() async {
    super.onInit();
    bool needUpdate = await appVersionController.checkAppUpdate();
    if (needUpdate) {
      Get.dialog(
        const AppUpdateDialog(),
      );
    }
    if (appVersionController.noticeText.isNotEmpty) {
      Get.dialog(
        const NoticeDialog(),
      );
    }
  }

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
