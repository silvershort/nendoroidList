import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/widgets/news/news_attach.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.data}) : super(key: key);
  final NewsData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ExtendedImage.network(
                data.author.profileImageUrl,
                width: 40.0,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(20.0),
                cache: true,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.author.username,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        IntlUtil.convertDate(gmtTime: data.createdAt),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  switch(data.type) {
                    case NewsType.twitter:
                      final url = Uri.parse("https://twitter.com/${data.author.username}/status/${data.id}");
                      canLaunchUrl(url).then(
                            (value) => launchUrl(url, mode: LaunchMode.externalApplication),
                      );
                      break;
                    case NewsType.dc:
                    default:
                      break;
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_forward,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(height: 0, thickness: 1.2),
          const SizedBox(height: 10.0),
          Text(
            data.content,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(),
          ),
          const SizedBox(height: 10.0),
          NewsAttach(attachList: data.imageUrlList),
        ],
      ),
    );
  }
}
