import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:hive/hive.dart';
part 'event_task_model.g.dart';

@HiveType(typeId: 6)
class EventTaskModel {
  @HiveField(0)
  Task task;
  @HiveField(1)
  String eventTaskID;
  @HiveField(2)
  String eventID;
  EventTaskModel(
      {required this.eventTaskID, required this.task, required this.eventID});
}
