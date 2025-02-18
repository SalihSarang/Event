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

void getAllCompletedEvents() {
  completedEvents.value.clear();
  completedEvents.value = completedEventsBox.values.toList();
  completedEvents.notifyListeners();
}

restoreEvent(String id) async {
  await completedEventsBox.delete(id);
  getAllCompletedEvents();
}

void getTodayCompletedEvents() {
  DateTime today = DateTime.now();

  List<Completed> todayEvents = completedEventsBox.values.where((event) {
    DateTime eventDate = DateTime.parse(event.event.date);
    return eventDate.year == today.year &&
        eventDate.month == today.month &&
        eventDate.day == today.day;
  }).toList();

  completedEvents.value = todayEvents;
  completedEvents.notifyListeners();
}

void getUniqueSortedDates() {
  Set<String> uniqueDates =
      completedEventsBox.values.map((event) => event.event.date).toSet();

  List<String> sortedDates = uniqueDates.toList()
    ..sort((a, b) => DateTime.parse(a).compareTo(DateTime.parse(b)));
  print(sortedDates);
}





// void sortAllCompletedEvents() {
//   List<Completed> allEvents = completedEventsBox.values.toList();

//   allEvents.sort((a, b) {
//     DateTime dateA = DateTime.parse(a.event.date);
//     DateTime dateB = DateTime.parse(b.event.date);
//     return dateA.compareTo(dateB);
//   });

//   completedEvents.value = allEvents;
//   completedEvents.notifyListeners();
// }

// void getCompletedEventsByDateRange(String startDate, String endDate) {
//   DateTime start = DateTime.parse(startDate);
//   DateTime end = DateTime.parse(endDate);

//   List<Completed> filteredEvents = completedEventsBox.values.where((event) {
//     DateTime eventDate = DateTime.parse(event.event.date);
//     return eventDate.isAfter(start) && eventDate.isBefore(end);
//   }).toList();

//   filteredEvents.sort((a, b) =>
//       DateTime.parse(a.event.date).compareTo(DateTime.parse(b.event.date)));

//   completedEvents.value = filteredEvents;
//   completedEvents.notifyListeners();
// }

