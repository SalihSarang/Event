import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'pending_model.g.dart';

@HiveType(typeId: 5)
class PendingEvents {
  @HiveField(0)
  String pendingID;
  @HiveField(1)
  EventAddModal event;
  PendingEvents({required this.pendingID, required this.event});
}
