import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nendo_data.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class NendoData {
  @HiveField(0)
  String num;
  @HiveField(1)
  Name name;
  @HiveField(2)
  Series series;
  @HiveField(3)
  @JsonKey(name: "gsc_productNum")
  int gscProductNum;
  @HiveField(4)
  int price;
  @HiveField(5)
  @JsonKey(name: "release_date")
  List<String> releaseDate;
  @HiveField(6)
  String image;
  @HiveField(7)
  String? gender;
  @HiveField(8)
  bool have;
  @HiveField(9)
  bool wish;
  @HiveField(10)
  int count;
  @HiveField(11)
  int? myPrice;
  @HiveField(12)
  List<String>? memo;

  NendoData({
    required this.num,
    required this.name,
    required this.series,
    required this.gscProductNum,
    required this.price,
    required this.releaseDate,
    required this.image,
    this.have = false,
    this.wish = false,
    this.count = 0,
    this.gender,
    this.myPrice,
    this.memo,
  });

  factory NendoData.fromJson(Map<String, dynamic> json) => _$NendoDataFromJson(json);

  Map<String, dynamic> toJson() => _$NendoDataToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Name {
  @HiveField(0)
  String? ko;
  @HiveField(1)
  String? ja;
  @HiveField(2)
  String? en;

  Name({
    this.ko,
    this.ja,
    this.en,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Series {
  @HiveField(0)
  String? ko;
  @HiveField(1)
  String? ja;
  @HiveField(2)
  String? en;

  Series({
    this.ko,
    this.ja,
    this.en,
  });

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}
