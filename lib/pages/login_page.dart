import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("로그인 & 회원가입"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: textEditingController,
                  showCursor: true,
                  decoration: const InputDecoration(
                    labelText: "이메일 주소 입력",
                  ),
                  style: const TextStyle(fontSize: 18.0),
                  onSubmitted: (str) {
                    controller.showConfirmEmail(textEditingController.text.trim());
                  },
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.showConfirmEmail(textEditingController.text.trim());
                    },
                    child: const Text(
                      "로그인&회원가입",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "- 이메일 인증을 통해 회원가입이 가능합니다.\n- 이미 가입 했다면 이메일 인증으로 로그인이 가능합니다.",
                  style: TextStyle(
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 30.0),
                Obx(
                  () => Text(
                    controller.notificationMessage,
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
