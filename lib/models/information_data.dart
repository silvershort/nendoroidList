class InformationData {
  InformationType type;
  String author;
  String? title;
  String content;
  String createdAt;
  List<String> imageUrlList;

  InformationData({
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
