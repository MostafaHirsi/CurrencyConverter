import 'package:currency_converter/utils/shared_preferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider<T> {
  late SharedPreferences _sharedPreferences;

  Future<void> initialise() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  set(SharedPreferencesEnum key, T value) async {
    if (value is List) {
      List<String> stringList =
          value.map((listItem) => listItem.toString()).toList();
      await _sharedPreferences.setStringList(key.name, stringList);
      return;
    }
    switch (value.runtimeType) {
      case bool:
        await _sharedPreferences.setBool(key.name, value as bool);
      case double:
        await _sharedPreferences.setDouble(key.name, value as double);
      case int:
        await _sharedPreferences.setInt(key.name, value as int);
      case String:
        await _sharedPreferences.setString(key.name, value as String);
    }
  }

  T get(SharedPreferencesEnum key) {
    return _sharedPreferences.get(key.name) as T;
  }

  clear() async {
    await _sharedPreferences.clear();
  }

  containsKey(SharedPreferencesEnum key) {
    return _sharedPreferences.containsKey(key.name);
  }
}
