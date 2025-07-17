import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/app/constant/constant.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/dialog/detail_dialog.dart';
import 'package:nendoroid_db/feature/scraping/model/news_item_data.dart';
import 'package:nendoroid_db/feature/scraping/ui/widget/news_list_tile.dart';
import 'package:prototype_constrained_box/prototype_constrained_box.dart';

class NewsListSection extends StatelessWidget {
  const NewsListSection({
    super.key,
    required this.title,
    required this.itemList,
    this.nendoList,
    this.onTitleTap,
    this.onTap,
  });

  final String title;
  final List<NewsItemData> itemList;
  final List<NendoData>? nendoList;
  final VoidCallback? onTitleTap;
  final Function(int index)? onTap;

  factory NewsListSection.nendoData({
    required String title,
    required List<NendoData> nendoList,
    required VoidCallback? onTitleTap,
    Function(int index)? onTap,
  }) {
    return NewsListSection(
      title: title,
      itemList: const [],
      nendoList: nendoList,
      onTitleTap: onTitleTap,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty && nendoList == null) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTitleTap,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        if (nendoList == null)
          PrototypeConstrainedBox.tightFor(
            prototype: NewsListTile(
              onTap: null,
              item: NewsItemData(
                name: Constant.longText,
                imagePath: '',
                price: itemList.first.price,
              ),
            ),
            height: true,
            width: false,
            child: ListView.separated(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final NewsItemData item = itemList[index];
                return NewsListTile(
                  item: item,
                  onTap: () {
                    onTap?.call(index);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 5,
                );
              },
              itemCount: itemList.length,
            ),
          )
        else
          SizedBox(
            height: 120,
            child: ListView.separated(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final NendoData nendoData = nendoList![index];
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DetailDialog(nendoData: nendoData);
                      },
                    );
                  },
                  child: ExtendedImage.network(
                    nendoData.image,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    cache: true,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 5,
                );
              },
              itemCount: nendoList!.length,
            ),
          ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
