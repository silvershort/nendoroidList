// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubscribeDataAdapter extends TypeAdapter<_$SubscribeDataImpl> {
  @override
  final int typeId = 4;

  @override
  _$SubscribeDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SubscribeDataImpl(
      twitterSubscribe: fields[0] as TwitterSubscribe,
      dcinsideSubscribe: fields[1] as DcinsideSubscribe,
      ruliwebSubscribe: fields[2] as RuliwebSubscribe,
    );
  }

  @override
  void write(BinaryWriter writer, _$SubscribeDataImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.twitterSubscribe)
      ..writeByte(1)
      ..write(obj.dcinsideSubscribe)
      ..writeByte(2)
      ..write(obj.ruliwebSubscribe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscribeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TwitterSubscribeAdapter extends TypeAdapter<_$TwitterSubscribeImpl> {
  @override
  final int typeId = 5;

  @override
  _$TwitterSubscribeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TwitterSubscribeImpl(
      goodSmileJP: fields[0] as bool,
      goodSmileUS: fields[1] as bool,
      goodSmileKR: fields[2] as bool,
      ninimal: fields[3] as bool,
      figureInfo: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$TwitterSubscribeImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.goodSmileJP)
      ..writeByte(1)
      ..write(obj.goodSmileUS)
      ..writeByte(2)
      ..write(obj.goodSmileKR)
      ..writeByte(3)
      ..write(obj.ninimal)
      ..writeByte(4)
      ..write(obj.figureInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TwitterSubscribeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DcinsideSubscribeAdapter extends TypeAdapter<_$DcinsideSubscribeImpl> {
  @override
  final int typeId = 6;

  @override
  _$DcinsideSubscribeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$DcinsideSubscribeImpl(
      information: fields[0] as bool,
      review: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$DcinsideSubscribeImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.information)
      ..writeByte(1)
      ..write(obj.review);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DcinsideSubscribeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RuliwebSubscribeAdapter extends TypeAdapter<_$RuliwebSubscribeImpl> {
  @override
  final int typeId = 7;

  @override
  _$RuliwebSubscribeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$RuliwebSubscribeImpl(
      information: fields[0] as bool,
      review: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$RuliwebSubscribeImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.information)
      ..writeByte(1)
      ..write(obj.review);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuliwebSubscribeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
