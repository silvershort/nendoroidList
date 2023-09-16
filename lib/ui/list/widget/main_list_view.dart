import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/nendo_list_tile.dart';

/// 넨도 리스트를 일자형 세로 리스트로 보여준다.
class MainListView extends StatelessWidget {
  const MainListView({Key? key, required this.nendoList}) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: nendoList.length,
      itemBuilder: (context, index) {
        return NendoListTile(nendoData: nendoList[index]);
      },
    );
  }
}
