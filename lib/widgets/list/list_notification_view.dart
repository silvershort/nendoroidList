import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';

class ListNotificationView extends GetView<NendoController> {
  const ListNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("넨도로이드 데이터 다운로드가 필요합니다."),
          const Text("최초 다운로드시 시간이 다소 걸립니다."),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            child: const Text("넨도 데이터 가져오기"),
            onPressed: () {
              Get.dialog(AlertDialog(
                title: const Text("다운로드 경고"),
                content: Text("[${controller.dataSize}] 데이터를 다운로드 합니다."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("취소"),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                      controller.fetchData();
                    },
                    child: const Text("확인"),
                  ),
                ],
              ));
            },
          ),
        ],
      ),
    );
  }
}
