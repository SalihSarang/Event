// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PendingEventsAdapter extends TypeAdapter<PendingEvents> {
  @override
  final int typeId = 5;

  @override
  PendingEvents read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PendingEvents(
      pendingID: fields[0] as String,
      event: fields[1] as EventAddModal,
    );
  }

  @override
  void write(BinaryWriter writer, PendingEvents obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pendingID)
      ..writeByte(1)
      ..write(obj.event);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PendingEventsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
