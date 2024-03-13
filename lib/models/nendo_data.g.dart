// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nendo_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NendoDataAdapter extends TypeAdapter<NendoData> {
  @override
  final int typeId = 0;

  @override
  NendoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NendoData(
      num: fields[0] as String,
      name: fields[1] as Name,
      series: fields[2] as Series,
      gscProductNum: fields[3] as int,
      price: fields[4] as int,
      releaseDate: (fields[5] as List).cast<String>(),
      image: fields[6] as String,
      have: fields[8] as bool,
      wish: fields[9] as bool,
      count: fields[10] as int,
      gender: fields[7] as String?,
      myPrice: fields[11] as int?,
      memo: (fields[12] as List?)?.cast<String>(),
      type: fields[13] as String?,
      image2: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NendoData obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.num)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.series)
      ..writeByte(3)
      ..write(obj.gscProductNum)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.have)
      ..writeByte(9)
      ..write(obj.wish)
      ..writeByte(10)
      ..write(obj.count)
      ..writeByte(11)
      ..write(obj.myPrice)
      ..writeByte(12)
      ..write(obj.memo)
      ..writeByte(13)
      ..write(obj.type)
      ..writeByte(14)
      ..write(obj.image2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NendoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NameAdapter extends TypeAdapter<Name> {
  @override
  final int typeId = 1;

  @override
  Name read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Name(
      ko: fields[0] as String?,
      ja: fields[1] as String?,
      en: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Name obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ko)
      ..writeByte(1)
      ..write(obj.ja)
      ..writeByte(2)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeriesAdapter extends TypeAdapter<Series> {
  @override
  final int typeId = 2;

  @override
  Series read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Series(
      ko: fields[0] as String?,
      ja: fields[1] as String?,
      en: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Series obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ko)
      ..writeByte(1)
      ..write(obj.ja)
      ..writeByte(2)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NendoData _$NendoDataFromJson(Map<String, dynamic> json) => NendoData(
      num: json['num'] as String,
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      series: Series.fromJson(json['series'] as Map<String, dynamic>),
      gscProductNum: json['gsc_productNum'] as int,
      price: json['price'] as int,
      releaseDate: (json['release_date'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String,
      have: json['have'] as bool? ?? false,
      wish: json['wish'] as bool? ?? false,
      count: json['count'] as int? ?? 0,
      gender: json['gender'] as String?,
      myPrice: json['myPrice'] as int?,
      memo: (json['memo'] as List<dynamic>?)?.map((e) => e as String).toList(),
      type: json['type'] as String?,
      image2: json['image2'] as String?,
    );

Map<String, dynamic> _$NendoDataToJson(NendoData instance) => <String, dynamic>{
      'num': instance.num,
      'name': instance.name,
      'series': instance.series,
      'gsc_productNum': instance.gscProductNum,
      'price': instance.price,
      'release_date': instance.releaseDate,
      'image': instance.image,
      'gender': instance.gender,
      'have': instance.have,
      'wish': instance.wish,
      'count': instance.count,
      'myPrice': instance.myPrice,
      'memo': instance.memo,
      'type': instance.type,
      'image2': instance.image2,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      ko: json['ko'] as String?,
      ja: json['ja'] as String?,
      en: json['en'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'ko': instance.ko,
      'ja': instance.ja,
      'en': instance.en,
    };

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      ko: json['ko'] as String?,
      ja: json['ja'] as String?,
      en: json['en'] as String?,
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'ko': instance.ko,
      'ja': instance.ja,
      'en': instance.en,
    };
