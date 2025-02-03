eventBudgetValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an event budget';
  }

  final double? budget = double.tryParse(value);
  if (budget == null || budget <= 0) {
    return 'Please enter a valid positive budget amount';
  }

  if (budget > 1000000) {
    return 'Event budget cannot exceed 1,000,000';
  }
  return null;
}
