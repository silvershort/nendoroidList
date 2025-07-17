import 'package:flutter/material.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/tile/nendo_list_tile.dart';

/// 넨도 리스트를 일자형 세로 리스트로 보여준다.
class MainListView extends StatelessWidget {
  const MainListView({Key? key, required this.nendoList}) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: nendoList.length,
      itemBuilder: (context, index) {
        return NendoListTile(nendoData: nendoList[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 1,
          thickness: 1,
        );
      },
    );
  }
}
