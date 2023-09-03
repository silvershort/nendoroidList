import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/views/my/widget/accent_text.dart';

import 'my_collection_painter.dart';

class MyCollectionView extends GetView<MyController> {
  const MyCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "수집한 넨도로이드",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10.0),
            Obx(
              () => AccentText(
                context: context,
                accentWord: "${priceController.getHaveNendo()}",
                normalWord: " / ${priceController.myNendoList.length}",
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 5.0),
            Obx(() =>
              Text(
                "(중복포함 넨도개수 : ${priceController.getTotalCount()}개)",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 13.0),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20.0,
        ),
        Obx(
          () => SizedBox(
            height: 70.0,
            width: 70.0,
            child: CustomPaint(
              foregroundPainter: MyCollectionPainter(
                  lineColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                  completeColor: Theme.of(context).colorScheme.outline,
                  textColor: DefaultTextStyle.of(context).style.color ?? Colors.black,
                  completePercent: priceController.getHaveRate(),
                  width: 8.0),
            ),
          ),
        ),
      ],
    );
  }
}
