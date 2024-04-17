double stringToDouble(String text) {
  String stringValue = text.replaceAll(RegExp(r'[^0-9]'), '');
  double value = double.tryParse(stringValue) ?? 0;
  return value / 100;
}
