import 'dart:developer' as developer;
import 'dart:io';
import 'package:event_vault/database/functions/add_event_task/add_event_task.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/screens/event_task/event_task_edit.dart';
import 'package:event_vault/screens/task_screen/task_detail.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget eventTaskCard(
    {required BuildContext context,
    required Task taskDetails,
    required String eventId}) {
  developer.log(taskDetails.dueDate);

  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.white,
      onTap: () {
        final task = Task(
            taskID: taskDetails.taskID,
            taskTitle: taskDetails.taskTitle,
            taskDescription: taskDetails.taskDescription,
            dueDate: taskDetails.dueDate,
            image: taskDetails.image);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TaskDetail(
            task: task,
          ),
        ));
      },
      child: Card(
        elevation: 20,
        color: AppTheme.secondary,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 15, bottom: 15, right: 15),
              child: Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(taskDetails.image)),
                        fit: BoxFit.fill),
                    color: AppTheme.hint,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskDetails.taskTitle,
                  style: myFont(size: 20),
                ),
                Text(
                  taskDetails.dueDate,
                  style: hintFont(),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: PopupMenuButton(
                iconSize: 30,
                iconColor: AppTheme.textW,
                color: AppTheme.secondary,
                itemBuilder: (context) => [
                  PopupMenuItem(
                      onTap: () {
                        final task = Task(
                            taskID: taskDetails.taskID,
                            taskTitle: taskDetails.taskTitle,
                            taskDescription: taskDetails.taskDescription,
                            dueDate: taskDetails.dueDate,
                            image: taskDetails.image);

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditEventTask(
                            eventID: eventId,
                            task: task,
                          ),
                        ));
                      },
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 20,
                            children: [
                              Icon(
                                Icons.edit,
                                color: AppTheme.hilite,
                                size: 30,
                              ),
                              Text(
                                'Edit',
                                style: myFont(size: 20),
                              )
                            ],
                          ),
                        ],
                      )),
                  PopupMenuItem(
                      onTap: () => customAlertBox(
                            context,
                            message: 'Do you want to delete this task',
                            icon: Icons.delete,
                            noPressed: () {
                              Navigator.pop(context);
                            },
                            yesPressed: () {
                              deleteEventTask(taskDetails.taskID);
                              Navigator.pop(context);
                            },
                          ),
                      child: Row(
                        children: [
                          Wrap(spacing: 20, children: [
                            Icon(
                              Icons.delete,
                              color: AppTheme.delete,
                              size: 30,
                            ),
                            Text(
                              'Delete',
                              style: myFont(size: 20),
                            )
                          ]),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
