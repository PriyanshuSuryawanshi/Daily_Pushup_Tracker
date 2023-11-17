// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pushupdata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushupDataAdapter extends TypeAdapter<PushupData> {
  @override
  final int typeId = 1;

  @override
  PushupData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushupData(
      date: fields[0] as DateTime,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PushupData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushupDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImpValuesDataAdapter extends TypeAdapter<ImpValuesData> {
  @override
  final int typeId = 2;

  @override
  ImpValuesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImpValuesData(
      field: fields[0] as String,
      value: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ImpValuesData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.field)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpValuesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
