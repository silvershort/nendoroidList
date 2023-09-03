import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/provider/yen_exchange_rate_provider.dart';
import 'package:nendoroid_db/ui/widget/dialog/price_info_dialog.dart';
import 'package:nendoroid_db/ui/widget/icon/help_icon.dart';
import 'package:nendoroid_db/ui/widget/text/accent_text.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';
import 'package:nendoroid_db/utilities/extension/num_extension.dart';

class StatsTotalPriceView extends StatelessWidget {
  const StatsTotalPriceView({
    Key? key,
    required this.nendoList,
  }) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "  구매한 넨도로이드 가격 총합",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: 5.0,
            ),
            HelpIcon(onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const PriceInfoDialog();
                },
              );
            }),
          ],
        ),
        const SizedBox(
          height: 3.0,
        ),
        Consumer(
          builder: (context, ref, child) {
            final yen = ref.watch(yenExchangeRateProvider);
            return AccentText(
              context: context,
              accentWord: nendoList.getSumPrice(yen).comma,
              normalWord: "원",
              fontSize: 18.0,
            );
          },
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
