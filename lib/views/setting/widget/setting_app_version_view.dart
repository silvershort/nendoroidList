import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/app_version_controller.dart';
import 'package:nendoroid_db/views_common/dialog/app_update_dialog.dart';

class SettingAppVersionView extends GetView<AppVersionController> {
  const SettingAppVersionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() =>
          GestureDetector(
            onTap: () {
              if (controller.needUpdate) {
                Get.dialog(const AppUpdateDialog());
              }
            },
            child: Text(
              controller.needUpdate ? "새로운 버전이 출시되었습니다."
                  : "최신 버전입니다.",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ),
        const SizedBox(height: 3.0),
        Obx(() =>
          Text(
            "앱 버전 : ${controller.appVersion}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
