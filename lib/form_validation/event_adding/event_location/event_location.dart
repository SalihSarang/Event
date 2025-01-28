eventLocationValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an event location';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z0-9\s,.\-]+$');
  if (!regExp.hasMatch(value)) {
    return 'Location can only contain letters, numbers, spaces, commas, periods, and hyphens';
  }

  if (value.length < 3) {
    return 'Event location must be at least 3 characters long';
  }

  if (value.length > 100) {
    return 'Event location must be no longer than 100 characters';
  }

  return null;
}
