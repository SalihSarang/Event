categoryItemNameValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a category item name';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z0-9\s\-_]+$');
  if (!regExp.hasMatch(value)) {
    return 'Category item name can only contain letters, numbers, spaces, hyphens, and underscores';
  }

  if (value.length < 3) {
    return 'Category item name must be at least 3 characters long';
  }

  if (value.length > 30) {
    return 'Category item name must be no longer than 30 characters';
  }

  return null;
}
