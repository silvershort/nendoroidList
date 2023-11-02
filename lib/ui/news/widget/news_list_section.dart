import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/news_item_data.dart';
import 'package:nendoroid_db/ui/news/widget/news_list_tile.dart';
import 'package:nendoroid_db/utilities/constant.dart';
import 'package:prototype_constrained_box/prototype_constrained_box.dart';

class NewsListSection extends StatelessWidget {
  const NewsListSection({
    Key? key,
    required this.title,
    required this.itemList,
    this.onTitleTap,
    this.onTap,
  }) : super(key: key);

  final String title;
  final List<NewsItemData> itemList;
  final VoidCallback? onTitleTap;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
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
              return NewsListTile(item: item, onTap: () {
                onTap?.call(index);
              },);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            itemCount: itemList.length,
          ),
        ),
      ],
    );
  }
}
