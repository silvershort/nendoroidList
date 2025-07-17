import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_provider.dart';

class StatsCompleteSetList extends ConsumerWidget {
  const StatsCompleteSetList({
    super.key,
    required this.nendoList,
    // required this.setData,
  });
  final List<NendoData> nendoList;
  // final List<SetData> setData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setList = ref.watch(nendoProvider.notifier).getCompleteSetList();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: setList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Icon(
              generateIconData(setList[index].count),
              color: Colors.amber,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Text(
                setList[index].name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        );
      },
    );
  }

  IconData generateIconData(int totalCount) {
    return switch (totalCount) {
      >= 25 => Icons.stars_outlined,
      >= 15 => Icons.stars,
      >= 7 => Icons.hotel_class,
      _ => Icons.star,
    };
  }
}
