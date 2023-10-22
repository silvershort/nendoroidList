import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/news_item_data.dart';

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
                const Icon(Icons.arrow_forward_ios, size: 16,),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          height: 190,
          child: ListView.separated(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final NewsItemData item = itemList[index];
              return InkWell(
                onTap: () {
                  onTap?.call(index);
                },
                child: SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ExtendedImage.network(
                            item.imagePath,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          if (item.soldOut)
                            Container(
                              width: 120,
                              height: 120,
                              color: Colors.black38,
                              alignment: Alignment.center,
                              child: Text(
                                'SOLD OUT',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(style: Theme.of(context).textTheme.bodySmall, children: [
                          if (item.number != null)
                            TextSpan(
                                text: '[${item.number}] ',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.deepOrange,
                                    )),
                          TextSpan(
                            text: item.name,
                          ),
                        ]),
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        '${item.price.replaceAll('원', '')}원',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  ),
                ),
              );
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
