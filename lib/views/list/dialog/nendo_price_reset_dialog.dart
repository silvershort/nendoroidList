import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';

class NendoPriceResetDialog extends StatelessWidget {
  NendoPriceResetDialog({Key? key, required this.nendoData, required this.callback}) : super(key: key);
  final NendoData nendoData;
  final Function(bool) callback;
  final NendoController nendoController = Get.find<NendoController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("구매가격 초기화"),
      content: const Text("구매가격을 초기화 하시겠습니까?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            callback(false);
          },
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            nendoController.setNendoPurchasePrice(nendoData.num, null);
            callback(true);
          },
          child: const Text("확인"),
        ),
      ],
    );
  }
}
