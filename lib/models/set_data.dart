import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'set_data.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class SetData {
  @HiveField(0)
  String setName;
  @HiveField(1)
  List<String> list;

  SetData({required this.setName, required this.list,});

  factory SetData.fromJson(Map<String, dynamic> json) => _$SetDataFromJson(json);

  Map<String, dynamic> toJson() => _$SetDataToJson(this);
}