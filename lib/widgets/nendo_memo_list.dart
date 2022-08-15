import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';

class NendoMemoList extends StatelessWidget {
  NendoMemoList({Key? key, required this.num}) : super(key: key);

  final String num;
  final NendoController nendoController = Get.find<NendoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 10.0,
          runSpacing: 5.0,
          children: memoTag(context, nendoController.getNendoData(num).memo ?? []),
        ),
      ],
    ));
  }

  List<Widget> memoTag(BuildContext context, List<String> memoList) {
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
          fontSize: 12.0,
        ),
        labelPadding: const EdgeInsets.only(left: 10.0),
        padding: const EdgeInsets.all(0),
        deleteIcon: const Icon(
          Icons.clear,
          size: 14.0,
        ),
        onDeleted: () {
          nendoController.deleteNendoMemo(num, memo);
        },
      );
      tagList.add(tag);
    }
    return tagList;
  }
}
