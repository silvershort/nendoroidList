import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/pages/detail_page.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';

class NendoItem extends StatelessWidget {
  NendoItem({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;
  final BottomSheetController modeController = Get.find<BottomSheetController>();
  final NendoController nendoController = Get.find<NendoController>();

  Color setItemSelectedColor(BuildContext context) {
    int mode = modeController.modeIndex.value;
    if (mode == 1) {
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
            Get.to(DetailPage(nendoData: nendoData));
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
                                height: 1.0,
                                fontSize: 15.0,
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
                                  height: 1.0,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: nendoData.have,
                              child: Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            Visibility(
                              visible: nendoData.wish,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.deepOrange,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '시리즈 : ${nendoData.series.ko ?? "데이터 없음"}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 12.0,
                          ),
                        ),
                        nendoPrice(context),
                        Text(
                          '출시날짜 : ${nendoData.releaseDate}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '성별 : ${nendoData.gender ?? "데이터 없음"}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: modeController.modeIndex.value == 1 && nendoData.have,
                      child: Positioned(
                        bottom: 5.0,
                        right: 0.0,
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
                              child: Text("${nendoData.count}"),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nendoPrice(BuildContext context) {
    if (modeController.modeIndex.value == BottomSheetController.haveEdit) {
      String purchasePrice = "";
      if (nendoData.myPrice != null && nendoData.have) {
        purchasePrice = '구매가격 : ${IntlUtil.comma(nendoData.myPrice!)} ₩';
      } else {
        purchasePrice = '출시가격 : ${IntlUtil.comma(nendoData.price)} ¥';
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            purchasePrice,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              height: 1.0,
              fontSize: 12.0,
            ),
          ),
          Visibility(
              visible: nendoData.have,
              child: InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Icon(
                    Icons.edit,
                    size: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onTap: () {
                  showPurchasePriceDialog();
                },
              )),
        ],
      );
    } else {
      return Text(
        '출시가격 : ${IntlUtil.comma(nendoData.price)} ¥',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          height: 1.0,
          fontSize: 12.0,
        ),
      );
    }
  }

  void showPurchasePriceDialog() {
    TextEditingController controller = TextEditingController();
    Get.dialog(AlertDialog(
      title: const Text("구매 가격 등록"),
      content: TextField(
        autofocus: true,
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        decoration: const InputDecoration(
            labelText: "실구매 가격(원)",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            )),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                showResetPriceDialog();
              },
              child: const Text("초기화"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("취소"),
                ),
                TextButton(
                  onPressed: () {
                    if (controller.text.isEmpty) {
                      Get.back();
                    } else {
                      int price = int.parse(controller.text);
                      nendoController.setNendoPurchasePrice(nendoData.num, price);
                      Get.back();
                    }
                  },
                  child: const Text("확인"),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }

  void showResetPriceDialog() {
    Get.dialog(AlertDialog(
      title: const Text("구매가격 초기화"),
      content: const Text("구매가격을 초기화 하시겠습니까?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () {
            nendoController.setNendoPurchasePrice(nendoData.num, null);
            Get.back();
            Get.back();
          },
          child: const Text("확인"),
        ),
      ],
    ));
  }
}
