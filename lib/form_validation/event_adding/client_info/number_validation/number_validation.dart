isValidPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a phone number';
  }
  RegExp regExp = RegExp(r'^\d{10}$');
  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }
  return null;
}
