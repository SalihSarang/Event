import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:developer' as developer;
import 'package:intl/intl.dart';

const ADD_EVENT = 'addevent';
ValueNotifier<List<EventAddModal>> eventListen = ValueNotifier([]);
var eventBox = Hive.box<EventAddModal>(ADD_EVENT);

void addEvent(EventAddModal value) async {
  await eventBox.put(value.eventId, value);
  getAllEvents();
}

void getAllEvents() {
  eventListen.value.clear();
  eventListen.value.addAll(eventBox.values);
  eventListen.notifyListeners();
}

EventAddModal? getEventById(String eventId) {
  Box<EventAddModal> eventBox = Hive.box<EventAddModal>(ADD_EVENT);
  return eventBox.values.firstWhere(
    (event) => event.eventId == eventId,
  );
}

upDateEvent(EventAddModal value) {
  eventBox.put(value.eventId, value);
  getAllEvents();
}

Future<List<ItemModel>> getSelectedItems(String eventId) async {
  final event = eventBox.values.firstWhere(
    (e) => e.eventId == eventId,
  );
  return event.items ?? [];
}

void deleteEvent(String value) async {
  await eventBox.delete(value);
  getAllEvents();
}

List<EventAddModal> getUpcomingEvents() {
  List<EventAddModal> events = eventBox.values.toList();

  DateTime now = DateFormat("dd/MMM/yyyy hh:mm a")
      .parse(DateFormat("dd/MMM/yyyy hh:mm a").format(DateTime.now()));

  List<EventAddModal> upcomingEvents = events.where((event) {
    DateTime eventDateTime = parseDateTime(event.date, event.time);
    return eventDateTime.isAfter(now);
  }).toList();

  upcomingEvents.sort((a, b) {
    DateTime dateTimeA = parseDateTime(a.date, a.time);
    DateTime dateTimeB = parseDateTime(b.date, b.time);
    return dateTimeA.compareTo(dateTimeB);
  });

  return upcomingEvents;
}

DateTime parseDateTime(String date, String time) {
  try {
    String fullDateTime = '$date $time';
    developer.log("Parsing date: $fullDateTime");
    DateFormat inputFormat = DateFormat("dd/MMM/yyyy hh:mm a");
    return inputFormat.parse(fullDateTime);
  } catch (e) {
    developer.log("Error parsing date: $e");
    return DateTime(2100); // Return a future date to prevent errors
  }
}
