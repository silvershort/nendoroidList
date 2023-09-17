import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';

class MainSliverAppBar extends GetView<DashboardController> implements PreferredSizeWidget {
  const MainSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (priceController.searchMode) {
        return SliverAppBar(
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          pinned: true,
          floating: true,
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: priceController.searchEditingController,
                  showCursor: true,
                  focusNode: priceController.searchFocus,
                  decoration: InputDecoration(
                    hintText: "이름, 작품, 번호로 검색",
                    // 텍스트 필드의 기본 밑줄 제거
                    border: InputBorder.none,
                    // 텍스트 필드의 텍스트가 위쪽으로 쏠린것을 막기 위해서 기본패딩을 재설정해줌
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 12.5),
                    // 검색어를 입력했을때 검색어를 전체 삭제해주는 아이콘을 생성한다.
                    suffixIcon: Visibility(
                      visible: priceController.searchText.isNotEmpty,
                      child: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          size: 18.0,
                        ),
                        onPressed: () {
                          priceController.clearTextField();
                        },
                      ),
                    ),
                  ),
                  onChanged: (String str) {
                    // 입력한 텍스트를 RxString 에 저장하여 suffixIcon 이 출력되도록 한다.
                    priceController.searchText = str;
                    // 타이핑 후 0.5초 후에 자동으로 검색
                    priceController.debounce.run(() {
                      priceController.controlSearching(str);
                    });
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    priceController.clearTextField();
                    priceController.searchMode = false;
                  },
                  child: const Text(
                    "취소",
                  ))
            ],
          ),
        );
      } else {
        return SliverAppBar(
          centerTitle: true,
          pinned: false,
          snap: false,
          floating: true,
          title: Text(
            priceController.getAppBarTitle(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              child: IconButton(
                onPressed: () {
                  priceController.searchMode = true;
                  priceController.searchFocus.requestFocus();
                },
                icon: const Icon(Icons.search),
              ),
            )
          ],
        );
      }
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}