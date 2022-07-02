import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_list/controllers/bottom_sheet_controller.dart';
import 'package:nendoroid_list/controllers/dashboard_controller.dart';
import 'package:nendoroid_list/controllers/nendo_controller.dart';
import 'package:nendoroid_list/models/nendo_data.dart';
import 'package:nendoroid_list/utilities/intl_util.dart';

class NendoItem extends StatelessWidget {
  NendoItem({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;
  final BottomSheetController modeController = Get.find<BottomSheetController>();
  final NendoController nendoController = Get.find<NendoController>();

  Color setItemSelectedColor(BuildContext context) {
    int mode = modeController.modeIndex.value;
    if (mode == 1) {
      // print("@@@ nendoData have : ${nendoData.have}");
      if (nendoData.have) {
        return Theme.of(context).colorScheme.secondary.withAlpha(80);
      } else {
        return Theme.of(context).colorScheme.surface;
      }
    } else if (mode == 2) {
      if (nendoData.wish) {
        return Theme.of(context).colorScheme.secondary.withAlpha(80);
      } else {
        return Theme.of(context).colorScheme.surface;
      }
    } else {
      return Theme.of(context).colorScheme.surface;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          int mode = modeController.modeIndex.value;
          if (mode == 0) {
          } else if (mode == 1) {
            nendoController.updateHaveNendo(nendoData.num);
          } else if (mode == 2) {
            nendoController.updateWishNendo(nendoData.num);
          }

          // 아이템 클릭했을때 포커스 해제
          if (Get.find<DashboardController>().searchMode.value) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          width: double.infinity,
          height: 110.0,
          color: setItemSelectedColor(context),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ExtendedImage.network(
                  nendoData.image,
                  width: 100.0,
                  fit: BoxFit.cover,
                  cache: true,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              nendoData.num.toString(),
                              style: const TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Text(
                                nendoData.name.ko ?? "데이터 없음",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '시리즈 : ${nendoData.series.ko ?? "데이터 없음"}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '출시가격 : ${IntlUtil.comma(nendoData.price)} ¥',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '출시날짜 : ${nendoData.releaseDate}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '성별 : ${nendoData.gender ?? "데이터 없음"}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: modeController.modeIndex.value == 1 && nendoData.have,
                      child: Positioned(
                        bottom: 5.0,
                        right: 5.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 24.0,
                              child: OutlinedButton(
                                onPressed: () {
                                  nendoController.setNendoHaveCount(nendoData.num, nendoData.count - 1);
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(32, 24),
                                  padding: const EdgeInsets.all(0),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              height: 24.0,
                              alignment: Alignment.center,
                              child: Text(
                                "${nendoData.count}"
                              ),
                            ),
                            SizedBox(
                              height: 24.0,
                              child: OutlinedButton(
                                onPressed: () {
                                  nendoController.setNendoHaveCount(nendoData.num, nendoData.count + 1);
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(32, 24),
                                  padding: const EdgeInsets.all(0),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
