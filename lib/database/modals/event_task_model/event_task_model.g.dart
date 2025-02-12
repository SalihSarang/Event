// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventTaskModelAdapter extends TypeAdapter<EventTaskModel> {
  @override
  final int typeId = 6;

  @override
  EventTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventTaskModel(
      eventTaskID: fields[1] as String,
      task: fields[0] as Task,
    );
  }

  @override
  void write(BinaryWriter writer, EventTaskModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.task)
      ..writeByte(1)
      ..write(obj.eventTaskID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
