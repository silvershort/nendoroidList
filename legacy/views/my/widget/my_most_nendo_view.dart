import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/views/my/widget/accent_text.dart';
import 'package:nendoroid_db/views_common/dialog/detail_dialog.dart';

class MyMostNendoView extends GetView<MyController> {
  const MyMostNendoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<NendoData> mostList = priceController.getMostHaveNendo();

      if (mostList.isEmpty) {
        return const SizedBox(height: 0.0);
      } else {
        return Column(
          children: [
            Text(
              "가장 많이 가지고 있는 넨도로이드",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5.0,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: mostList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      child: AccentText(
                        context: context,
                        accentWord: "[${mostList[index].num}] ${mostList[index].name.ko}",
                        normalWord: " (${mostList[index].count}개)",
                        fontSize: 18.0,
                      ),
                      onTap: () {
                        Get.dialog(
                          DetailDialog(nendoData: mostList[index]),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20.0),
          ],
        );
      }
    });
  }
}