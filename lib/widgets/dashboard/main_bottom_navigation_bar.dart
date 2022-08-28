import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';

import '../../controllers/my_controller.dart';

class MainBottomNavigationBar extends GetView<DashboardController> {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) {
          Get.find<MyController>().setMyNendoList();
          controller.tabIndex = index;
        },
        currentIndex: controller.tabIndex,
        unselectedItemColor: Colors.white.withOpacity(0.9),
        unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500, fontSize: 12),
        selectedLabelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
        backgroundColor: Theme.of(context).colorScheme.background,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.list,
                size: 20.0,
              ),
            ),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.person,
                size: 20.0,
              ),
            ),
            label: "My",
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.settings,
                size: 20.0,
              ),
            ),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
