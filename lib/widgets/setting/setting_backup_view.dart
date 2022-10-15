import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/pages/login_page.dart';

import '../dialog/common_dialog.dart';

class SettingBackupView extends StatelessWidget {
  const SettingBackupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "데이터 백업",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Get.dialog(
                  const CommonDialog(
                    title: "데이터 백업 안내",
                    content: "스마트폰 기기변경, 초기화 등의 이유로 데이터 백업이 필요할때 이메일 로그인 후 데이터를 백업할 수 있습니다.\n만일의 사태에 대비해서 데이터 백업을 주기적으로 해두는것을 권장합니다.",
                    contentStyle: TextStyle(height: 1.3),
                  ),
                );
              },
              icon: Icon(
                Icons.help_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const Text(
              " :",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(LoginPage());
          },
          child: const Text(
            "로그인이 필요합니다."
          ),
        ),
      ],
    );
  }
}
