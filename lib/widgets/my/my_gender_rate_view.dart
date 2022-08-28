import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/widgets/my/accent_text.dart';

import '../../models/gender_rate.dart';

class MyGenderRateView extends GetView<MyController> {
  const MyGenderRateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<GenderRate> genderList = controller.getGenderRate();

      return Column(
        children: [
          const Text(
            "보유 넨도로이드 성별 비율",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: genderList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AccentText(
                    accentWord: " ${genderList[index].rate.toStringAsFixed(1)}% (${genderList[index].count}개)",
                    normalWord: genderList[index].gender,
                    fontSize: 18.0,
                    leading: false,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              );
            },
          ),
        ],
      );
    });
  }
}
