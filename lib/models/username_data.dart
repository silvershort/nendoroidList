import 'package:json_annotation/json_annotation.dart';

part 'username_data.g.dart';

@JsonSerializable()
class UsernameData {
  List<UserData> data;

  UsernameData({
    required this.data,
  });

  factory UsernameData.fromJson(Map<String, dynamic> json) => _$UsernameDataFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameDataToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "profile_image_url")
  String profileImageUrl;
  String id;
  String name;
  String username;

  UserData({
    required this.profileImageUrl,
    required this.id,
    required this.name,
    required this.username,
  });
  
  factory UserData.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
