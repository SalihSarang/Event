// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartyModelAdapter extends TypeAdapter<PartyModel> {
  @override
  final int typeId = 3;

  @override
  PartyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartyModel(
      partyName: fields[0] as String,
      guestCount: fields[1] as String,
      budget: fields[2] as String,
      cateringDetails: fields[3] as CataringMenuModel,
      decorationDetails: fields[4] as DecorationModel,
    );
  }

  @override
  void write(BinaryWriter writer, PartyModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.partyName)
      ..writeByte(1)
      ..write(obj.guestCount)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.cateringDetails)
      ..writeByte(4)
      ..write(obj.decorationDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
