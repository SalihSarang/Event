import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const ADD_EVENT = 'addevent';
ValueNotifier<List<EventAddingModal>> eventListen = ValueNotifier([]);

void addEvent(EventAddingModal value) {
  var eventBox = Hive.box<EventAddingModal>(ADD_EVENT);
  eventBox.put(value.eventId, value);
  getAllEvents();
}

void getAllEvents() {
  eventListen.value.clear();
  var eventBox = Hive.box<EventAddingModal>(ADD_EVENT);
  eventListen.value.addAll(eventBox.values);
  eventListen.notifyListeners();
}
