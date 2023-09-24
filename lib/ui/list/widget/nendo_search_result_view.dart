import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/app_bar/main_sliver_app_bar_controller.dart';

/// 넨도 검색시 상단에 검색된 넨도 개수를 알려주는 위젯
class NendoSearchResultView extends ConsumerWidget {
  const NendoSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 필터링된 넨도 개수
    final int? count = ref.watch(nendoProvider.select((state) => state.value?.filteredNendoList.length));
    // 검색 모드로 진입했는지 확인
    final isSearchMode = ref.watch(mainSliverAppBarControllerProvider.select((value) => value.isSearchMode));

    if (count != null && isSearchMode) {
      return SliverToBoxAdapter(
        child: Container(
          height: 24,
          padding: const EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "검색된 넨도로이드 수 : $count",
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      );
    } else {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }
}
