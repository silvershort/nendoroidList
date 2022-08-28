import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/widgets/my/accent_text.dart';

import '../my_painter.dart';

class MyCollectionView extends GetView<MyController> {
  const MyCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text("수집한 넨도로이드",
                style: TextStyle(
                  fontSize: 18,
                )),
            const SizedBox(
              height: 10.0,
            ),
            Obx(() => AccentText(
                  accentWord: "${controller.getHaveNendo()}",
                  normalWord: " / ${controller.myNendoList.length}",
                  fontSize: 18.0,
                )),
          ],
        ),
        const SizedBox(
          width: 20.0,
        ),
        Obx(() =>
          SizedBox(
            height: 70.0,
            width: 70.0,
            child: CustomPaint(
              foregroundPainter: MyPainter(
                  lineColor: Theme.of(context).colorScheme.background,
                  completeColor: Theme.of(context).colorScheme.primary,
                  completePercent: controller.getHaveRate(),
                  width: 8.0),
            ),
          ),
        ),
      ],
    );
  }
}
