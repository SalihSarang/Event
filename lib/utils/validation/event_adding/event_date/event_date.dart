eventDateValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an event date';
  }

  return null;
}
