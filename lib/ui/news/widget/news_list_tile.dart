import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/news_item_data.dart';

class NewsListTile extends StatelessWidget {
  const NewsListTile({Key? key, this.onTap, required this.item}) : super(key: key);
  final VoidCallback? onTap;
  final NewsItemData item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
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
            if (item.price != null)
              Text(
                '${item.price!.replaceAll('원', '')}원',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
