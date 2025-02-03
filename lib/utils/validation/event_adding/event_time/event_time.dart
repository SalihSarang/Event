String? eventTimeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an event time';
  }

  // Regular expression for HH:MM format (24-hour or 12-hour format)
  RegExp regExp = RegExp(r'^(0?[1-9]|1[0-2]):[0-5][0-9] ?([AaPp][Mm])?$');

  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid time in the format HH:MM or HH:MM AM/PM';
  }

  // Extract hour and minute
  List<String> timeParts = value.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1].replaceAll(RegExp(r'[^0-9]'), '')); // Remove AM/PM if present

  // Convert to 24-hour format if AM/PM is provided
  if (value.toLowerCase().contains('pm') && hour != 12) {
    hour += 12;
  } else if (value.toLowerCase().contains('am') && hour == 12) {
    hour = 0;
  }

  DateTime now = DateTime.now();
  DateTime eventTime = DateTime(now.year, now.month, now.day, hour, minute);

  // Prevent selecting past times only if it's for today
  if (eventTime.isBefore(now)) {
    return 'Event time cannot be in the past';
  }

  return null; // Valid time
}
