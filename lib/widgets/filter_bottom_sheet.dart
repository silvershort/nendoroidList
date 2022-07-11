import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({Key? key}) : super(key: key);
  final BottomSheetController controller = Get.find<BottomSheetController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400.0,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: controller.modeIndex.value == 0
                              ? Theme.of(context).colorScheme.background.withAlpha(80)
                              : Theme.of(context).colorScheme.surface),
                      onPressed: () => controller.changeMode(0),
                      child: const Text(
                        "일반모드",
                        style: TextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.modeIndex.value == 1
                                ? Theme.of(context).colorScheme.background.withAlpha(80)
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () => controller.changeMode(1),
                        child: const Text(
                          "보유편집",
                          style: TextStyle(),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.modeIndex.value == 2
                                ? Theme.of(context).colorScheme.background.withAlpha(80)
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () => controller.changeMode(2),
                        child: const Text(
                          "위시편집",
                          style: TextStyle(),
                        )),
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
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: controller.sortData.value.sortingMethod == BottomSheetController.num
                              ? Theme.of(context).colorScheme.background.withAlpha(80)
                              : Theme.of(context).colorScheme.surface),
                      onPressed: () => controller.setNameSort(),
                      child: Text(
                        controller.sortData.value.numSortOrder ? "번호순↑" : "번호순↓",
                        style: const TextStyle(
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.sortData.value.sortingMethod == BottomSheetController.release
                                ? Theme.of(context).colorScheme.background.withAlpha(80)
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () => controller.setReleaseSort(),
                        child: Text(
                          controller.sortData.value.releaseSortOrder ? "출시일순↑" : "출시일순↓",
                          style: const TextStyle(
                            height: 1.0,
                          ),
                        )),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.nendoFilterIndex == BottomSheetController.haveFilter
                                ? Theme.of(context).colorScheme.background.withAlpha(80)
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.haveFilter);
                        },
                        child: const Text(
                          "보유 넨도만",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.nendoFilterIndex == BottomSheetController.notHaveFilter
                                ? Theme.of(context).colorScheme.background.withAlpha(80)
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.notHaveFilter);
                        },
                        child: const Text(
                          "미보유 넨도만",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.nendoFilterIndex == BottomSheetController.wishFilter
                                ? Theme.of(context).colorScheme.background.withAlpha(80)
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.wishFilter);
                        },
                        child: const Text(
                          "위시 넨도만",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.nendoFilterIndex == BottomSheetController.expectedFilter
                                ? Theme.of(context).colorScheme.background.withAlpha(80)
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.expectedFilter);
                        },
                        child: const Text(
                          "출시예정 넨도만",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
