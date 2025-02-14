import 'dart:io';
import 'package:event_vault/database/functions/%20task/task.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/screen_function/task/task_screen_fn.dart';
import 'package:event_vault/screens/task_screen/edit_task.dart';
import 'package:event_vault/screens/task_screen/task_detail.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/buttons/save_add_btn/save_add_btn.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

Widget customFloatingButton(
    {required BuildContext context, required VoidCallback onPressed}) {
  return SizedBox(
    height: 65,
    width: 65,
    child: FloatingActionButton(
      elevation: 10,
      splashColor: AppTheme.secondary,
      backgroundColor: AppTheme.hilite,
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        size: 35,
      ),
    ),
  );
}

Widget taskCard(
    {required String taskTitle,
    required String dueDate,
    required String image,
    required String taskId,
    required String taskDescription,
    required BuildContext context}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.white,
      onTap: () {
        final task = Task(
            taskID: taskId,
            taskTitle: taskTitle,
            taskDescription: taskDescription,
            dueDate: dueDate,
            image: image);
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
                        image: FileImage(File(image)), fit: BoxFit.fill),
                    color: AppTheme.hint,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: myFont(size: 20),
                ),
                Text(
                  dueDate,
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
                            taskID: taskId,
                            taskTitle: taskTitle,
                            taskDescription: taskDescription,
                            dueDate: dueDate,
                            image: image);

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditTask(
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
                              deleteTask(taskId);
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

Widget customFloatingBtn(
    {required String taskTitle,
    required String dueDate,
    required String taskDescription,
    required String image,
    required GlobalKey<FormState> taskFormKey,
    required BuildContext context}) {
  String masage;
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        saveCancelColumn(
          upBtn: 'Cancel',
          downBtn: 'Save',
          onDownBtn: () {
            developer.log(image);
            validateForm(
              context: context,
              taskFormKey: taskFormKey,
              dueDate: dueDate,
              image: image,
              taskDescription: taskDescription,
              taskTitle: taskTitle,
            );
          },
          onUpBtn: () {},
        ),
      ],
    ),
  );
}

Widget updateCustomFloatingBtn(
    {required TextEditingController taskTitle,
    required TextEditingController dueDate,
    required TextEditingController taskDescription,
    required String image,
    required GlobalKey<FormState> taskFormKey,
    required BuildContext context,
    required taskID}) {
  String masage;
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        saveCancelColumn(
          upBtn: 'Cancel',
          downBtn: 'Save',
          onDownBtn: () {
            developer.log(taskTitle.text);

            updateValidateForm(
                context: context,
                taskFormKey: taskFormKey,
                dueDate: dueDate.text,
                image: image,
                taskDescription: taskDescription.text,
                taskTitle: taskTitle.text,
                taskID: taskID);
          },
          onUpBtn: () {},
        ),
      ],
    ),
  );
}
