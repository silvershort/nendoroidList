import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/auth_controller.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/utilities/app_font.dart';

import 'login_page.dart';

class TermsAgreeBottomSheet extends StatefulWidget {
  const TermsAgreeBottomSheet({Key? key, this.agreeable = true}) : super(key: key);
  final bool agreeable;

  @override
  State<TermsAgreeBottomSheet> createState() => _TermsAgreeBottomSheetState();
}

class _TermsAgreeBottomSheetState extends State<TermsAgreeBottomSheet> {
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "넨도로이드 DB 이용약관 안내",
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "백업기능을 사용하기 위해서는 회원가입이 필요하며, 간편한 절차와 보안을 위해 회원가입은 ",
                  style: DefaultTextStyle.of(context).style.copyWith(height: 1.3),
                ),
                const TextSpan(
                    text: "이메일 주소 하나로 진행",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: AppFont.oneMobile,
                  ),
                ),
                TextSpan(
                  text: "됩니다.",
                  style: DefaultTextStyle.of(context).style.copyWith(height: 1.3),
                ),
              ]
            ),
          ),
          const Text(
                "\n\이메일 주소의 경우 이용자 식별을 위해서만 사용되며 넨도로이드DB 운영자는 절대 회원의 개인정보를 다른 용도로 사용하거나 제3자에게 공유하지 않습니다." +
                "\n\n다만, 다음의 경우 사용에 대한 제재(이용정지, 강제탈퇴 등)을 가할 수 있습니다." +
                "\n\n1. 1회용 이메일, 타인명의의 이메일 등 본인 소유가 아닌 이메일을 사용한 경우" +
                "\n2. 한 사람이 여러개의 이메일의 계정을 등록하는 경우",
            style: TextStyle(
              height: 1.3,
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "- 개인정보 처리 방침 안내",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
              "1. 목적 : 이용자 식별 및 본인여부 확인",
          ),
          const SizedBox(height: 5.0),
          const Text(
            "2. 항목 : Email 주소",
          ),
          const SizedBox(height: 5.0),
          const Text(
            "3. 보유기간 : 회원탈퇴시까지",
          ),
          const SizedBox(height: 20.0),
          if (widget.agreeable)...[
          InkWell(
            onTap: () {
              setState(() {
                _agree = !_agree;
              });
            },
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Checkbox(
                    value: _agree,
                    onChanged: (value) {
                      setState(() {
                        _agree = value ?? false;
                      });
                    },
                  ),
                ),
                const Text(
                  "위 내용을 확인하였습니다.",
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Theme.of(context).disabledColor,
                    ),
                    child: const Text("취소"),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _agree
                        ? () {
                            Get.find<SettingController>().setTermsAndConditionsAgree(true);
                            Get.back();
                            Get.find<AuthController>().clearNotificationMessage();
                            Get.to(LoginPage());
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text("회원가입"),
                  ),
                ),
              ],
            ),
          ),]
        ],
      ),
    );
  }
}
