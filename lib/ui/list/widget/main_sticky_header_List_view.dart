import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_group.dart';
import 'package:nendoroid_db/models/nendo_list_setting/nendo_setting_sealed.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/ui/list/widget/nendo_list_section.dart';
import 'package:nendoroid_db/ui/list/widget/main_grid_list_view.dart';
import 'package:nendoroid_db/ui/list/widget/main_list_view.dart';

/// 넨도를 그룹화하여 상단에 그룹 이름을 표기해주는 헤더를 포함하는 리스트
class MainStickyHeaderListView extends ConsumerWidget {
  const MainStickyHeaderListView({
    super.key,
    required this.groupList,
  });

  final List<NendoGroup> groupList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 리스트뷰인지 그리드 뷰인지 확인
    final viewMode = ref.watch(nendoListSettingProvider.select((value) => value.viewMode));

    return SliverMainAxisGroup(
      slivers: [
        for (NendoGroup group in groupList)
          NendoListSection(
            title: group.name,
            sliverList: switch (viewMode) {
              ListViewMode() => MainListView(nendoList: group.nendoList),
              GridListViewMode() => MainGridListView(nendoList: group.nendoList),
            },
          ),
      ],
    );
  }
}
