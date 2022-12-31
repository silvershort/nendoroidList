import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialog/app_info_page.dart';

class SettingLicenseView extends StatelessWidget {
  const SettingLicenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "앱 상세정보 : ",
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const AppInfoPage());
              },
              child: const Text(
                  "앱 상세정보"
              ),
            ),
          ),
        ),
      ],
    );
  }
}
