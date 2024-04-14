import 'package:currency_converter/src/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/src/utils/shared_preferences_constants.dart';

updateReadEvent(
    String eventId, SharedPreferencesProvider sharedPreferencesProvider) {
  List readList =
      sharedPreferencesProvider.get(SharedPreferencesEnum.readEvents) ?? [];
  if (!readList.contains(eventId)) {
    sharedPreferencesProvider
        .set(SharedPreferencesEnum.readEvents, [...readList, eventId]);
  }
}

removeReadEvent(
    String eventId, SharedPreferencesProvider sharedPreferencesProvider) {
  List readList =
      sharedPreferencesProvider.get(SharedPreferencesEnum.readEvents) ?? [];
  if (readList.contains(eventId)) {
    readList.removeWhere((readEvent) => readEvent == eventId);
    sharedPreferencesProvider.set(SharedPreferencesEnum.readEvents, readList);
  }
}
