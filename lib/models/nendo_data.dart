import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nendoroid_db/models/nen_doll_data.dart';

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
  @HiveField(13)
  String? type;
  @HiveField(14, defaultValue: false)
  bool preOrder;

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
    this.type,
    this.preOrder = false,
  });

  factory NendoData.fromJson(Map<String, dynamic> json) => _$NendoDataFromJson(json);

  factory NendoData.fromNenDoll(NenDollData dollData) {
    return NendoData(
      num: dollData.gscProductNum.toString(),
      name: dollData.name,
      series: dollData.series,
      gscProductNum: dollData.gscProductNum,
      price: dollData.price,
      releaseDate: dollData.releaseDate ?? [],
      image: dollData.image,
      gender: dollData.gender,
      type: dollData.type,
    );
  }

  Map<String, dynamic> toJson() => _$NendoDataToJson(this);

  NendoData copyWith({
    String? num,
    Name? name,
    Series? series,
    int? gscProductNum,
    int? price,
    List<String>? releaseDate,
    String? image,
    String? gender,
    bool? have,
    bool? wish,
    int? count,
    int? myPrice,
    List<String>? memo,
    String? type,
    String? image2,
    bool? preOrder
  }) {
    return NendoData(
      num: num ?? this.num,
      name: name ?? this.name,
      series: series ?? this.series,
      gscProductNum: gscProductNum ?? this.gscProductNum,
      price: price ?? this.price,
      releaseDate: releaseDate ?? this.releaseDate,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      have: have ?? this.have,
      wish: wish ?? this.wish,
      count: count ?? this.count,
      myPrice: myPrice ?? this.myPrice,
      memo: memo ?? this.memo,
      type: type ?? this.type,
      preOrder: preOrder ?? this.preOrder,
    );
  }

  @override
  String toString() {
    return 'NendoData{num: $num, name: $name, series: $series, gscProductNum: $gscProductNum, price: $price, releaseDate: $releaseDate, image: $image, gender: $gender, have: $have, wish: $wish, count: $count, myPrice: $myPrice, memo: $memo, type: $type, preOrder: $preOrder}';
  }
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

  @override
  String toString() {
    return 'Name{ko: $ko, ja: $ja, en: $en}';
  }
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

  @override
  String toString() {
    return 'Series{ko: $ko, ja: $ja, en: $en}';
  }
}
