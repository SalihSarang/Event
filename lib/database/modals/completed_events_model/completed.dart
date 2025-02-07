import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:hive/hive.dart';
part 'completed.g.dart';

@HiveType(typeId: 4)
class Completed {
  @HiveField(0)
  EventAddModal event;
  @HiveField(1)
  String completedID;
  Completed({required this.completedID, required this.event});
}
