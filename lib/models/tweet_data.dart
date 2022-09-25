import 'package:json_annotation/json_annotation.dart';

part 'tweet_data.g.dart';

@JsonSerializable()
class TweetData {
  List<Data> data;
  Includes? includes;
  Meta meta;

  TweetData({
    required this.data,
    this.includes,
    required this.meta,
  });

  factory TweetData.fromJson(Map<String, dynamic> json) => _$TweetDataFromJson(json);

  Map<String, dynamic> toJson() => _$TweetDataToJson(this);
}

@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: "created_at")
  String createdAt;
  String text;
  Attachments? attachments;

  Data({
    required this.id,
    required this.createdAt,
    required this.text,
    this.attachments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Attachments {
  @JsonKey(name: "media_keys")
  List<String> mediaKeys;

  Attachments({
    required this.mediaKeys,
  });

  factory Attachments.fromJson(Map<String, dynamic> json) => _$AttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}

@JsonSerializable()
class Includes {
  List<Media>? media;

  Includes({this.media});

  factory Includes.fromJson(Map<String, dynamic> json) => _$IncludesFromJson(json);

  Map<String, dynamic> toJson() => _$IncludesToJson(this);
}

@JsonSerializable()
class Media {
  @JsonKey(name: "media_key")
  String mediaKey;
  String type;
  String? url;

  Media({
    required this.mediaKey,
    required this.type,
    this.url,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "next_token")
  String? nextToken;
  @JsonKey(name: "result_count")
  int? resultCount;
  @JsonKey(name: "newest_id")
  String? newestId;
  @JsonKey(name: "oldest_id")
  String? oldestId;

  Meta({
    this.nextToken,
    this.resultCount,
    this.newestId,
    this.oldestId,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
