import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/twitter_controller.dart';
import 'package:nendoroid_db/widgets/dashboard/main_appbar.dart';
import 'package:nendoroid_db/widgets/dashboard/main_body.dart';
import 'package:nendoroid_db/widgets/dashboard/main_bottom_navigation_bar.dart';

import '../controllers/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          int index = controller.pageQueue.previousPage();

          // index 가 -1일 경우 더이상 이동할 화면이 없다는 뜻
          if (index == -1) {
            // 리스트 화면을 보고 있을 경우 종료 팝업을 띄워주고 아니라면 리스트 화면으로 이동
            if (controller.tabIndex == 0) {
              return onWillPop();
            } else {
              controller.tabIndex = 0;
              return Future(() => false);
            }
          } else {
            controller.tabIndex = index;
            return Future(() => false);
          }
        },
        child: Scaffold(
          appBar: const MainAppBar(),
          body: const MainBody(),
          bottomNavigationBar: MediaQuery.of(context).size.width < 640
              ? const MainBottomNavigationBar() : null,
          floatingActionButton: Obx(() =>
            Visibility(
              visible: controller.tabIndex == 0,
              child: FloatingActionButton(
                child: const Icon(
                  Icons.filter_alt,
                ),
                onPressed: () {
                  // Get.bottomSheet(FilterBottomSheet());
                  Get.find<TwitterController>().fetchTimeline(userId: Get.find<TwitterController>().goodSmileId);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();

    if (controller.backPressTime == null || now.difference(controller.backPressTime!) > const Duration(seconds: 2)) {
      controller.backPressTime = now;
      Get.snackbar(
        "알림",
        "뒤로 버튼을 한 번 더 누르시면 종료됩니다.",
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
