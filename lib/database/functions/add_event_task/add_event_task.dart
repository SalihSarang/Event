import 'dart:developer' as developer;

import 'package:event_vault/database/modals/event_task_model/event_task_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

const String EVENT_TASK_BOX = 'EventTaskBox';
final eventTaskBox = Hive.box<EventTaskModel>(EVENT_TASK_BOX);
ValueNotifier<List<EventTaskModel>> eventTaskListener = ValueNotifier([]);

addEventTask(EventTaskModel value) async {
  await eventTaskBox.put(value.eventTaskID, value);
  getAllTask();
}

getAllTask() {
  eventTaskListener.value.clear();
  eventTaskListener.value = eventTaskBox.values.toList();
}

List<EventTaskModel> getEventTaskByEventId(String eventID) {
  developer.log(eventID);
  final eventTask = eventTaskBox.values
          .where(
            (task) => task.eventID == eventID,
          )
          .toList() ??
      [];

  return eventTask;
}

updateEventTask(EventTaskModel value) async {
  await eventTaskBox.put(value.eventTaskID, value);
  getAllTask();
}

deleteEventTask(String eventTaskID) async {
  await eventTaskBox.delete(eventTaskID);
  getAllTask();
}
