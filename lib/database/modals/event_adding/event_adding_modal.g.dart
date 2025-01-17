// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_adding_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAddingModalAdapter extends TypeAdapter<EventAddingModal> {
  @override
  final int typeId = 0;

  @override
  EventAddingModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventAddingModal(
      catogory: fields[0] as String,
      eventName: fields[1] as String,
      date: fields[2] as String,
      time: fields[3] as String,
      location: fields[4] as String,
      description: fields[5] as String,
      clientName: fields[6] as String,
      contactInfo: fields[7] as String,
      eventId: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EventAddingModal obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.catogory)
      ..writeByte(1)
      ..write(obj.eventName)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.clientName)
      ..writeByte(7)
      ..write(obj.contactInfo)
      ..writeByte(8)
      ..write(obj.eventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAddingModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
