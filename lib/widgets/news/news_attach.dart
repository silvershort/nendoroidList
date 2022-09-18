import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/pages/image_view_page.dart';

class NewsAttach extends StatelessWidget {
  const NewsAttach({Key? key, required this.attachList}) : super(key: key);
  final List<String> attachList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10.0,
      runSpacing: 5.0,
      children: imageWidgetList(),
    );
  }

  List<Widget> imageWidgetList() {
    List<Widget> widgetList = [];
    for (int i = 0; i < attachList.length; i++) {
      widgetList.add(InkWell(
        onTap: () {
          Get.to(
            ImageViewPage(
              attachList: attachList,
              initialIndex: i,
            ),
          );
        },
        child: ExtendedImage.network(
          attachList[i],
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          cache: true,
        ),
      ));
    }
    return widgetList;
  }
}
