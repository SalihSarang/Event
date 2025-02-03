clientName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the client name';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z\s]+$');
  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid name (letters and spaces only)';
  }

  if (value.length < 3) {
    return 'Client name must be at least 3 characters long';
  }

  return null;
}
