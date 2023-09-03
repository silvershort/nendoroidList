import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/views_common/widget/scroll_to_hide_widget.dart';

class MainBottomNavigationBar extends GetView<DashboardController> {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      ScrollToHideWidget(
        priceController: Get.find<NendoController>().scrollController,
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.list),
              label: "List",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "My",
            ),
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: "News",
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
          ],
          selectedIndex: priceController.tabIndex,
          onDestinationSelected: (index) {
            Get.find<MyController>().setMyNendoList();
            priceController.pageQueue.addPage(priceController.tabIndex);
            priceController.tabIndex = index;
            priceController.pageQueue.removePage(priceController.tabIndex);
          },
        ),
      ),
    );
  }
}

/*
Widget legacyNavibar() {
  return Obx(
        () => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) {
        Get.find<MyController>().setMyNendoList();
        controller.pageQueue.addPage(controller.tabIndex);
        controller.tabIndex = index;
        controller.pageQueue.removePage(controller.tabIndex);
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
              Icons.newspaper,
              size: 20.0,
            ),
          ),
          label: "News",
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
}*/
