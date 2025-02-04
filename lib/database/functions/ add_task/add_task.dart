import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:developer' as developer;

const TASK_BOX = 'taskBox';

ValueNotifier<List<Task>> taskListenable = ValueNotifier([]);

void addTask(Task value) async {
  final taskBox = Hive.box<Task>(TASK_BOX);
  developer.log(value.taskTitle);
  await taskBox.put(value.taskID, value);
  getAllTask();
}

getAllTask() {
  taskListenable.value.clear();
  final taskBox = Hive.box<Task>(TASK_BOX);
  taskListenable.value.addAll(taskBox.values);
  taskListenable.notifyListeners();
}

deleteTask(String taskID) async {
  final taskBox = Hive.box<Task>(TASK_BOX);
  await taskBox.delete(taskID);
  getAllTask();
}

updateTask(Task value) async {
  final taskBox = Hive.box<Task>(TASK_BOX);
  developer.log(value.taskTitle);
  await taskBox.put(value.taskID, value);
  getAllTask();
}
