import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 3)
class Task {
  @HiveField(0)
  String taskID;
  @HiveField(1)
  String taskTitle;
  @HiveField(2)
  String taskDescription;
  @HiveField(3)
  String dueDate;
  @HiveField(4)
  String image;
  Task(
      {required this.taskID,
      required this.taskTitle,
      required this.taskDescription,
      required this.dueDate,
      required this.image});
}
