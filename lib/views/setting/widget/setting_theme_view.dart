import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/utilities/app_color.dart';
import 'package:nendoroid_db/views/setting/widget/setting_theme_item.dart';

class SettingThemeView extends GetView<SettingController> {
  const SettingThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "테마 적용 : ",
              style: TextStyle(fontSize: 18.0),
            ),
            Obx(() =>
              Switch(
                value: controller.isUsedDarkMode(),
                onChanged: (value) {
                  controller.setDarkMode(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        const SettingThemeItem(
          primarySwatches: AppColor.themeColors,
        ),
      ],
    );
  }
}
