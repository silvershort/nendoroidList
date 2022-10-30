import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/auth_controller.dart';
import 'package:nendoroid_db/controllers/firestore_controller.dart';
import 'package:nendoroid_db/widgets/dialog/common_dialog.dart';

import '../widgets/dialog/terms_agree_bottom_sheet.dart';

class LicenseInfoPage extends StatelessWidget {
  const LicenseInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("앱 및 라이센스 정보"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        children: [
          const Text(
            "- DB제공",
            style: TextStyle(),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "https://github.com/KhoraLee/NendoroidDB",
            style: TextStyle(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "- 폰트정보",
            style: TextStyle(),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "OneMobile, 마비노기옛체",
            style: TextStyle(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "- 오픈소스 라이센스 고지",
            style: TextStyle(),
          ),
          const SizedBox(
            height: 5.0,
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const LicensePage());
              },
              child: const Text("오픈소스 라이센스 정보"),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "- 회원탈퇴",
            style: TextStyle(),
          ),
          const SizedBox(
            height: 5.0,
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: ElevatedButton(
              onPressed: () {
                User? user = Get.find<AuthController>().user;
                if (user == null) {
                  Get.dialog(const CommonDialog(content: "로그인 정보가 없습니다."));
                } else {
                  Get.dialog(CommonDialog(
                    content: "정말로 회원 탈퇴하시겠습니까?\n\n(백업된 데이터는 자동으로 삭제됩니다.)",
                    negativeText: "취소",
                    positiveOnClick: () async {
                      Get.find<FirestoreController>().initUserSetting(documentID: user.uid);
                      await Get.find<FirestoreController>().deleteData();
                      Get.find<AuthController>().withdrawal().then((value) {
                        Get.dialog(const CommonDialog(content: "회원탈퇴가 완료되었습니다."));
                      }).onError((error, stackTrace) {
                        Get.dialog(const CommonDialog(content: "회원탈퇴에 실패했습니다.\n회원탈퇴를 위해서는 로그아웃 후 메일인증을 통한 로그인을 한 이후에 회원탈퇴를 진행해주세요."));
                      });
                    },
                  ));
                }
              },
              child: const Text("탈퇴 하기"),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "- 이용약관",
            style: TextStyle(),
          ),
          const SizedBox(
            height: 5.0,
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Wrap(
                    children: const [
                      TermsAgreeBottomSheet(agreeable: false),
                    ],
                  ),
                  isScrollControlled: true,
                );
              },
              child: const Text("넨도로이드DB 이용약관"),
            ),
          ),
        ],
      ),
    );
  }
}
