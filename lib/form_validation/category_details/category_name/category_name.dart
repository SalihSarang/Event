categotyNameValidate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a category name';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z0-9\s]+$');
  if (!regExp.hasMatch(value)) {
    return 'Category name can only contain letters, numbers, and spaces';
  }

  if (value.length < 3) {
    return 'Category name must be at least 3 characters long';
  }

  return null;
}
