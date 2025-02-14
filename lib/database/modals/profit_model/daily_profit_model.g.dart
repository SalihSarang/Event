// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_profit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyProfitModelAdapter extends TypeAdapter<DailyProfitModel> {
  @override
  final int typeId = 9;

  @override
  DailyProfitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyProfitModel(
      dailyProfitId: fields[0] as String,
      dailyProfit: fields[1] as String,
      date: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DailyProfitModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dailyProfitId)
      ..writeByte(1)
      ..write(obj.dailyProfit)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyProfitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
