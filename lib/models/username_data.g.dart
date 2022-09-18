// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsernameData _$UsernameDataFromJson(Map<String, dynamic> json) => UsernameData(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsernameDataToJson(UsernameData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      profileImageUrl: json['profile_image_url'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'profile_image_url': instance.profileImageUrl,
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
    };
