import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({Key? key}) : super(key: key);
  final BottomSheetController controller = Get.find<BottomSheetController>();

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).colorScheme.tertiary.withAlpha(80);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
                          backgroundColor: controller.modeIndex == 0
                              ? selectedColor
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
                            backgroundColor: controller.modeIndex == 1
                                ? selectedColor
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
                            backgroundColor: controller.modeIndex == 2
                                ? selectedColor
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
                          backgroundColor: controller.sortData.sortingMethod == BottomSheetController.num
                              ? selectedColor
                              : Theme.of(context).colorScheme.surface),
                      onPressed: () => controller.setNameSort(),
                      child: Text(
                        controller.sortData.numSortOrder ? "번호순↑" : "번호순↓",
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
                            backgroundColor: controller.sortData.sortingMethod == BottomSheetController.release
                                ? selectedColor
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () => controller.setReleaseSort(),
                        child: Text(
                          controller.sortData.releaseSortOrder ? "출시일순↑" : "출시일순↓",
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
                            backgroundColor: controller.filterData.haveFilter
                                ? selectedColor
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.haveFilter);
                        },
                        child: const Text(
                          "보유",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.filterData.notHaveFilter
                                ? selectedColor
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.notHaveFilter);
                        },
                        child: const Text(
                          "미보유",
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
                            backgroundColor: controller.filterData.wishFilter
                                ? selectedColor
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.wishFilter);
                        },
                        child: const Text(
                          "위시",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.filterData.expectedFilter
                                ? selectedColor
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.expectedFilter);
                        },
                        child: const Text(
                          "출시예정",
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
                            backgroundColor: controller.filterData.femaleFilter
                                ? selectedColor
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.femaleFilter);
                        },
                        child: const Text(
                          "여성",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: controller.filterData.maleFilter
                                ? selectedColor
                                : Theme.of(context).colorScheme.surface),
                        onPressed: () {
                          controller.setNendoFilterIndex(BottomSheetController.maleFilter);
                        },
                        child: const Text(
                          "남성",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
