import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/custom_listenable_builder/task_card/task_card.dart';
import 'package:event_vault/widgets/screen_task/screen_task.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBg,
      appBar: CustomAppBar(title: 'Task'),
      floatingActionButton: customFloatingButton(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TaskCard(),
          ],
        ),
      ),
    );
  }
}
