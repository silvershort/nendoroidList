import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/gender_rate.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/ui/_common_widget/text/accent_text.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';

class StatsGenderRateView extends StatelessWidget {
  const StatsGenderRateView({
    Key? key,
    required this.nendoList,
  }) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    List<GenderRate> genderList = nendoList.getGenderRate();

    return Column(
      children: [
        Text(
          "보유 넨도로이드 성별 비율",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 5.0,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: genderList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                AccentText(
                  context: context,
                  accentWord: " ${genderList[index].rate.toStringAsFixed(1)}% (${genderList[index].count}개)",
                  normalWord: genderList[index].gender,
                  fontSize: 18.0,
                  leading: false,
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
