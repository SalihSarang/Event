// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catogory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatogoryModelAdapter extends TypeAdapter<CatogoryModel> {
  @override
  final int typeId = 1;

  @override
  CatogoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatogoryModel(
      name: fields[0] as String,
      catogoryId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatogoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.catogoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatogoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
