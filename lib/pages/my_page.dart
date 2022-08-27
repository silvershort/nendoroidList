import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/gender_rate.dart';
import 'package:nendoroid_db/models/most_series.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/pages/detail_page.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/widgets/my_painter.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final NendoController nendoController = Get.find<NendoController>();
  final MyController myController = Get.find<MyController>();

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
                        accentWord: "${myController.getHaveNendo()}",
                        normalWord: " / ${myController.myNendoList.length}",
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
                        completePercent: myController.getHaveRate(),
                        width: 8.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "     구매한 넨도로이드 가격 총합",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(width: 5.0,),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    showPriceDialog();
                  },
                  icon: Icon(
                    Icons.help_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3.0,
            ),
            Obx(() => accentText(accentWord: IntlUtil.comma(myController.getSumPrice()), normalWord: "원", fontSize: 18.0)),
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
              accentWord: "${myController.getCompleteSetList().length}",
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
            thisMonthBuyNendo(),
            const SizedBox(
              height: 20.0,
            ),
            thisMonthWishNendo(),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget thisMonthBuyNendo() {
    List<NendoData> nendoList = myController.getThisMonthHaveList();
    if (nendoList.isEmpty) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          const Text(
            "이번달 출시 예정인 나의 넨도로이드",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 5.0,),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: nendoList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    child: accentText(
                        accentWord: "[${nendoList[index].num}]", normalWord: " ${nendoList[index].name.ko}", fontSize: 16.0),
                    onTap: () {
                      Get.to(DetailPage(nendoData: nendoList[index]));
                    },
                  ),
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

  Widget thisMonthWishNendo() {
    List<NendoData> nendoList = myController.getThisMonthWishList();
    if (nendoList.isEmpty) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          const Text(
            "이번달 출시 예정인 위시 넨도로이드",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 5.0,),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: nendoList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    child: accentText(
                        accentWord: "[${nendoList[index].num}]", normalWord: " ${nendoList[index].name.ko}", fontSize: 16.0),
                    onTap: () {
                      Get.to(DetailPage(nendoData: nendoList[index]));
                    },
                  ),
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

  Widget mostSeries() {
    MostSeries? mostSeries = myController.getMostHaveSeries();
    if (mostSeries == null) {
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
            accentWord: mostSeries.series,
            normalWord: " (${mostSeries.count}개)",
            fontSize: 18.0,
          ),
        ],
      );
    }
  }

  Widget mostNendo() {
    List<NendoData> mostList = myController.getMostHaveNendo();
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
                  InkWell(
                    child: accentText(
                        accentWord: "[${mostList[index].num}] ${mostList[index].name.ko}", normalWord: " (${mostList[index].count}개)", fontSize: 16.0),
                    onTap: () {
                      Get.to(DetailPage(nendoData: mostList[index]));
                    },
                  ),
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
    List<GenderRate> genderList = myController.getGenderRate();
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
    List<String> setList = myController.getCompleteSetList();
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

  void showPriceDialog() {
    Get.dialog(AlertDialog(
      title: const Text("가격 합산 방식"),
      content: Text(
        "가지고 있는 넨도로이드의 가격을 직접 입력했을경우 입력한 가격을 사용하고 입력하지 않았을 경우 "
            "출시 가격을 이용하여 가격을 합산합니다.\n출시 가격의 경우 오늘의 환율을 적용하여 원화 가격으로 변환해주고 있으며, "
            "환율정보를 가져오지 못했을경우 100엔당 1000원으로 계산합니다.\n\n"
            "오늘의 환율 : ${myController.todayYen == 0 ? "환율정보 없음" : "${myController.todayYen}원"}",
        style: const TextStyle(height: 1.3),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("확인"),
        ),
      ],
    ));
  }
}
