import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/utilities/app_color.dart';

import '../utilities/app_font.dart';
import '../utilities/hive_name.dart';

class SettingController extends GetxController {
  final NendoController nendoController = Get.find<NendoController>();
  late Box appThemeBox;
  late Box termsBox;
  final RxInt _debugViewCount = 0.obs;
  int get debugViewCount => _debugViewCount.value;

  @override
  void onInit() async {
    super.onInit();
    appThemeBox = await Hive.openBox<int>(HiveName.appThemeBoxName);
    termsBox = await Hive.openBox<bool>(HiveName.termsBoxName);
  }

  void incrementDebugViewCount() {
    _debugViewCount.value++;
  }

  // 개인용 깃허브 API 키를 등록해줌
  void setGithubTokenKey(String tokenKey) {
    if (tokenKey.isEmpty) {
      nendoController.settingBox.delete(HiveName.githubTokenKey);
      return;
    }
    nendoController.settingBox.put(HiveName.githubTokenKey, tokenKey);
    nendoController.githubToken = tokenKey;
  }

  // 개인용 토큰 폐기
  void clearGithubToken() {
    nendoController.githubToken = "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";
    setGithubTokenKey("");
  }

  // 약관 동의여부 확인
  bool getTermsAndConditionsAgree() {
    return termsBox.get(HiveName.termsAgreeKey, defaultValue: false);
  }

  void setTermsAndConditionsAgree(bool agree) async {
    await termsBox.put(HiveName.termsAgreeKey, agree);
    return;
  }

  // 앱테마 변경
  void setAppTheme(int index) async {
    if (index == AppColor.themeColors.length) {
      Get.changeTheme(ThemeData(
        brightness: Brightness.dark,
        fontFamily: AppFont.oneMobile,
      ));
      appThemeBox.put(HiveName.appThemeIndexKey, -1);
    } else {
      Get.changeTheme(ThemeData(
        primarySwatch: AppColor.themeColors[index],
        fontFamily: AppFont.oneMobile,
      ));
      appThemeBox.put(HiveName.appThemeIndexKey, index);
    }
  }
}
