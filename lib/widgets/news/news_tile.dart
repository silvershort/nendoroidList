import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/utilities/app_font.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/widgets/news/news_attach.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

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
                shape: BoxShape.circle,
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
              Visibility(
                visible: data.author.id == "68864104" || data.author.id == "755974370",
                child: InkWell(
                  onTap: () {
                    switch (data.type) {
                      case NewsType.twitter:
                        final url = Uri.parse("https://translate.google.co.kr/?hl=ko&tab=wT&sl=auto&tl=ko&text=${data.content}&op=translate");
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
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.translate,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  switch (data.type) {
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
                    Icons.keyboard_arrow_right,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(height: 0, thickness: 1.2),
          const SizedBox(height: 10.0),
          Html(
            data: data.content,
            shrinkWrap: true,
            style: {
              "body": Style(
                fontSize: const FontSize(15.0),
                fontFamily: AppFont.oneMobile,
              ),
            },
          ),
          /*Text(
            data.content,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(),
          ),*/
          const SizedBox(height: 10.0),
          NewsAttach(attachList: data.imageUrlList),
        ],
      ),
    );
  }
}
