import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';

import 'list_nendo_item.dart';

class ListNendoView extends GetView<NendoController> {
  ListNendoView({Key? key}) : super(key: key);
  final DashboardController dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5.0,
      radius: const Radius.circular(5.0),
      controller: controller.scrollController,
      interactive: true,
      trackVisibility: true,
      thumbVisibility: true,
      // 스크롤 했을때 검색창 포커스 해제
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            if (dashboardController.searchMode) {
              FocusScope.of(context).unfocus();
            }
          }
          return true;
        },
        child: Obx(() =>
          ListView.separated(
            // ios 스타일 오버스크롤
            physics: const BouncingScrollPhysics(),
            // 컨트롤러를 Scrollbar 위젯과 공유해야 오류가 안생김
            controller: controller.scrollController,
            padding: const EdgeInsets.only(top: 10.0),
            scrollDirection: Axis.vertical,
            itemCount: controller.nendoList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                if (dashboardController.searchMode) {
                  return Container(
                    height: 24,
                    padding: const EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "검색된 넨도로이드 수 : ${controller.nendoList.length}",
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              } else {
                return ListNendoItem(nendoData: controller.nendoList[index - 1]);
              }
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 5,
              );
            },
          ),
        ),
      ),
    );
  }
}
