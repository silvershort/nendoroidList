import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUpdateDialog extends StatelessWidget {
  const AppUpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "업데이트 알림",
      ),
      content: const Text("새로운 버전이 출시되었어요!"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("닫기"),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            if (Platform.isAndroid || Platform.isIOS) {
              final appId = Platform.isAndroid ? "com.silvershort.nendoroid_db" : "1634111114";
              final url = Uri.parse(
                Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId",
              );
              launchUrl(
                url,
                mode: LaunchMode.platformDefault,
              );
            }
          },
          child: const Text("업데이트"),
        ),
      ],
    );
  }
}
