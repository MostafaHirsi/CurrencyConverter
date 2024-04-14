decodedSnakeCased(String locality) {
  String decodedLocality = Uri.decodeComponent(locality);
  return decodedLocality.replaceAll(' ', '_').toLowerCase();
}
