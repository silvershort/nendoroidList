import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/views/dashboard/widget/main_appbar.dart';
import 'package:nendoroid_db/views/list/widget/list_nendo_item.dart';

class ListNendoView extends GetView<NendoController> {
  ListNendoView({Key? key}) : super(key: key);
  final DashboardController dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: priceController.nendoList.length + 1,
        (context, index) {
          if (index == 0) {
            if (dashboardController.searchMode) {
              return Container(
                height: 24,
                padding: const EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "검색된 넨도로이드 수 : ${priceController.nendoList.length}",
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          } else {
            return ListNendoItem(nendoData: priceController.nendoList[index - 1]);
          }
        },
      ),
    );
  }
}
