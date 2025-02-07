import 'package:event_vault/database/modals/completed_events_model/completed.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:developer' as developer;

const COMPLETED_EVENTS = 'completed events';
var completedEventsBox = Hive.box<Completed>(COMPLETED_EVENTS);
ValueNotifier<List<Completed>> completedEvents = ValueNotifier([]);

addCompletedEvents(Completed value) {
  developer.log(value.event.eventName);
  developer.log(value.event.eventName);
  completedEventsBox.put(value.completedID, value);
  getAllCompletedEvents();
}

getAllCompletedEvents() {
  completedEvents.value.clear();
  completedEvents.value = completedEventsBox.values.toList();
  completedEvents.notifyListeners();
}

restoreEvent(String id) async {
  await completedEventsBox.delete(id);
  getAllCompletedEvents();
}
