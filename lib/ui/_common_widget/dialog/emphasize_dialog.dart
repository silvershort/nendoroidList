import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/models/nendo_list_setting/grid_visible_data.dart';
import 'package:nendoroid_db/provider/yen_exchange_rate_provider.dart';

class EmphasizeDialog extends ConsumerWidget {
  const EmphasizeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(
        "강조할 옵션을 선택해주세요.",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _EmphasizeTile(
            title: '없음',
            onTap: () => context.pop(const NonEmphasize()),
          ),
          _EmphasizeTile(
            title: '보유',
            onTap: () => context.pop(const HaveEmphasize()),
          ),
          _EmphasizeTile(
            title: '예약',
            onTap: () => context.pop(const PreOrderEmphasize()),
          ),
          _EmphasizeTile(
            title: '위시',
            onTap: () => context.pop(const WishEmphasize()),
          ),
        ],
      ),
    );
  }
}

class _EmphasizeTile extends StatelessWidget {
  const _EmphasizeTile({required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
