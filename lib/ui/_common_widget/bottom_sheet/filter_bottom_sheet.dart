import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/doll_type.dart';
import 'package:nendoroid_db/models/nendo_list_setting/nendo_setting_sealed.dart';
import 'package:nendoroid_db/models/nendo_list_setting/sort_data.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';

class FilterBottomSheet extends ConsumerWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoListSettingProvider);
    final controller = ref.read(nendoListSettingProvider.notifier);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          // const SizedBox(height: 20.0),
          // Text(
          //   "데이터 타입",
          //   style: TextStyle(
          //     color: Theme.of(context).colorScheme.secondary,
          //   ),
          // ),
          // const SizedBox(height: 10.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.425,
          //       child: OutlinedButton(
          //         style: OutlinedButton.styleFrom(
          //           backgroundColor: switch (state.dataType) {
          //             NendoroidData() => Theme.of(context).colorScheme.surfaceVariant,
          //             _ => Theme.of(context).colorScheme.surface,
          //           },
          //         ),
          //         onPressed: () => controller.changeDataType(NendoroidData()),
          //         child: const Text(
          //           "넨도로이드",
          //           style: TextStyle(),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.425,
          //       child: OutlinedButton(
          //           style: OutlinedButton.styleFrom(
          //             backgroundColor: switch (state.dataType) {
          //               NendoroidDollData() => Theme.of(context).colorScheme.surfaceVariant,
          //               _ => Theme.of(context).colorScheme.surface,
          //             },
          //           ),
          //           onPressed: () => controller.changeDataType(NendoroidDollData()),
          //           child: const Text(
          //             "넨도로이드 돌",
          //             style: TextStyle(),
          //           )),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 20.0),
          Text(
            "보기 방식",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.425,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: switch (state.viewMode) {
                      ListViewMode() => Theme.of(context).colorScheme.surfaceVariant,
                      _ => Theme.of(context).colorScheme.surface,
                    },
                  ),
                  onPressed: () => controller.changeViewMode(ListViewMode()),
                  child: const Text(
                    "리스트",
                    style: TextStyle(),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.425,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: switch (state.viewMode) {
                        GridListViewMode() => Theme.of(context).colorScheme.surfaceVariant,
                        _ => Theme.of(context).colorScheme.surface,
                      },
                    ),
                    onPressed: () => controller.changeViewMode(GridListViewMode()),
                    child: const Text(
                      "격자",
                      style: TextStyle(),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            "편집 모드",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: switch (state.editMode) {
                      Normal() => Theme.of(context).colorScheme.surfaceContainerHighest,
                      _ => Theme.of(context).colorScheme.surface,
                    },
                  ),
                  onPressed: () => controller.changeEditMode(Normal()),
                  child: const Text(
                    "일반",
                    style: TextStyle(),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: switch (state.editMode) {
                        Have() => Theme.of(context).colorScheme.surfaceContainerHighest,
                        _ => Theme.of(context).colorScheme.surface,
                      },
                    ),
                    onPressed: () => controller.changeEditMode(Have()),
                    child: const Text(
                      "보유",
                      style: TextStyle(),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: switch (state.editMode) {
                        PreOrder() => Theme.of(context).colorScheme.surfaceContainerHighest,
                        _ => Theme.of(context).colorScheme.surface,
                      },
                    ),
                    onPressed: () => controller.changeEditMode(PreOrder()),
                    child: const Text(
                      "예약",
                      style: TextStyle(),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: switch (state.editMode) {
                        Wish() => Theme.of(context).colorScheme.surfaceContainerHighest,
                        _ => Theme.of(context).colorScheme.surface,
                      },
                    ),
                    onPressed: () => controller.changeEditMode(Wish()),
                    child: const Text(
                      "위시",
                      style: TextStyle(),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            "정렬 방식",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.425,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: switch (state.sortData.sortingMethod) {
                      SortingMethodNum() => Theme.of(context).colorScheme.surfaceVariant,
                      SortingMethodRelease() => Theme.of(context).colorScheme.surface,
                    },
                  ),
                  onPressed: () => controller.setNumSort(),
                  child: Text(
                    switch (state.sortData.sortingOrder) {
                      ASC() => "번호순↑",
                      DESC() => "번호순↓",
                    },
                    style: const TextStyle(
                      height: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.425,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: switch (state.sortData.sortingMethod) {
                        SortingMethodNum() => Theme.of(context).colorScheme.surface,
                        SortingMethodRelease() => Theme.of(context).colorScheme.surfaceVariant,
                      },
                    ),
                    onPressed: () => controller.setReleaseSort(),
                    child: Text(
                      switch (state.sortData.sortingOrder) {
                        ASC() => "출시일순↑",
                        _ => "출시일순↓",
                      },
                      style: const TextStyle(
                        height: 1.0,
                      ),
                    )),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          switch (state.dataType) {
            NendoroidData() => const _FilterColunm(),
            NendoroidDollData() => const _DollFilterColunm(),
          },
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class _FilterColunm extends ConsumerWidget {
  const _FilterColunm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoListSettingProvider);
    final controller = ref.read(nendoListSettingProvider.notifier);

    return Column(
      children: [
        Text(
          "필터",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 10.0),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _FilterButton(
                  isSelected: state.filterData.haveFilter,
                  onPressed: () {
                    controller.changeFilterData(state.filterData.invertHave());
                  },
                  title: '보유',
                ),
                _FilterButton(
                  isSelected: state.filterData.notHaveFilter,
                  onPressed: () {
                    controller.changeFilterData(state.filterData.invertNotHave());
                  },
                  title: '미보유',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _FilterButton(
                  isSelected: state.filterData.preOrderFilter,
                  onPressed: () {
                    controller.changeFilterData(state.filterData.invertPreOrder());
                  },
                  title: '예약',
                ),
                _FilterButton(
                  isSelected: state.filterData.wishFilter,
                  onPressed: () {
                    controller.changeFilterData(state.filterData.invertWish());
                  },
                  title: '위시',
                ),
                // _FilterButton(
                //   isSelected: state.filterData.expectedFilter,
                //   onPressed: () {
                //     controller.changeFilterData(state.filterData.invertExpected());
                //   },
                //   title: '출시예정',
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _FilterButton(
                  width: MediaQuery.of(context).size.width * 0.275,
                  isSelected: state.filterData.femaleFilter,
                  onPressed: () {
                    controller.changeFilterData(state.filterData.invertFemale());
                  },
                  title: '여성',
                ),
                _FilterButton(
                  width: MediaQuery.of(context).size.width * 0.275,
                  isSelected: state.filterData.maleFilter,
                  onPressed: () {
                    controller.changeFilterData(state.filterData.invertMale());
                  },
                  title: '남성',
                ),
                _FilterButton(
                  width: MediaQuery.of(context).size.width * 0.275,
                  isSelected: state.filterData.etcFilter,
                  onPressed: () {
                    controller.changeFilterData(state.filterData.invertEtc());
                  },
                  title: '기타',
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ],
    );
  }
}

class _DollFilterColunm extends ConsumerWidget {
  const _DollFilterColunm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoListSettingProvider);
    final controller = ref.read(nendoListSettingProvider.notifier);

    return Column(
      children: [
        Text(
          "필터",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 10.0),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _FilterButton(
                  isSelected: state.dollFilterData.dollFilter,
                  onPressed: () {
                    controller.changeFilterDollData(state.dollFilterData.invertDoll());
                  },
                  title: DollType.doll.name,
                ),
                _FilterButton(
                  isSelected: state.dollFilterData.bodyFilter,
                  onPressed: () {
                    controller.changeFilterDollData(state.dollFilterData.invertBody());
                  },
                  title: DollType.body.name,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _FilterButton(
                  isSelected: state.dollFilterData.clothesFilter,
                  onPressed: () {
                    controller.changeFilterDollData(state.dollFilterData.invertClothes());
                  },
                  title: DollType.clothes.name,
                ),
                _FilterButton(
                  isSelected: state.dollFilterData.customizingFilter,
                  onPressed: () {
                    controller.changeFilterDollData(state.dollFilterData.invertCustomizing());
                  },
                  title: DollType.customizing.name,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    Key? key,
    this.width,
    required this.isSelected,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final double? width;
  final bool isSelected;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.425,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Theme.of(context).colorScheme.surfaceVariant : Theme.of(context).colorScheme.surface,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
