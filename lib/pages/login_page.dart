import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/sign_up_controller.dart';
import 'package:nendoroid_db/pages/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("로그인"),
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
                  onSubmitted: (str) {},
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "로그인",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text("이메일 주소 변경"),
                    ),
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(thickness: 0.5),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const SignUpPage(), binding: BindingsBuilder(() {
                          Get.put(SignUpController());
                        }));
                      },
                      child: const Text("회원가입"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
