import 'package:event_vault/database/functions/%20task/task.dart';
import 'package:event_vault/widgets/empty_list_handling/empty_list_handling.dart';
import 'package:event_vault/widgets/screen_task/screen_task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  void initState() {
    super.initState();
    getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskListenable,
      builder: (context, tasks, child) {
        if (tasks.isEmpty) {
          return emptyList(message: 'No Task');
        } else {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return taskCard(
                  context: context,
                  taskDescription: task.taskDescription,
                  taskId: task.taskID,
                  taskTitle: task.taskTitle,
                  dueDate: task.dueDate,
                  image: task.image);
            },
          );
        }
      },
    );
  }
}
