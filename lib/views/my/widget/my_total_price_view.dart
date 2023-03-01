import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/views/my/dialog/price_info_dialog.dart';
import 'package:nendoroid_db/views/my/widget/accent_text.dart';
import 'package:nendoroid_db/views_common/component/help_icon.dart';

class MyTotalPriceView extends GetView<MyController> {
  const MyTotalPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "  구매한 넨도로이드 가격 총합",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: 5.0,
            ),
            HelpIcon(onTap: () {
              Get.dialog(const PriceInfoDialog());
            }),
          ],
        ),
        const SizedBox(
          height: 3.0,
        ),
        Obx(
          () => AccentText(
            context: context,
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
