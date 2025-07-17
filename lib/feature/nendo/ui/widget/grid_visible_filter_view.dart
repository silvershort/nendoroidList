import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/feature/_common/component/state_button/default_check_box.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_list_setting/nendo_setting_sealed.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/emphasize_button.dart';

/// 그리드뷰에서
class GridVisibleFilterView extends ConsumerWidget {
  const GridVisibleFilterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(nendoListSettingProvider.select((value) => value.viewMode));
    final state = ref.watch(nendoListSettingProvider.select((value) => value.gridVisibleData));
    final controller = ref.read(nendoListSettingProvider.notifier);

    switch (viewMode) {
      case ListViewMode():
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      case GridListViewMode():
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Text(
                        '- 격자뷰에서 표시할 옵션',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary
                            ),
                      ),
                      const Spacer(),
                      const EmphasizeButton(),
                    ],
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: [
                    DefaultCheckBox(
                      onChanged: (isChecked) {
                        controller.setGridVisibleData(
                          state.copyWith(
                            number: isChecked,
                          ),
                        );
                      },
                      text: '번호',
                      initialValue: state.number,
                    ),
                    DefaultCheckBox(
                      onChanged: (isChecked) {
                        controller.setGridVisibleData(
                          state.copyWith(
                            name: isChecked,
                          ),
                        );
                      },
                      text: '이름',
                      initialValue: state.name,
                    ),
                    DefaultCheckBox(
                      onChanged: (isChecked) {
                        controller.setGridVisibleData(
                          state.copyWith(
                            have: isChecked,
                          ),
                        );
                      },
                      text: '보유',
                      initialValue: state.have,
                    ),
                    DefaultCheckBox(
                      onChanged: (isChecked) {
                        controller.setGridVisibleData(
                          state.copyWith(
                            preOrder: isChecked,
                          ),
                        );
                      },
                      text: '예약',
                      initialValue: state.preOrder,
                    ),
                    DefaultCheckBox(
                      onChanged: (isChecked) {
                        controller.setGridVisibleData(
                          state.copyWith(
                            wish: isChecked,
                          ),
                        );
                      },
                      text: '위시',
                      initialValue: state.wish,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    }
  }
}
