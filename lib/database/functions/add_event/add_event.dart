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
  List<EventAddModal> events = eventBox.values.map(
    (eventData) {
      developer.log(eventData.date);
      return EventAddModal(
          catogory: eventData.categoryName,
          eventName: eventData.eventName,
          date: eventData.date,
          time: eventData.time,
          location: eventData.location,
          description: eventData.description,
          clientName: eventData.clientName,
          contactInfo: eventData.contactInfo,
          eventId: eventData.eventId,
          items: eventData.items,
          special: eventData.special,
          image: eventData.image,
          budget: eventData.budget,
          categoryName: eventData.categoryName);
    },
  ).toList();

  DateTime now = DateTime.now();

  List<EventAddModal> upcomingEvents = events.where(
    (event) {
      DateTime eventDateTime = parseDateTime(event.date, event.time);
      return eventDateTime.isAfter(now);
    },
  ).toList();

  upcomingEvents.sort(
    (a, b) {
      DateTime dateTimeA = parseDateTime(a.date, a.time);
      DateTime dateTimeB = parseDateTime(b.date, b.time);
      return dateTimeA.compareTo(dateTimeB);
    },
  );

  return upcomingEvents;
}

DateTime parseDateTime(String date, String time) {
  String datePart = date.split(' ')[0];
  String fullDateTime = '$datePart $time';
  DateFormat inputFormat = DateFormat("yyyy-MM-dd hh:mm a");
  return inputFormat.parse(fullDateTime);
}
