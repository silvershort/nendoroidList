import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/utilities/app_color.dart';

import '../utilities/hive_name.dart';

class SettingController extends GetxController {
  final NendoController nendoController = Get.find<NendoController>();
  late Box appThemeBox;
  late Box termsBox;
  final RxInt _debugViewCount = 0.obs;

  final Rx<MaterialColor> _seedColor = Colors.green.obs;
  MaterialColor get seedColor => _seedColor.value;
  final Rx<Brightness> _brightness = Brightness.light.obs;
  Brightness get brightness => _brightness.value;

  int get debugViewCount => _debugViewCount.value;

  Future<void> settingInit() async {
    appThemeBox = await Hive.openBox<int>(HiveName.appThemeBoxName);
    termsBox = await Hive.openBox<bool>(HiveName.termsBoxName);

    _seedColor.value = AppColor.themeColors[appThemeBox.get(HiveName.appColorIndexKey) ?? AppColor.defaultIndex];
    _brightness.value = appThemeBox.get(HiveName.appBrightnessIndexKey) == 1 ? Brightness.dark : Brightness.light;
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

  // 앱 테마 변경
  void setAppTheme(int index) async {
    _seedColor.value = AppColor.themeColors[index];
    appThemeBox.put(HiveName.appColorIndexKey, index);
  }

  // 앱 다크모드 여부 변경
  void setDarkMode(bool darkMode) async {
    _brightness.value = darkMode ? Brightness.dark : Brightness.light;
    appThemeBox.put(HiveName.appBrightnessIndexKey, darkMode ? 1 : 0);
  }

  bool isUsedDarkMode() {
    return brightness == Brightness.light ? false : true;
  }
}
