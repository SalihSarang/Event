eventTimeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an event time';
  }

  RegExp regExp = RegExp(r'^(?:[01]?\d|2[0-3]):[0-5]?\d(:[0-5]?\d)?$');
  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid time in the format HH:MM or HH:MM:SS';
  }

  List<String> timeParts = value.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  int second = timeParts.length > 2 ? int.parse(timeParts[2]) : 0;

  DateTime currentDateTime = DateTime.now();
  DateTime eventDateTime = DateTime(currentDateTime.year, currentDateTime.month,
      currentDateTime.day, hour, minute, second);

  if (eventDateTime.isBefore(currentDateTime)) {
    return 'Event time cannot be in the past';
  }

  return null;
}
