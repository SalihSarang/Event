itemPriceValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a price';
  }

  RegExp regExp = RegExp(r'^\d+(\.\d{1,2})?$');
  if (!regExp.hasMatch(value)) {
    return 'Price must be a valid number with up to two decimal places';
  }

  double? price = double.tryParse(value);

  if (price != null && price <= 0) {
    return 'Price must be greater than 0';
  }

  if (price != null && price > 10000) {
    return 'Price must not exceed 10,000';
  }

  return null;
}
