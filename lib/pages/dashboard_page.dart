import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/widgets/dashboard/main_appbar.dart';

import '../controllers/dashboard_controller.dart';
import '../controllers/nendo_controller.dart';
import '../utilities/debounce.dart';
import '../widgets/filter_bottom_sheet.dart';
import 'list_page.dart';
import 'my_page.dart';
import 'setting_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final TextStyle unselectedLabelStyle = TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500, fontSize: 12);
  final TextStyle selectedLabelStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: MainAppBar(),
          body: Row(
            children: [
              if (MediaQuery.of(context).size.width >= 640)
                NavigationRail(
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  unselectedIconTheme: IconThemeData(color: Colors.white.withOpacity(0.9)),
                  unselectedLabelTextStyle: unselectedLabelStyle,
                  selectedLabelTextStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
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
          bottomNavigationBar: MediaQuery.of(context).size.width < 640
              ? BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                onTap: (index) {
                  // 검색모드나 필터적용상태에서 My 페이지로 갈 경우 넨도로이드 목록 개수를 불러오는데 있어서 문제가 생길 수 있음.
                  // 따라서 다른페이지로 이동했을때 초기화를 해주도록 함.
                  /*if (index != 0 && (dashboardController.searchMode.value || Get.find<BottomSheetController>().nendoFilterIndex != -1)) {
                    clearTextField();
                    dashboardController.searchMode.value = false;
                    Get.find<BottomSheetController>().resetNendoFilter();
                  }*/
                  Get.find<MyController>().setMyNendoList();
                  controller.tabIndex = index;
                },
                currentIndex: controller.tabIndex,
                unselectedItemColor: Colors.white.withOpacity(0.9),
                unselectedLabelStyle: unselectedLabelStyle,
                selectedLabelStyle: selectedLabelStyle,
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
              )
              : null,
          floatingActionButton: Visibility(
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
