import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/app_version_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeDialog extends GetView<AppVersionController> {
  const NoticeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "공지사항",
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            controller.noticeText,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("닫기"),
        ),
      ],
    );
  }
}
