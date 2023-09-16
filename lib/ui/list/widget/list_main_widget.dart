import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/nendo_group.dart';
import 'package:nendoroid_db/models/view_mode.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/list_app_bar_controller.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/nendo_grid_tile.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/nendo_list_section.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/nendo_list_tile.dart';

class ListMainWidget extends ConsumerWidget {
  const ListMainWidget({super.key});

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
              return MainStickyListScrollView(
                sectionList: controller.getNendoGroupList(
                  switch (appSetting.groupMethod) {
                    0 => NumberGroup(),
                    1 || _ => SeriesGroup(),
                  },
                ),
              );
            } else {
              return MainListScrollView(nendoList: data.filteredNendoList);
            }
          case GridListViewMode():
            if (appSetting.showGroupHeader) {
              return MainStickyListScrollView(
                sectionList: controller.getNendoGroupList(
                  switch (appSetting.groupMethod) {
                    0 => NumberGroup(),
                    1 || _ => SeriesGroup(),
                  },
                ),
              );
            } else {
              return MainGridListScrollView(nendoList: data.filteredNendoList);
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

class MainListScrollView extends ConsumerWidget {
  const MainListScrollView({Key? key, required this.nendoList}) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList.builder(
      itemCount: nendoList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          if (ref.watch(listAppBarControllerProvider).isSearchMode) {
            return Container(
              height: 24,
              padding: const EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "검색된 넨도로이드 수 : ${nendoList.length}",
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        } else {
          return NendoListTile(nendoData: nendoList[index - 1]);
        }
      },
    );
  }
}

class MainGridListScrollView extends ConsumerWidget {
  const MainGridListScrollView({Key? key, required this.nendoList}) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 앱 설정에서 설정한 한줄당 그리드뷰 아이템 개수
    final count = ref.watch(appSettingProvider.select((value) => value.gridCount));
    // 0으로 설정되어있을시 자동으로 화면 비율에 맞춰서 이미지 크기가 100에 근접하도록 개수를 맞춰준다.
    final autoCount = MediaQuery.sizeOf(context).width ~/ 100;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count == 0 ? autoCount : count,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return NendoGridTile(nendoData: nendoList[index]);
        },
        childCount: nendoList.length,
      ),
    );
  }
}

class MainStickyListScrollView extends ConsumerWidget {
  const MainStickyListScrollView({
    super.key,
    required this.sectionList,
  });

  final List<NendoGroup> sectionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(nendoListSettingProvider.select((value) => value.viewMode));

    return SliverMainAxisGroup(
      slivers: [
        for (NendoGroup group in sectionList)
          NendoListSection(
            title: group.name,
            sliverList: switch (viewMode) {
              ListViewMode() => MainListScrollView(nendoList: group.nendoList),
              GridListViewMode() => MainGridListScrollView(nendoList: group.nendoList),
            },
          ),
      ],
    );
  }
}
