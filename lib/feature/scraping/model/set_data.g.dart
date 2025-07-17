// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SetDataAdapter extends TypeAdapter<SetData> {
  @override
  final int typeId = 3;

  @override
  SetData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SetData(
      setName: fields[0] as String,
      list: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SetData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.setName)
      ..writeByte(1)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetData _$SetDataFromJson(Map<String, dynamic> json) => SetData(
      setName: json['setName'] as String,
      list: (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SetDataToJson(SetData instance) => <String, dynamic>{
      'setName': instance.setName,
      'list': instance.list,
    };
