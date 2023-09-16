import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_group.dart';
import 'package:nendoroid_db/models/view_mode.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/ui/list/widget/main_grid_list_view.dart';
import 'package:nendoroid_db/ui/list/widget/main_list_view.dart';
import 'package:nendoroid_db/ui/list/widget/main_sticky_header_List_view.dart';

/// 메인 리스트 화면에서 리스트 화면을 담당해주는 위젯
class MainSliverList extends ConsumerWidget {
  const MainSliverList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoProvider);
    final controller = ref.read(nendoProvider.notifier);

    return state.when(
      data: (data) {
        final appSetting = ref.watch(appSettingProvider);
        final viewMode = ref.watch(nendoListSettingProvider.select((value) => value.viewMode));

        switch (viewMode) {
          case ListViewMode():
            if (appSetting.showGroupHeader) {
              return MainStickyHeaderListView(
                groupList: controller.getNendoGroupList(
                  switch (appSetting.groupMethod) {
                    0 => NumberGroup(),
                    1 || _ => SeriesGroup(),
                  },
                ),
              );
            } else {
              return MainListView(nendoList: data.filteredNendoList);
            }
          case GridListViewMode():
            if (appSetting.showGroupHeader) {
              return MainStickyHeaderListView(
                groupList: controller.getNendoGroupList(
                  switch (appSetting.groupMethod) {
                    0 => NumberGroup(),
                    1 || _ => SeriesGroup(),
                  },
                ),
              );
            } else {
              return MainGridListView(nendoList: data.filteredNendoList);
            }
        }
      },
      error: (error, stackTrace) {
        return SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("데이터를 받아오는 중 오류가 발생했습니다."),
                IconButton(
                  onPressed: () {
                    controller.fetchData();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("넨도로이드 목록을 가져오는중..."),
                SizedBox(height: 20.0),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
