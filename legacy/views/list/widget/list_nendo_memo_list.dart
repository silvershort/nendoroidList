import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';

class ListNendoMemoList extends GetView<NendoController> {
  const ListNendoMemoList({Key? key, required this.num}) : super(key: key);
  final String num;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Wrap(
          spacing: 5.0,
          runSpacing: 2.5,
          children: memoTag(context, priceController.getNendoData(num).memo ?? []),
        ),
      ],
    ));
  }

  List<Widget> memoTag(BuildContext context, List<String> memoList) {
    return memoList.map((memo) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              memo,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 5.0),
            GestureDetector(
              onTap: () {
                priceController.deleteNendoMemo(num, memo);
              },
              child: const Icon(
                Icons.clear,
                size: 12.0,
              ),
            )
          ],
        ),
      );
    }).toList();
    List<Widget> tagList = [];
    for (String memo in memoList) {
      Widget tag = Chip(
        backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 0.5,
          )
        ),
        label: Text(memo),
        labelStyle: const TextStyle(
          fontSize: 10.0,
        ),
        labelPadding: const EdgeInsets.only(left: 10.0),
        padding: const EdgeInsets.all(0),
        deleteIcon: const Icon(
          Icons.clear,
          size: 12.0,
        ),
        onDeleted: () {
          priceController.deleteNendoMemo(num, memo);
        },
      );
      tagList.add(tag);
    }
    return tagList;
  }
}
