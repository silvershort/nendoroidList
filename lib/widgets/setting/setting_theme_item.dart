import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';

class SettingThemeItem extends GetView<SettingController> {
  const SettingThemeItem({
    Key? key,
    required this.primarySwatches,
  }) : super(key: key);
  final List<MaterialColor> primarySwatches;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: primarySwatches.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 48,
        childAspectRatio: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            color: primarySwatches[index],
          ),
          onTap: () {
            controller.setAppTheme(index);
          },
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}
