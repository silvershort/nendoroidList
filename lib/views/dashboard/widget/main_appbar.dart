import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/news_controller.dart';
import 'package:nendoroid_db/views/news/dialog/news_subscribe_dialog.dart';

class MainAppBar extends GetView<DashboardController> implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.tabIndex) {
        case 1:
          return AppBar(
            centerTitle: true,
            title: const Text("내 정보"),
          );
        case 2:
          return AppBar(
            centerTitle: true,
            title: const Text("넨도로이드 소식"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {
                    if (Get
                        .find<NewsController>()
                        .initFlag) {
                      Get.find<NewsController>().backupSubscribe();
                      Get.dialog(
                        const NewsSubscribeDialog(),
                        barrierDismissible: false,
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.settings,
                  ),
                ),
              ),
            ],
          );
        case 3:
          return AppBar(
            centerTitle: true,
            title: const Text("설정"),
          );
        default:
          return AppBar();
      }
    });
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
