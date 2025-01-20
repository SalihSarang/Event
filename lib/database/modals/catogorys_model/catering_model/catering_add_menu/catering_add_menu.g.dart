// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catering_add_menu.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CateringAddMenuAdapter extends TypeAdapter<CateringAddMenu> {
  @override
  final int typeId = 4;

  @override
  CateringAddMenu read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CateringAddMenu(
      itemName: fields[0] as String,
      price: fields[1] as String,
      getEventId: fields[2] as EventAddingModal,
    );
  }

  @override
  void write(BinaryWriter writer, CateringAddMenu obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.getEventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CateringAddMenuAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
