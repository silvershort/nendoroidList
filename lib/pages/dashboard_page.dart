import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/widgets/dashboard/main_appbar.dart';
import 'package:nendoroid_db/widgets/dashboard/main_body.dart';
import 'package:nendoroid_db/widgets/dashboard/main_bottom_navigation_bar.dart';

import '../controllers/dashboard_controller.dart';
import '../widgets/filter_bottom_sheet.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Get.bottomSheet(FilterBottomSheet());
              },
            ),
          ),
        ),
      ),
    );
  }
}
