import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const ADD_EVENT = 'addevent';
ValueNotifier<List<EventAddModal>> eventListen = ValueNotifier([]);

void addEvent(EventAddModal value) async {
  var eventBox = Hive.box<EventAddModal>(ADD_EVENT);
  await eventBox.put(value.eventId, value);
  getAllEvents();
}

void getAllEvents() {
  eventListen.value.clear();
  var getEventBox = Hive.box<EventAddModal>(ADD_EVENT);
  eventListen.value.addAll(getEventBox.values);
  eventListen.notifyListeners();
}
