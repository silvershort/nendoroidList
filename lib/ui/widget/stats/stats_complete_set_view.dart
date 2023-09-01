import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/ui/widget/stats/stats_complete_set_list.dart';
import 'package:nendoroid_db/ui/widget/text/accent_text.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';

class StatsCompleteSetView extends StatelessWidget {
  const StatsCompleteSetView({
    Key? key,
    required this.nendoList,
    required this.setList,
  }) : super(key: key);
  final List<NendoData> nendoList;
  final List<SetData> setList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "완성한 넨도로이드 세트",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 5.0,
        ),
        AccentText(
          context: context,
          accentWord: "${nendoList.getCompleteSetList(setList).length}",
          normalWord: "세트",
          fontSize: 18.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        // TODO: 추후 주석 제거
        // const StatsCompleteSetList(),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
