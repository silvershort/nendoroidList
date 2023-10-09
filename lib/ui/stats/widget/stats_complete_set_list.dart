import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';

class StatsCompleteSetList extends ConsumerWidget {
  const StatsCompleteSetList({
    Key? key,
    required this.nendoList,
    required this.setData,
  }) : super(key: key);
  final List<NendoData> nendoList;
  final List<SetData> setData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> setList = ref.watch(nendoProvider.notifier).getCompleteSetList();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: setList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              setList[index],
            ),
          ],
        );
      },
    );
  }
}
