import 'package:event_vault/database/functions/%20task/task.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/utils/validation/event_adding/event_image/event_image.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

validateForm(
    {required GlobalKey<FormState> taskFormKey,
    required String taskTitle,
    required String dueDate,
    required String taskDescription,
    required String image,
    required BuildContext context}) {
  developer.log(image);

  if (taskFormKey.currentState!.validate()) {
    eventImageValidation(image, context);
    developer.log(image);

    final task = Task(
        taskID: generateID(),
        taskTitle: taskTitle,
        taskDescription: taskDescription,
        dueDate: dueDate,
        image: image);
    addTask(task);
    Navigator.pop(context);
  }
}

updateValidateForm(
    {required GlobalKey<FormState> taskFormKey,
    required String taskTitle,
    required String dueDate,
    required String taskDescription,
    required String image,
    required BuildContext context,
    required String taskID}) {
  developer.log(image);

  if (taskFormKey.currentState!.validate()) {
    eventImageValidation(image, context);
    developer.log(image);

    final task = Task(
        taskID: taskID,
        taskTitle: taskTitle,
        taskDescription: taskDescription,
        dueDate: dueDate,
        image: image);
    updateTask(task);
    Navigator.pop(context, task);
  }
}
