import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/text/accent_text.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_complete_set_list.dart';

class StatsCompleteSetView extends ConsumerWidget {
  const StatsCompleteSetView({
    super.key,
    required this.nendoList,
    // required this.setList,
  });
  final List<NendoData> nendoList;
  // final List<SetData> setList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          accentWord: "${ref.watch(nendoProvider.notifier).getCompleteSetList().length}",
          normalWord: "세트",
          fontSize: 18.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        StatsCompleteSetList(nendoList: nendoList),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
