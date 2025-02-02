categoryDiscription(String value) {
  if (value.isEmpty) {
    return 'Please enter a category description';
  }

  if (value.length < 10) {
    return 'Category description must be at least 10 characters long';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z0-9\s,.-]+$');
  if (!regExp.hasMatch(value)) {
    return 'Category description can only contain letters, numbers, spaces, commas, periods, and hyphens';
  }

  return null;
}
