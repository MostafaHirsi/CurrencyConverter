import 'package:currency_converter/providers/backend/backend_provider.dart';
import '../providers/shared_preferences/shared_preferences_provider.dart';
import 'package:injector/injector.dart';

Future<void> initialiseInjectors() async {
  SharedPreferencesProvider sharedPreferencesProvider =
      SharedPreferencesProvider();
  await sharedPreferencesProvider.initialise();
  Injector.appInstance.registerSingleton<SharedPreferencesProvider>(
      () => sharedPreferencesProvider);

  Injector.appInstance
      .registerSingleton<BackendProvider>(() => BackendProvider());
}
