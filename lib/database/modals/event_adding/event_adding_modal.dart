import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:hive_flutter/adapters.dart';
part 'event_adding_modal.g.dart';

@HiveType(typeId: 0)
class EventAddModal {
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
  @HiveField(9)
  List<ItemModel> items;
  @HiveField(10)
  String special;
  @HiveField(11)
  String image;
  @HiveField(12)
  String budget;

  EventAddModal(
      {required this.catogory,
      required this.eventName,
      required this.date,
      required this.time,
      required this.location,
      required this.description,
      required this.clientName,
      required this.contactInfo,
      required this.eventId,
      required this.items,
      required this.special,
      required this.image,
      required this.budget});
}
