// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DecorationModelAdapter extends TypeAdapter<DecorationModel> {
  @override
  final int typeId = 2;

  @override
  DecorationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DecorationModel(
      budget: fields[0] as String,
      selectedMenu: fields[1] as String,
      specialRequirements: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DecorationModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.budget)
      ..writeByte(1)
      ..write(obj.selectedMenu)
      ..writeByte(2)
      ..write(obj.specialRequirements);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecorationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
