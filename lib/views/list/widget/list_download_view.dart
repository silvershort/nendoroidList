import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';

class ListDownloadView extends GetView<NendoController> {
  const ListDownloadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${controller.currentStep} / ${controller.totalStep}"),
          const SizedBox(
            height: 5.0,
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: LinearProgressIndicator(
              value: controller.currentStep / controller.totalStep,
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
