import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_list_setting/grid_visible_data.dart';
import 'package:nendoroid_db/provider/nendo_setting_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/emphasize_dialog.dart';

/// 격자뷰에서 특정 조건의 아이템을 DIM 처리하여 강조할 수 있게 해주는 버튼
class EmphasizeButton extends ConsumerWidget {
  const EmphasizeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoListSettingProvider.select((value) => value.gridVisibleData.emphasize));

    return InkWell(
      onTap: () async {
        final Emphasize? result = await showDialog(
          context: context,
          builder: (context) {
            return const EmphasizeDialog();
          },
        );

        final gridData = ref.read(nendoListSettingProvider).gridVisibleData;

        switch (result) {
          case null:
            break;
          case NonEmphasize():
            ref.read(nendoListSettingProvider.notifier).setGridVisibleData(gridData.copyWith(
                  emphasize: const NonEmphasize(),
                ));
          case HaveEmphasize():
            ref.read(nendoListSettingProvider.notifier).setGridVisibleData(gridData.copyWith(
                  emphasize: const HaveEmphasize(),
                ));
          case PreOrderEmphasize():
            ref.read(nendoListSettingProvider.notifier).setGridVisibleData(gridData.copyWith(
                  emphasize: const PreOrderEmphasize(),
                ));
          case WishEmphasize():
            ref.read(nendoListSettingProvider.notifier).setGridVisibleData(gridData.copyWith(
                  emphasize: const WishEmphasize(),
                ));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 0.5),
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              switch (state) {
                NonEmphasize() => '강조선택',
                HaveEmphasize() => '보유강조',
                PreOrderEmphasize() => '예약강조',
                WishEmphasize() => '위시강조',
              },
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: state != const NonEmphasize() ? Theme.of(context).colorScheme.primary : null,
              ),
            ),
            const Icon(Icons.arrow_drop_down_outlined, size: 14),
          ],
        ),
      ),
    );
  }
}
