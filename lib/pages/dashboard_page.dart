import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';

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

  final TextEditingController searchEditingController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final DashboardController dashboardController = Get.find<DashboardController>();
  final Debounce _debounce = Debounce(milliseconds: 500);

  String setAppBarTitle() {
    switch (Get.find<BottomSheetController>().modeIndex.value) {
      case 1:
        return "보유 넨도로이드 편집";
      case 2:
        return "위시 넨도로이드 편집";
      case 0:
      default:
        return "넨도로이드 목록";
    }
  }

  void clearTextField() {
    searchEditingController.clear();
    dashboardController.searchText.value = "";
    Get.find<NendoController>().searchInWord("");
  }

  void controlSearching(String str) {
    Get.find<NendoController>().searchInWord(str);
  }

  PreferredSizeWidget appBarWidget() {
    switch (dashboardController.tabIndex.value) {
      case 1:
        return AppBar(
          centerTitle: true,
          title: const Text("내 정보"),
        );
      case 2:
        return AppBar(
          centerTitle: true,
          title: const Text("설정"),
        );
      case 0:
      default:
        if (dashboardController.searchMode.value) {
          return AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchEditingController,
                    showCursor: true,
                    focusNode: searchFocus,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "이름 혹은 작품으로 검색",
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      // 텍스트 필드의 기본 밑줄 제거
                      border: InputBorder.none,
                      // 텍스트 필드의 텍스트가 위쪽으로 쏠린것을 막기 위해서 기본패딩을 재설정해줌
                      isDense: true,
                      contentPadding: const EdgeInsets.only(top: 15.0),
                      // 검색어를 입력했을때 검색어를 전체 삭제해주는 아이콘을 생성한다.
                      suffixIcon: Visibility(
                        visible: dashboardController.searchText.value.isNotEmpty,
                        child: IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          onPressed: () {
                            clearTextField();
                          },
                        ),
                      ),
                    ),
                    onChanged: (String str) {
                      // 입력한 텍스트를 RxString 에 저장하여 suffixIcon 이 출력되도록 한다.
                      dashboardController.searchText.value = str;
                      // 타이핑 후 0.5초 후에 자동으로 검색
                      _debounce.run(() {
                        controlSearching(str);
                      });
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {
                      clearTextField();
                      dashboardController.searchMode.value = false;
                    },
                    child: const Text(
                      "취소",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          );
        } else {
          return AppBar(
            centerTitle: true,
            title: Text(
              setAppBarTitle(),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: IconButton(
                  onPressed: () {
                    dashboardController.searchMode.value = true;
                    searchFocus.requestFocus();
                  },
                  icon: const Icon(Icons.search),
                ),
              )
            ],
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: appBarWidget(),
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
                  selectedIndex: dashboardController.tabIndex.value,
                  onDestinationSelected: (index) => dashboardController.changeTabIndex(index),
                ),
              const VerticalDivider(
                thickness: 1,
                width: 1,
              ),
              Expanded(
                child: IndexedStack(
                  index: dashboardController.tabIndex.value,
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
              ? MediaQuery(
                  // MediaQuery 를 통해서 디바이스 폰트크기에 영향을 받지 않고 고정된 폰트 크기로 보여줄 수 있음.
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: BottomNavigationBar(
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
                      Get.find<NendoController>().setMyNendoList();
                      dashboardController.changeTabIndex(index);
                    },
                    currentIndex: dashboardController.tabIndex.value,
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
                  ),
                )
              : null,
          floatingActionButton: Visibility(
            visible: dashboardController.tabIndex.value == 0,
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
