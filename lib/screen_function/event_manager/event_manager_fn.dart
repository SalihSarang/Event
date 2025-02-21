import 'dart:developer' as developer;
import 'package:event_vault/database/functions/event/event.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:intl/intl.dart';

List<EventAddModal> filterSearchEvent({
  required List<EventAddModal> result,
  required String search,
}) {
  return result
      .where((event) =>
          event.categoryName.toLowerCase().contains(search.toLowerCase()))
      .toList();
}

List<EventAddModal> searchEvent(
    {required String search, required List<EventAddModal> eventList}) {
  List<EventAddModal> searchedEvents = [];
  if (search.isNotEmpty) {
    searchedEvents = eventList.where((event) {
      final eventName = event.eventName.toLowerCase().contains(search);
      final eventDate = event.date.toLowerCase().contains(search);
      final eventCategory = event.catogory.toLowerCase().contains(search);
      final eventLocation = event.location.toLowerCase().contains(search);
      return eventName || eventDate || eventCategory || eventLocation;
    }).toList();
  } else {
    searchedEvents = eventListen.value;
  }
  return searchedEvents;
}

String extract(String fulldate) {
  try {
    String date = fulldate.split(' ')[0];
    developer.log("Extracted date: $date");
    return date;
  } catch (e) {
    developer.log('Error extracting date: $e');
    return '';
  }
}

DateTime combineDateAndTime(String date, String time) {
  try {
    developer.log("Received date: $date and time: $time");

    // Extract only the valid date part (YYYY-MM-DD)
    String cleanedDate = date.split(" ")[0].trim(); // Remove extra spaces

    // Ensure time is in correct format (hh:mm a)
    String cleanedTime = time.trim(); // Remove any unwanted characters

    developer.log("Cleaned Date: $cleanedDate");
    developer.log("Cleaned Time: $cleanedTime");

    // Parse date and time
    DateTime parsedDate = DateFormat("yyyy-MM-dd").parse(cleanedDate);
    DateTime parsedTime = DateFormat("hh:mm a").parse(cleanedTime);

    DateTime finalDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime.hour,
      parsedTime.minute,
    );

    developer.log("Successfully parsed DateTime: $finalDateTime");

    return finalDateTime;
  } catch (e) {
    developer.log("Error parsing date and time: $e");
    return DateTime.now(); // Prevent crash
  }
}
