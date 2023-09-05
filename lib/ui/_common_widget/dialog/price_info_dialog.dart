import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/provider/yen_exchange_rate_provider.dart';

class PriceInfoDialog extends ConsumerWidget {
  const PriceInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yenRate = ref.watch(yenExchangeRateProvider);

    return AlertDialog(
      title: const Text("가격 합산 방식"),
      // TODO: 환율정보 넣기
      content: Text(
        "가지고 있는 넨도로이드의 가격을 직접 입력했을경우 입력한 가격을 사용하고 입력하지 않았을 경우 "
            "출시 가격을 이용하여 가격을 합산합니다.\n출시 가격의 경우 오늘의 환율을 적용하여 원화 가격으로 변환해주고 있으며, "
            "환율정보를 가져오지 못했을경우 100엔당 1000원으로 계산합니다.\n\n"
            "오늘의 환율 : $yenRate원",
        style: const TextStyle(height: 1.3),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text("확인"),
        ),
      ],
    );
  }
}
