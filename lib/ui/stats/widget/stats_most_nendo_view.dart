import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/detail_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/text/accent_text.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';

class StatsMostNendoView extends StatelessWidget {
  const StatsMostNendoView({
    Key? key,
    required this.nendoList,
  }) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    List<NendoData> mostList = nendoList.getMostHaveNendo();

    if (mostList.isEmpty) {
      return const SizedBox(height: 0.0);
    } else {
      return Column(
        children: [
          Text(
            "가장 많이 가지고 있는 넨도로이드",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5.0,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: mostList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    child: AccentText(
                      context: context,
                      accentWord: "[${mostList[index].num}] ${mostList[index].name.ko}",
                      normalWord: " (${mostList[index].count}개)",
                      fontSize: 18.0,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DetailDialog(nendoData: mostList[index]);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20.0),
        ],
      );
    }
  }
}
