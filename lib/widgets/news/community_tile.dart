import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/utilities/app_font.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/widgets/news/news_attach.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

class CommunityTile extends StatelessWidget {
  const CommunityTile({Key? key, required this.data}) : super(key: key);
  final NewsData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final url = Uri.parse(data.link ?? "");
        canLaunchUrl(url).then((value) => launchUrl(url, mode: LaunchMode.externalApplication),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ExtendedImage.asset(
                    data.author.profileImageUrl,
                    width: 32.0,
                    fit: BoxFit.cover,
                    shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Opacity(
                        opacity: 0.7,
                        child: Row(
                          children: [
                            Text(
                              "${data.subject} | ",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                            Text(
                              data.type == NewsType.ruliweb ? IntlUtil.convertRuliwebDateFormat(data.createdAt) : data.createdAt,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5.0),
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
