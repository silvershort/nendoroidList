import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_setting_sealed.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/main_sliver_app_bar_controller.dart';

/// 넨도로이드 리스트 화면의 앱바
/// 스크롤에 따라서 앱바를 숨기거나 보여준다.
class MainSliverAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const MainSliverAppBar({Key? key}) : super(key: key);

  @override
  ConsumerState<MainSliverAppBar> createState() => _ListAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _ListAppBarState extends ConsumerState<MainSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainSliverAppBarControllerProvider);
    final controller = ref.read(mainSliverAppBarControllerProvider.notifier);
    // 앱 설정에 따라서 스크롤시 UI를 숨길지 여부
    final hideAppbar = ref.watch(appSettingProvider.select((value) => value.hideUI));
    // 현재 편집 모드를 받아서 타이틀을 수정해준다.
    final editMode = ref.watch(nendoListSettingProvider.select((value) => value.editMode));
    final dataType = ref.watch(nendoListSettingProvider.select((value) => value.dataType));

    if (state.isSearchMode) {
      return SliverAppBar(
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        pinned: hideAppbar ? false : true,
        floating: true,
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
        pinned: hideAppbar ? false : true,
        floating: true,
        title: Text(
          switch (dataType) {
            NendoroidData() => switch (editMode) {
                Normal() => '넨도로이드 목록',
                Have() => '보유 넨도 편집',
                Wish() => '위시 넨도 편집',
              },
            NendoroidDollData() => '넨도로이드 돌 목록',
          },
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
