import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/views/list/dialog/nendo_add_memo_dialog.dart';
import 'package:nendoroid_db/views/list/dialog/nendo_price_reset_dialog.dart';
import 'package:nendoroid_db/views/list/widget/list_nendo_memo_list.dart';

class NendoInfoEditDialog extends StatelessWidget {
  NendoInfoEditDialog({Key? key, required this.nendoData}) : super(key: key);
  final NendoData nendoData;

  final NendoController nendoController = Get.find<NendoController>();
  final TextEditingController controller = TextEditingController();
  final FocusNode priceFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    controller.text = nendoData.myPrice != null ? IntlUtil.comma(nendoData.myPrice!) : "";

    return GestureDetector(
      onTap: () {
        // priceFocus.unfocus();
      },
      child: AlertDialog(
        title: const Text("상세정보 편집"),
        insetPadding: const EdgeInsets.all(20.0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text("구매 가격 : "),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      focusNode: priceFocus,
                      controller: controller,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ThousandsSeparatorInputFormatter(),
                      ],
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(7.5),
                        labelText: '구매가격(원)',
                        labelStyle: TextStyle(
                          fontSize: 12.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        suffixText: "원",
                        suffixStyle: TextStyle(
                          fontSize: 12,
                        )
                      ),
                      onSubmitted: (text) {
                        int price = int.parse(controller.text.replaceAll(",", ""));
                        nendoController.setNendoPurchasePrice(nendoData.num, price);
                      },
                    ),
                  ),
                  const SizedBox(width: 2.5),
                  Obx(
                    () => Visibility(
                      visible: nendoController.getNendoData(nendoData.num).myPrice != null,
                      child: InkWell(
                        onTap: () {
                          priceFocus.unfocus();
                          Get.dialog(
                            NendoPriceResetDialog(
                              nendoData: nendoData,
                              callback: (reset) {
                                if (reset) {
                                  controller.text = "";
                                }
                              },
                            ),
                          );
                        },
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.highlight_remove_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("보유 개수 : "),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 32.0,
                          height: 26.0,
                          child: OutlinedButton(
                            onPressed: () {
                              nendoController.setNendoHaveCount(nendoData.num, nendoData.count - 1);
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(32, 26),
                              padding: const EdgeInsets.all(0),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Obx(
                          () => Container(
                            height: 24.0,
                            alignment: Alignment.center,
                            child: Text(nendoController.getNendoData(nendoData.num).count.toString()),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          width: 32.0,
                          height: 26.0,
                          child: OutlinedButton(
                            onPressed: () {
                              nendoController.setNendoHaveCount(nendoData.num, nendoData.count + 1);
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(32, 26),
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
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("메모 : "),
                  const SizedBox(width: 10.0),
                  SizedBox(
                    height: 28.0,
                    child: OutlinedButton(
                        onPressed: () {
                          Get.dialog(
                            NendoAddMemoDialog(
                              num: nendoData.num,
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(40, 28),
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add,
                              size: 12,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '추가',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ListNendoMemoList(num: nendoData.num),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  if (controller.text.isEmpty) {
                    Get.back();
                  } else {
                    int price = int.parse(controller.text.replaceAll(",", ""));
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
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) && oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex = newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}