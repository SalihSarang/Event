import 'package:hive_flutter/adapters.dart';
part 'event_adding_modal.g.dart';

@HiveType(typeId: 0)
class EventAddingModal {
  @HiveField(0)
  String catogory;
  @HiveField(1)
  String eventName;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  String location;
  @HiveField(5)
  String description;
  @HiveField(6)
  String clientName;
  @HiveField(7)
  String contactInfo;
  @HiveField(8)
  String eventId;
  EventAddingModal(
      {required this.catogory,
      required this.eventName,
      required this.date,
      required this.time,
      required this.location,
      required this.description,
      required this.clientName,
      required this.contactInfo,
      required this.eventId});
}
