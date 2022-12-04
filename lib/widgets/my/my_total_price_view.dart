import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/widgets/dialog/price_info_dialog.dart';
import 'package:nendoroid_db/widgets/my/accent_text.dart';

import '../../utilities/intl_util.dart';

class MyTotalPriceView extends GetView<MyController> {
  const MyTotalPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "     구매한 넨도로이드 가격 총합",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Get.dialog(const PriceInfoDialog());
              },
              icon: Icon(
                Icons.help_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 3.0,
        ),
        Obx(
          () => AccentText(
            accentWord: IntlUtil.comma(controller.getSumPrice()),
            normalWord: "원",
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
