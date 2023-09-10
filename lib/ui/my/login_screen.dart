import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/auth_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController textEditingController = TextEditingController();

  void _showConfirmEmail() {
    showDialog(
      context: context,
      builder: (context) {
        final String email = textEditingController.text.replaceAll(' ', '');
        return CommonDialog(
          content: "$email로 인증메일을 보냅니다.",
          negativeText: "취소",
          positiveText: "확인",
          positiveOnClick: () async {
            await ref.read(authProvider.notifier).signup(email);
            _showEmailSendComplete();
          },
        );
      },
    );
  }

  void _showEmailSendComplete() {
    showDialog(
      context: context,
      builder: (context) {
        return const CommonDialog(
          content: '이메일 전송을 완료했습니다.',
        );
      },
    );
  }

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
                    _showConfirmEmail();
                  },
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _showConfirmEmail();
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
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
