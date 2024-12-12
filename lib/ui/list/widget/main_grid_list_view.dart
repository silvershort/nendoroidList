import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/nendo_grid_tile.dart';

/// 넨도 리스트를 그리드뷰로 보여주는 위젯
class MainGridListView extends ConsumerWidget {
  const MainGridListView({Key? key, required this.nendoList}) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 앱 설정에서 설정한 한줄당 그리드뷰 아이템 개수
    final count = ref.watch(appSettingProvider.select((value) => value.gridCount));
    // 0으로 설정되어있을시 자동으로 화면 비율에 맞춰서 이미지 크기가 100에 근접하도록 개수를 맞춰준다.
    final autoCount = MediaQuery.sizeOf(context).width ~/ 100;
    final itemCount =  count == 0 ? autoCount : count;

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: itemCount,
        crossAxisSpacing: (7 - itemCount).clamp(0.5, 7.0).toDouble(),
        mainAxisSpacing: (7 - itemCount).clamp(0.5, 7.0).toDouble(),
      ),
      itemCount: nendoList.length,
      itemBuilder: (context, index) {
        return NendoGridTile(nendoData: nendoList[index]);
      },
    );
  }
}
