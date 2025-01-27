textValidation({required String value}) {
  if (value == null || value.trim().isEmpty) {
    return 'Item Name cannot be empty.';
  }
  if (value.trim().length < 3) {
    return 'Item Name must be at least 3 characters long.';
  }
  if (value.trim().length > 50) {
    return 'Item Name cannot exceed 50 characters.';
  }
  return null;
}
