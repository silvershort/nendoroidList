import 'package:nendoroid_db/models/username_data.dart';

class NewsData {
  NewsType type;
  UserData author;
  String? title;
  String? id;
  String? link;
  String? subject;
  String content;
  String createdAt;
  List<String> imageUrlList;

  NewsData({
    required this.type,
    required this.author,
    this.title,
    this.id,
    this.link,
    this.subject,
    required this.content,
    required this.createdAt,
    required this.imageUrlList,
  });
}

enum NewsType {
  twitter,
  dc,
  ruliweb,
}
