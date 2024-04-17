import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/utils/shared_preferences_constants.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/utils/initialise_injectors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialiseInjectors();

  CurrencyApiProvider backendProvider = Injector.appInstance.get();
  SharedPreferencesProvider sharedPreferencesProvider =
      Injector.appInstance.get();

  ThemeMode themeMode = ThemeMode.values[
      sharedPreferencesProvider.get(SharedPreferencesEnum.themeMode) ??
          ThemeMode.system.index];
  AppBloc appBloc = AppBloc(backendProvider, sharedPreferencesProvider);
  runApp(
    BlocProvider(
      create: (context) => appBloc,
      child: App(
        initialThemeMode: themeMode,
      ),
    ),
  );
}
