import 'package:flutter/material.dart';
import 'package:nendoroid_db/widgets/setting/setting_theme_item.dart';

import '../../utilities/app_color.dart';

class SettingThemeView extends StatelessWidget {
  const SettingThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "테마 적용 : ",
          style: TextStyle(fontSize: 18.0),
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
