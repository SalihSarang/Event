import 'package:event_vault/database/functions/%20add_task/add_task.dart';
import 'package:event_vault/utils/font/app_font.dart';
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
          return Center(
            child: Text(
              'No Task',
              style: hintFont(size: 40),
            ),
          );
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
