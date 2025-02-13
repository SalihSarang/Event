import 'package:event_vault/database/functions/%20add_task/add_task.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/screens/task_screen/edit_task.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/buttons/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/event_detail_screen/event_detail_page.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  TaskDetail({super.key, required this.task});
  Task task;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Task Details'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ImageContainer(image: widget.task.image),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Clientinfo(
                details: widget.task.taskTitle,
                title: 'Task',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child:
                  Clientinfo(details: widget.task.dueDate, title: 'Due Date'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: EventDescription(
                  title: 'Task Description',
                  discriptionData: widget.task.taskDescription),
            ),
            saveCancelRow(
                rightBtn: 'Edit',
                leftBtn: 'Delete',
                onRightBtn: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditTask(task: widget.task),
                  ));
                },
                onleftBtn: () {
                  customAlertBox(
                    context,
                    message: 'Do you want to delete this Task',
                    icon: Icons.delete,
                    noPressed: () => Navigator.pop(context),
                    yesPressed: () {
                      deleteTask(widget.task.taskID);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  );
                },
                context: context)
          ],
        ),
      ),
    );
  }
}
