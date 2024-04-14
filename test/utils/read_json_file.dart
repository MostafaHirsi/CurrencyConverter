import 'dart:convert';
import 'dart:io';

Map readJsonFile(String filePath) {
  final File file = File(filePath);
  Map json = jsonDecode(file.readAsStringSync());
  return json;
}
