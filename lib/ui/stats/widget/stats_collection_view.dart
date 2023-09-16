import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/text/accent_text.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';

import 'stats_collection_painter.dart';

class StatsCollectionView extends ConsumerWidget {
  const StatsCollectionView({
    Key? key,
    required this.nendoList,
  }) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "수집한 넨도로이드",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CommonDialog(
                      content: '보유 넨도로이드 텍스트로 복사하시겠습니까?',
                      negativeText: '취소',
                      positiveOnClick: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: ref.read(nendoProvider.notifier).getHaveNendoText(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: AccentText(
                context: context,
                accentWord: "${nendoList.getHaveCount()}",
                normalWord: " / ${nendoList.length}",
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              "(중복포함 넨도개수 : ${nendoList.getTotalHaveCount()}개)",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 13.0),
            ),
          ],
        ),
        const SizedBox(
          width: 20.0,
        ),
        SizedBox(
          height: 70.0,
          width: 70.0,
          child: CustomPaint(
            foregroundPainter: StatsCollectionPainter(
                lineColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                completeColor: Theme.of(context).colorScheme.outline,
                textColor: DefaultTextStyle.of(context).style.color ?? Colors.black,
                completePercent: nendoList.getHaveRate(),
                width: 8.0),
          ),
        ),
      ],
    );
  }
}
