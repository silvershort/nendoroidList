import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_list/utilities/app_color.dart';

import '../utilities/app_font.dart';
import '../utilities/hive_name.dart';

class SettingController extends GetxController {
  late Box appThemeBox;

  @override
  void onInit() async {
    super.onInit();
    appThemeBox = await Hive.openBox<int>(HiveName.appThemeBoxName);
  }

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
