import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/views/my/widget/accent_text.dart';
import 'package:nendoroid_db/views_common/dialog/detail_dialog.dart';

class MyReleaseWishView extends GetView<MyController> {
  const MyReleaseWishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<NendoData> nendoList = controller.getThisMonthWishList();

      if (nendoList.isEmpty) {
        return const SizedBox();
      } else {
        return Column(
          children: [
            const Text(
              "이번달 출시 예정인 위시 넨도로이드",
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
              itemCount: nendoList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      child: AccentText(
                        accentWord: "[${nendoList[index].num}]",
                        normalWord: " ${nendoList[index].name.ko}",
                        fontSize: 16.0,
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
