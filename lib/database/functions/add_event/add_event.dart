import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
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

EventAddModal? getEventById(String eventId) {
  Box<EventAddModal> eventBox = Hive.box<EventAddModal>(ADD_EVENT);

  return eventBox.values.firstWhere(
    (event) => event.eventId == eventId,
  );
}

upDateEvent(EventAddModal value) {
  var eventBox = Hive.box<EventAddModal>(ADD_EVENT);
  eventBox.put(value.eventId, value);
  getAllEvents();
}

Future<List<ItemModel>> getSelectedItems(String eventId) async {
  final eventBox = Hive.box<EventAddModal>('events');
  final event = eventBox.values.firstWhere(
    (e) => e.eventId == eventId,
  );

  return event.items ?? [];
}

void deleteCategory(String value) async {
  var categoryBox = Hive.box<EventAddModal>(ADD_EVENT);
  await categoryBox.delete(value);
  getAllEvents();
}
