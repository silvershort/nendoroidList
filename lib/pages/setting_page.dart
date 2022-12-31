import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/pages/login_page.dart';
import 'package:nendoroid_db/widgets/setting/debug_view.dart';
import 'package:nendoroid_db/widgets/setting/setting_app_version_view.dart';
import 'package:nendoroid_db/widgets/setting/setting_sign_view.dart';
import 'package:nendoroid_db/widgets/setting/setting_license_view.dart';
import 'package:nendoroid_db/widgets/setting/setting_personal_token_view.dart';
import 'package:nendoroid_db/widgets/setting/setting_theme_view.dart';
import 'package:nendoroid_db/widgets/setting/setting_update_view.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);
  final SettingController settingController = Get.find<SettingController>();
  final NendoController nendoController = Get.find<NendoController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      children: [
        SettingSignView(),
        const SizedBox(height: 10.0),
        const SettingAppVersionView(),
        const SizedBox(height: 20.0),
        SettingUpdateView(),
        const SizedBox(height: 20.0),
        const SettingThemeView(),
        const SizedBox(height: 20.0),
        const SettingLicenseView(),
        const SizedBox(height: 20.0),
        Obx(() {
          if (settingController.debugViewCount > 10 && kDebugMode) {
            return DebugView();
          } else {
            return const SizedBox();
          }
        })
      ],
    );
  }
}
