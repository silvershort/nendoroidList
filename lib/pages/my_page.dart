import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_list/controllers/nendo_controller.dart';
import 'package:nendoroid_list/models/gender_rate.dart';
import 'package:nendoroid_list/models/nendo_data.dart';
import 'package:nendoroid_list/utilities/intl_util.dart';
import 'package:nendoroid_list/widgets/my_painter.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final NendoController nendoController = Get.find<NendoController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("수집한 넨도로이드",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Obx(
                      () => accentText(
                        accentWord: "${nendoController.getHaveNendo()}",
                        normalWord: " / ${nendoController.nendoList.length}",
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  height: 70.0,
                  width: 70.0,
                  child: CustomPaint(
                    foregroundPainter: MyPainter(
                        lineColor: Theme.of(context).colorScheme.background,
                        completeColor: Theme.of(context).colorScheme.primary,
                        completePercent: nendoController.getHaveRate(),
                        width: 8.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "구매한 넨도로이드 가격 총합",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Obx(() => accentText(accentWord: IntlUtil.comma(nendoController.getSumPrice()), normalWord: "엔", fontSize: 18.0)),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "완성한 넨도로이드 세트",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            accentText(
              accentWord: "${nendoController.getCompleteSetList().length}",
              normalWord: "세트",
              fontSize: 18.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            haveSetList(),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "보유 넨도로이드 성별 비율",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            genderRateText(),
            mostNendo(),
            mostSeries(),
            const SizedBox(
              height: 20.0,
            ),
          ], 
        ),
      ),
    );
  }

  Widget mostSeries() {
    String series = nendoController.getMostHaveSeries();
    if (series.isEmpty) {
      return const SizedBox(height: 0.0,);
    } else {
      return Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "가장 많이 가지고 있는 시리즈",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 5.0,),
          accentText(
            accentWord: series,
            normalWord: " (${nendoController.getHaveSeriesCount(series)}개)",
            fontSize: 18.0,
          ),
        ],
      );
    }
  }

  Widget mostNendo() {
    List<NendoData> mostList = nendoController.getMostHaveNendo();
    if (mostList.isEmpty) {
      return const SizedBox(height: 0.0);
    } else {
      return Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "가장 많이 가지고 있는 넨도로이드",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: mostList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  accentText(
                      accentWord: "[${mostList[index].num}] ${mostList[index].name.ko}", normalWord: " (${mostList[index].count}개)", fontSize: 18.0),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              );
            },
          ),
        ],
      );
    }
  }

  Widget genderRateText() {
    List<GenderRate> genderList = nendoController.getGenderRate();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: genderList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            accentTextReverse(
              accentWord: " ${genderList[index].rate.toStringAsFixed(1)}% (${genderList[index].count}개)",
              normalWord: genderList[index].gender,
              fontSize: 18.0,
            ),
            const SizedBox(
              height: 5.0,
            ),
          ],
        );
      },
    );
  }

  Widget accentText({
    required String accentWord,
    required String normalWord,
    required double fontSize,
  }) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: accentWord,
        style: TextStyle(
          color: Colors.deepOrangeAccent,
          fontSize: fontSize,
        ),
      ),
      TextSpan(
          text: normalWord,
          style: TextStyle(
            fontSize: fontSize,
          )),
    ]));
  }

  Widget accentTextReverse({
    required String accentWord,
    required String normalWord,
    required double fontSize,
  }) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: normalWord,
          style: TextStyle(
            fontSize: fontSize,
          )),
      TextSpan(
        text: accentWord,
        style: TextStyle(
          color: Colors.deepOrangeAccent,
          fontSize: fontSize,
        ),
      ),
    ]));
  }

  Widget haveSetList() {
    List<String> setList = nendoController.getCompleteSetList();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: setList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              setList[index],
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        );
      },
    );
  }
}
