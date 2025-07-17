import 'package:flutter/material.dart';
import 'package:nendoroid_db/app/extention/list_extension.dart';
import 'package:nendoroid_db/feature/_common/component/text/accent_text.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/dialog/detail_dialog.dart';

class StatsReleaseWishView extends StatelessWidget {
  const StatsReleaseWishView({
    Key? key,
    required this.nendoList,
  }) : super(key: key);
  final List<NendoData> nendoList;

  @override
  Widget build(BuildContext context) {
    List<NendoData> releaseList = nendoList.getThisMonthWishList();

    if (releaseList.isEmpty) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          Text(
            "이번달 출시 예정인 위시 넨도로이드",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5.0,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: releaseList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    child: AccentText(
                      context: context,
                      accentWord: "[${releaseList[index].num}]",
                      normalWord: " ${releaseList[index].name.ko}",
                      fontSize: 18.0,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DetailDialog(nendoData: releaseList[index]);
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
