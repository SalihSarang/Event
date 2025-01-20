import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:hive_flutter/adapters.dart';
part 'catering_add_menu.g.dart';

@HiveType(typeId: 4)
class CateringAddMenu {
  @HiveField(0)
  String itemName;
  @HiveField(1)
  String price;
  @HiveField(2)
  EventAddingModal getEventId;
  CateringAddMenu(
      {required this.itemName, required this.price, required this.getEventId});
}
