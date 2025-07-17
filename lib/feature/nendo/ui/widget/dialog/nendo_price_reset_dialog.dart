import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_provider.dart';

class NendoPriceResetDialog extends ConsumerWidget {
  const NendoPriceResetDialog({Key? key, required this.nendoData, required this.callback}) : super(key: key);
  final NendoData nendoData;
  final Function(bool reset) callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("구매가격 초기화"),
      content: const Text("구매가격을 초기화 하시겠습니까?"),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
            callback(false);
          },
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () {
            context.pop();
            ref.read(nendoProvider.notifier).setNendoPurchasePrice(nendoData.num, null);
            callback(true);
          },
          child: const Text("확인"),
        ),
      ],
    );
  }
}
