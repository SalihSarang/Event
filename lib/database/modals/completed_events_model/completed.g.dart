// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedAdapter extends TypeAdapter<Completed> {
  @override
  final int typeId = 4;

  @override
  Completed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Completed(
      completedID: fields[1] as String,
      event: fields[0] as EventAddModal,
    );
  }

  @override
  void write(BinaryWriter writer, Completed obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.event)
      ..writeByte(1)
      ..write(obj.completedID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
