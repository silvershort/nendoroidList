import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/most_series.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/ui/widget/text/accent_text.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';

class StatsMostSeriesView extends StatelessWidget {
  const StatsMostSeriesView({
    Key? key,
    required this.nendoList,
  }) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    MostSeries? mostSeries = nendoList.getMostHaveSeries();

    if (mostSeries == null || mostSeries.count == 0) {
      return const SizedBox(
        height: 0.0,
      );
    } else {
      return Column(
        children: [
          Text(
            "가장 많이 가지고 있는 시리즈",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5.0,
          ),
          AccentText(
            context: context,
            accentWord: mostSeries.series,
            normalWord: " (${mostSeries.count}개)",
            fontSize: 18.0,
          ),
          const SizedBox(height: 20.0),
        ],
      );
    }
  }
}
