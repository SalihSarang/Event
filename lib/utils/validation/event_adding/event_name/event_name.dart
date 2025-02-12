eventNameValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter name';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z0-9\s\-_]+$');
  if (!regExp.hasMatch(value)) {
    return 'Event name can only contain letters, numbers, spaces, hyphens, apostrophes, and ampersands';
  }

  if (value.length < 3) {
    return 'Event name must be at least 3 characters long';
  }

  if (value.length > 100) {
    return 'Event name must be no longer than 100 characters';
  }

  return null;
}
