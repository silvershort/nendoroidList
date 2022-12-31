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
                    if (Get.find<NewsController>().initFlag) {
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
        case 0:
        default:
          if (controller.searchMode) {
            return AppBar(
              scrolledUnderElevation: 0.0,
              centerTitle: true,
              title: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.searchEditingController,
                      showCursor: true,
                      focusNode: controller.searchFocus,
                      decoration: InputDecoration(
                        hintText: "이름, 작품, 번호로 검색",
                        // 텍스트 필드의 기본 밑줄 제거
                        border: InputBorder.none,
                        // 텍스트 필드의 텍스트가 위쪽으로 쏠린것을 막기 위해서 기본패딩을 재설정해줌
                        isDense: true,
                        contentPadding: const EdgeInsets.only(top: 15.0),
                        // 검색어를 입력했을때 검색어를 전체 삭제해주는 아이콘을 생성한다.
                        suffixIcon: Visibility(
                          visible: controller.searchText.isNotEmpty,
                          child: IconButton(
                            icon: const Icon(
                              Icons.clear,
                              size: 18.0,
                            ),
                            onPressed: () {
                              controller.clearTextField();
                            },
                          ),
                        ),
                      ),
                      onChanged: (String str) {
                        // 입력한 텍스트를 RxString 에 저장하여 suffixIcon 이 출력되도록 한다.
                        controller.searchText = str;
                        // 타이핑 후 0.5초 후에 자동으로 검색
                        controller.debounce.run(() {
                          controller.controlSearching(str);
                        });
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.clearTextField();
                        controller.searchMode = false;
                      },
                      child: const Text(
                        "취소",
                      ))
                ],
              ),
            );
          } else {
            return AppBar(
              centerTitle: true,
              title: Text(
                controller.getAppBarTitle(),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.searchMode = true;
                      controller.searchFocus.requestFocus();
                    },
                    icon: const Icon(Icons.search),
                  ),
                )
              ],
            );
          }
      }
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
