import 'package:badges/badges.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/views/list/dialog/nendo_info_edit_dialog.dart';
import 'package:nendoroid_db/views/list/widget/list_nendo_memo_view.dart';
import 'package:nendoroid_db/views_common/component/check_icon.dart';
import 'package:nendoroid_db/views_common/component/wish_icon.dart';
import 'package:nendoroid_db/views_common/dialog/detail_dialog.dart';

class ListNendoItem extends StatelessWidget {
  ListNendoItem({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;
  final BottomSheetController modeController = Get.find<BottomSheetController>();
  final NendoController nendoController = Get.find<NendoController>();

  Color setItemSelectedColor(BuildContext context) {
    int mode = modeController.modeIndex;
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
          int mode = modeController.modeIndex;
          if (mode == 0) {
            Get.dialog(
              DetailDialog(nendoData: nendoData),
            );
            // Get.to(NendoWebPage(nendoData: nendoData));
          } else if (mode == 1) {
            nendoController.updateHaveNendo(nendoData.num);
          } else if (mode == 2) {
            nendoController.updateWishNendo(nendoData.num);
          }

          // 아이템 클릭했을때 포커스 해제
          if (Get.find<DashboardController>().searchMode) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          width: double.infinity,
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
                              child: Badge(
                                showBadge: nendoData.count > 1,
                                padding: const EdgeInsets.all(3.8),
                                badgeColor: Colors.deepOrange,
                                badgeContent: Text(
                                  nendoData.count.toString(),
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white
                                  ),
                                ),
                                position: BadgePosition.bottomStart(),
                                child: const CheckIcon(),
                              ),
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            Visibility(
                              visible: nendoData.wish,
                              child: const WishIcon()),
                          ],
                        ),
                        const SizedBox(height: 7.5),
                        Text(
                          '시리즈 : ${nendoData.series.ko ?? "데이터 없음"}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(height: 7.5),
                        nendoPrice(context),
                        const SizedBox(height: 7.5),
                        Text(
                          '출시날짜 : ${nendoData.releaseDate}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(height: 7.5),
                        Text(
                          '성별 : ${nendoData.gender ?? "데이터 없음"}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 12.0,
                          ),
                        ),
                        if (nendoData.memo != null && nendoData.memo!.isNotEmpty)
                          Column(
                            children: [
                              const SizedBox(height: 7.5),
                              Offstage(
                                offstage: nendoData.memo == null,
                                child: ListNendoMemoView(memo: nendoData.memo!),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Visibility(
                      visible: modeController.modeIndex == 1 && nendoData.have,
                      child: Positioned(
                          bottom: -7.5,
                          right: 2.5,
                          child: ElevatedButton(
                            onPressed: () {
                              showNendoInfoEditDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(12.5, 7.5, 12.5, 7.5),
                              minimumSize: const Size(0, 0),
                            ),
                            child: const Text(
                              '상세편집',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )),
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
    if (modeController.modeIndex == BottomSheetController.haveEdit) {
      String purchasePrice = "";
      if (nendoData.myPrice != null && nendoData.have) {
        purchasePrice = '구매가격 : ${IntlUtil.comma(nendoData.myPrice!)} 원';
      } else {
        purchasePrice = '출시가격 : ${IntlUtil.comma(nendoData.price)} 엔';
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
        ],
      );
    } else {
      String purchasePrice = '출시가격 : ${IntlUtil.comma(nendoData.price)} 엔';
      if (nendoData.myPrice != null && nendoData.have) {
        purchasePrice += ' | 구매가격 : ${IntlUtil.comma(nendoData.myPrice!)} 원';
      }
      return Text(
        purchasePrice,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          height: 1.0,
          fontSize: 12.0,
        ),
      );
    }
  }

  void showNendoInfoEditDialog(BuildContext context) {
    Get.dialog(
      NendoInfoEditDialog(nendoData: nendoData),
    );
  }
}
