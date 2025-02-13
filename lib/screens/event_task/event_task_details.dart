import 'package:event_vault/database/functions/%20add_task/add_task.dart';
import 'package:event_vault/database/modals/event_task_model/event_task_model.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/screens/event_task/event_task_edit.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/buttons/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/event_detail_screen/event_detail_page.dart';
import 'package:flutter/material.dart';

class EventTaskDetails extends StatefulWidget {
  EventTaskDetails(
      {super.key,
      required this.task,
      required this.eventId,
      required this.eventTask});
  Task task;
  final String eventId;
  EventTaskModel eventTask;
  @override
  State<EventTaskDetails> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<EventTaskDetails> {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEventTask(
                          eventID: widget.eventId,
                          task: widget.task,
                          eventTask: widget.eventTask,
                        ),
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
