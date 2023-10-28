import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nendoroid_db/models/news_item_data.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends ConsumerWidget {
  const NewsDetailScreen({
    super.key,
    required this.title,
    required this.homePage,
    required this.itemList,
  });

  final String title;
  final String homePage;
  final List<NewsItemData> itemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideAppbar = ref.watch(appSettingProvider.select((value) => value.hideUI));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(title),
            pinned: !hideAppbar,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse(homePage), mode: LaunchMode.externalApplication);
              },
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$title 홈페이지 이동',
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse(homePage),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            sliver: SliverAlignedGrid(
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              itemCount: 100,
              itemBuilder: (context, index) {
                final NewsItemData item = itemList[index];
                return InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(item.link), mode: LaunchMode.externalApplication);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ExtendedImage.network(
                            item.imagePath,
                            fit: BoxFit.cover,
                          ),
                          if (item.soldOut)
                            Positioned(
                              bottom: 0,
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black38,
                                alignment: Alignment.center,
                                child: Text(
                                  'SOLD OUT',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '${item.price.replaceAll('원', '')}원',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                          if (item.number != null)
                            TextSpan(
                                text: '[${item.number}] ',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.deepOrange,
                                    )),
                          TextSpan(
                            text: item.name,
                          ),
                        ]),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.sizeOf(context).width ~/ 160,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
