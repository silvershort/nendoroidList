import 'package:nendoroid_db/models/username_data.dart';

class NewsData {
  InformationType type;
  UserData author;
  String? title;
  String content;
  String createdAt;
  List<String> imageUrlList;

  NewsData({
    required this.type,
    required this.author,
    this.title,
    required this.content,
    required this.createdAt,
    required this.imageUrlList,
  });
}

enum InformationType {
  twitter,
  dc,
}
