import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/widgets/my/accent_text.dart';

import '../../models/most_series.dart';

class MyMostSeriesView extends GetView<MyController> {
  const MyMostSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      MostSeries? mostSeries = controller.getMostHaveSeries();

      if (mostSeries == null) {
        return const SizedBox(
          height: 0.0,
        );
      } else {
        return Column(
          children: [
            const Text(
              "가장 많이 가지고 있는 시리즈",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            AccentText(
              accentWord: mostSeries.series,
              normalWord: " (${mostSeries.count}개)",
              fontSize: 18.0,
            ),
          ],
        );
      }
    });
  }
}
