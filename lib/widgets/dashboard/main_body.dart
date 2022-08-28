import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';

import '../../pages/list_page.dart';
import '../../pages/my_page.dart';
import '../../pages/setting_page.dart';

class MainBody extends GetView<DashboardController> {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Row(
        children: [
          if (MediaQuery
              .of(context)
              .size
              .width >= 640)
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .background,
              unselectedIconTheme: IconThemeData(color: Colors.white.withOpacity(0.9)),
              unselectedLabelTextStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500, fontSize: 12,),
              selectedLabelTextStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500, fontSize: 12,),
              destinations: [
                NavigationRailDestination(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: const Icon(
                      Icons.list,
                      size: 20.0,
                    ),
                  ),
                  label: const Text("List"),
                ),
                NavigationRailDestination(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: const Icon(
                      Icons.person,
                      size: 20.0,
                    ),
                  ),
                  label: const Text("My"),
                ),
                NavigationRailDestination(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: const Icon(
                      Icons.settings,
                      size: 20.0,
                    ),
                  ),
                  label: const Text("Setting"),
                ),
              ],
              selectedIndex: controller.tabIndex,
              onDestinationSelected: (index) => controller.tabIndex = index,
            ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                const ListPage(),
                MyPage(),
                SettingPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
