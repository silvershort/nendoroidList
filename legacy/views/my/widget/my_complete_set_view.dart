import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/views/my/widget/accent_text.dart';
import 'package:nendoroid_db/views/my/widget/my_complete_set_list.dart';

class MyCompleteSetView extends GetView<MyController> {
  const MyCompleteSetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "완성한 넨도로이드 세트",
            style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Obx(() =>
          AccentText(
            context: context,
            accentWord: "${controller.getCompleteSetList().length}",
            normalWord: "세트",
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const MyCompleteSetList(),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
