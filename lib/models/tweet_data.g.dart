// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetData _$TweetDataFromJson(Map<String, dynamic> json) => TweetData(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      includes: json['includes'] == null
          ? null
          : Includes.fromJson(json['includes'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TweetDataToJson(TweetData instance) => <String, dynamic>{
      'data': instance.data,
      'includes': instance.includes,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      text: json['text'] as String,
      attachments: json['attachments'] == null
          ? null
          : Attachments.fromJson(json['attachments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'text': instance.text,
      'attachments': instance.attachments,
    };

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      mediaKeys: (json['media_keys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'media_keys': instance.mediaKeys,
    };

Includes _$IncludesFromJson(Map<String, dynamic> json) => Includes(
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IncludesToJson(Includes instance) => <String, dynamic>{
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      mediaKey: json['media_key'] as String,
      type: json['type'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'media_key': instance.mediaKey,
      'type': instance.type,
      'url': instance.url,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      nextToken: json['next_token'] as String?,
      resultCount: json['result_count'] as int?,
      newestId: json['newest_id'] as String?,
      oldestId: json['oldest_id'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'next_token': instance.nextToken,
      'result_count': instance.resultCount,
      'newest_id': instance.newestId,
      'oldest_id': instance.oldestId,
    };
