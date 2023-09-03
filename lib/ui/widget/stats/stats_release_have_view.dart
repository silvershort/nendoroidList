import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/ui/widget/dialog/detail_dialog.dart';
import 'package:nendoroid_db/ui/widget/text/accent_text.dart';
import 'package:nendoroid_db/utilities/extension/list_extension.dart';

class StatsReleaseHaveView extends StatelessWidget {
  const StatsReleaseHaveView({Key? key, required this.nendoList}) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    List<NendoData> releaseNendoList = nendoList.getThisMonthHaveList();

    if (releaseNendoList.isEmpty) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          Text(
            "이번달 출시 예정인 나의 넨도로이드",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5.0,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: releaseNendoList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    child: AccentText(
                      context: context,
                      accentWord: "[${releaseNendoList[index].num}]",
                      normalWord: " ${releaseNendoList[index].name.ko}",
                      fontSize: 18.0,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DetailDialog(nendoData: releaseNendoList[index]);
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
