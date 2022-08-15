import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const LicensePage());
              },
              child: const Text(
                "오픈소스 라이센스 정보"
              ),
            ),
          ),
        ],
      ),
    );
  }
}
