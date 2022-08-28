import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/widgets/dialog/common_dialog.dart';

class RegisterTokenDialog extends GetView<SettingController> {
  const RegisterTokenDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return AlertDialog(
      title: const Text("개인 GithubToken 등록"),
      content: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
            labelText: "Github Token",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            )),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Clipboard.getData(Clipboard.kTextPlain).then((value) {
                  textEditingController.text = value?.text ?? "";
                });
              },
              child: const Text("붙여넣기"),
            ),
            TextButton(
              onPressed: () {
                if (textEditingController.text.isEmpty) {
                  Get.back();
                } else {
                  controller.setGithubTokenKey(textEditingController.text.trim());
                  Get.back();
                  Get.dialog(
                    const CommonDialog(content: "등록이 완료되었습니다."),
                  );
                }
              },
              child: const Text("확인"),
            ),
          ],
        )
      ],
    );
  }
}
