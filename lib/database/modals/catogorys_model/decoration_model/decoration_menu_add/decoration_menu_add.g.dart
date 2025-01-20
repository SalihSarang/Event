// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration_menu_add.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DecorationMenuAddAdapter extends TypeAdapter<DecorationMenuAdd> {
  @override
  final int typeId = 5;

  @override
  DecorationMenuAdd read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DecorationMenuAdd(
      decorationItem: fields[0] as String,
      quantity: fields[1] as String,
      price: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DecorationMenuAdd obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.decorationItem)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecorationMenuAddAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
