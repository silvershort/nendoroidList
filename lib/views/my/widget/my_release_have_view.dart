import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/views/my/widget/accent_text.dart';
import 'package:nendoroid_db/views_common/dialog/detail_dialog.dart';

class MyReleaseHaveView extends GetView<MyController> {
  const MyReleaseHaveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<NendoData> nendoList = controller.getThisMonthHaveList();

      if (nendoList.isEmpty) {
        return const SizedBox();
      } else {
        return Column(
          children: [
            Text(
              "이번달 출시 예정인 나의 넨도로이드",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 5.0,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: nendoList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      child: AccentText(
                        context: context,
                        accentWord: "[${nendoList[index].num}]",
                        normalWord: " ${nendoList[index].name.ko}",
                        fontSize: 18.0,
                      ),
                      onTap: () {
                        Get.dialog(
                          DetailDialog(nendoData: nendoList[index]),
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
