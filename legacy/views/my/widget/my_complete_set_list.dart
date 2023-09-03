import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';

class MyCompleteSetList extends GetView<MyController> {
  const MyCompleteSetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<String> setList = priceController.getCompleteSetList();
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
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          );
        },
      );
    });
  }
}
