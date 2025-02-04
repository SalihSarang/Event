import 'package:event_vault/database/functions/%20add_task/add_task.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/screen_task/screen_task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

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
