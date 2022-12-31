import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/widgets/setting/setting_theme_item.dart';

import '../../utilities/app_color.dart';

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
            Text(
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
        SizedBox(
          height: 5.0,
        ),
        SettingThemeItem(
          primarySwatches: AppColor.themeColors,
        ),
      ],
    );
  }
}
