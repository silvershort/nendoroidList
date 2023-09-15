import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/list_app_bar_controller.dart';

/// 넨도로이드 리스트 화면의 앱바
/// 스크롤에 따라서 앱바를 숨기거나 보여준다.
class ListAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const ListAppBar({Key? key}) : super(key: key);

  @override
  ConsumerState<ListAppBar> createState() => _ListAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _ListAppBarState extends ConsumerState<ListAppBar> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(listAppBarControllerProvider);
    final controller = ref.read(listAppBarControllerProvider.notifier);
    final hideAppbar = ref.watch(appSettingProvider.select((value) => value.hideUI));

    if (state.isSearchMode) {
      return SliverAppBar(
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        pinned: true,
        floating: hideAppbar ? true : false,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.searchTextController,
                showCursor: true,
                focusNode: controller.searchFocus,
                decoration: InputDecoration(
                  hintText: "이름, 작품, 번호로 검색",
                  // 텍스트 필드의 기본 밑줄 제거
                  border: InputBorder.none,
                  // 텍스트 필드의 텍스트가 위쪽으로 쏠린것을 막기 위해서 기본패딩을 재설정해줌
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 12.5),
                  // 검색어를 입력했을때 검색어를 전체 삭제해주는 아이콘을 생성한다.
                  suffixIcon: Visibility(
                    visible: state.searchText.isNotEmpty,
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
                  controller.setSearchText(str);
                  // 타이핑 후 0.5초 후에 자동으로 검색
                  controller.debounceSearch();
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  controller.clearTextField();
                  controller.setSearchMode(false);
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
        floating: hideAppbar ? true : false,
        title: const Text(
            "넨도로이드 목록",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: IconButton(
              onPressed: () {
                controller.setSearchMode(true);
                controller.searchFocus.requestFocus();
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
      );
    }
  }
}