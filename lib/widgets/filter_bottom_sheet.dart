import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_list/controllers/bottom_sheet_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({Key? key}) : super(key: key);
  final BottomSheetController controller = Get.find<BottomSheetController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Text(
            "편집 모드",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: controller.modeIndex.value == 0 ?
                      Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                    onPressed: () => controller.changeMode(0),
                    child: const Text(
                      "일반모드",
                      style: TextStyle(),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: controller.modeIndex.value == 1 ?
                      Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                    onPressed: () => controller.changeMode(1),
                    child: const Text(
                      "보유넨도편집",
                      style: TextStyle(),
                    )
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: controller.modeIndex.value == 2 ?
                      Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                    onPressed: () =>  controller.changeMode(2),
                    child: const Text(
                      "위시넨도편집",
                      style: TextStyle(),
                    )
                  ),
                ],
              )),
          const SizedBox(height: 20.0),
          Text(
            "정렬 방식",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(backgroundColor: !controller.descendingSort.value ?
                  Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                  onPressed: () => controller.changeSorting(false),
                  child: const Text(
                    "오름차순",
                    style: TextStyle(),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: controller.descendingSort.value ?
                    Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                    onPressed: () => controller.changeSorting(true),
                    child: const Text(
                      "내림차순",
                      style: TextStyle(),
                    )
                ),
              )
            ],
          )),
          const SizedBox(height: 10.0),
          const SizedBox(height: 20.0),
          Text(
            "필터",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10.0),
          GetBuilder<BottomSheetController>(
            builder: (controller) => Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: controller.nendoFilterIndex == 0 ?
                      Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                    onPressed: () {
                      controller.setNendoFilterIndex(0);
                    },
                    child: const Text(
                      "내가 보유한 넨도만 보기",
                      style: TextStyle(),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: controller.nendoFilterIndex == 1 ?
                      Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                    onPressed: () {
                      controller.setNendoFilterIndex(1);
                    },
                    child: const Text(
                      "내가 미보유한 넨도만 보기",
                      style: TextStyle(),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: controller.nendoFilterIndex == 2 ?
                      Theme.of(context).colorScheme.background.withAlpha(80) : Theme.of(context).colorScheme.surface),
                    onPressed: () {
                      controller.setNendoFilterIndex(2);
                    },
                    child: const Text(
                      "나의 위시 넨도만 보기",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
