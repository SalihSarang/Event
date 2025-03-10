import 'package:intl/intl.dart';

String? eventTimeValidation(String? timeString, String eventDateString) {
  if (timeString == null || timeString.trim().isEmpty) {
    return 'Please enter an event time';
  }

  if (eventDateString.isEmpty) {
    return 'Please select an event date';
  }
  RegExp regExp =
      RegExp(r'^(0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]( ?[AaPp][Mm])?$');

  if (!regExp.hasMatch(timeString)) {
    return 'Please enter a valid time in HH:MM (24-hour) or HH:MM AM/PM (12-hour)';
  }

  DateTime eventDate = DateFormat('dd/MMM/yyyy').parse(eventDateString);

  List<String> timeParts = timeString.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1].replaceAll(RegExp(r'[^0-9]'), ''));

  if (timeString.toLowerCase().contains('pm') && hour != 12) {
    hour += 12;
  } else if (timeString.toLowerCase().contains('am') && hour == 12) {
    hour = 0;
  }

  DateTime now = DateTime.now();

  DateTime eventTime =
      DateTime(eventDate.year, eventDate.month, eventDate.day, hour, minute);

  if (eventTime.isBefore(now)) {
    return 'Event time cannot be in the past';
  }

  return null;
}
