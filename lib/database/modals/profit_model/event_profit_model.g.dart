// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_profit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventProfitModelAdapter extends TypeAdapter<EventProfitModel> {
  @override
  final int typeId = 8;

  @override
  EventProfitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventProfitModel(
      profitId: fields[0] as String,
      profit: fields[1] as String,
      eventId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EventProfitModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.profitId)
      ..writeByte(1)
      ..write(obj.profit)
      ..writeByte(2)
      ..write(obj.eventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventProfitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
