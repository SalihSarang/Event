import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:hive_flutter/adapters.dart';
part 'catering_model.g.dart';

@HiveType(typeId: 1)
class CataringMenuModel {
  @HiveField(0)
  String budget;
  @HiveField(1)
  String selectedItems;
  @HiveField(2)
  String price;
  @HiveField(3)
  String specialRequirements;
  @HiveField(4)
  EventAddingModal getEventId;
  CataringMenuModel(
      {required this.budget,
      required this.selectedItems,
      required this.price,
      required this.specialRequirements,
      required this.getEventId});
}
