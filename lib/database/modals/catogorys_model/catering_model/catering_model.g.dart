// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catering_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CataringMenuModelAdapter extends TypeAdapter<CataringMenuModel> {
  @override
  final int typeId = 1;

  @override
  CataringMenuModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CataringMenuModel(
      budget: fields[0] as String,
      selectedItems: fields[1] as String,
      price: fields[2] as String,
      specialRequirements: fields[3] as String,
      getEventId: fields[4] as EventAddingModal,
    );
  }

  @override
  void write(BinaryWriter writer, CataringMenuModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.budget)
      ..writeByte(1)
      ..write(obj.selectedItems)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.specialRequirements)
      ..writeByte(4)
      ..write(obj.getEventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CataringMenuModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
