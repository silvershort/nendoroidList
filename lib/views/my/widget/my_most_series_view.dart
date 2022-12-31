import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/models/most_series.dart';
import 'package:nendoroid_db/views/my/widget/accent_text.dart';

class MyMostSeriesView extends GetView<MyController> {
  const MyMostSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      MostSeries? mostSeries = controller.getMostHaveSeries();

      if (mostSeries == null || mostSeries.count == 0) {
        return const SizedBox(
          height: 0.0,
        );
      } else {
        return Column(
          children: [
            Text(
              "가장 많이 가지고 있는 시리즈",
              style: Theme.of(context).textTheme.subtitle1,
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
    });
  }
}
