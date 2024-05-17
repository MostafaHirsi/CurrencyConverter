import 'package:currency_converter/blocs/home/home_bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/screens/home/home.dart';
import 'package:currency_converter/screens/settings/settings.dart';
import 'package:currency_converter/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injector/injector.dart';

List<GoRoute> buildRoutes(ThemeMode themeMode) {
  return [
    GoRoute(
      path: '/',
      builder: (context, state) => Splash(
        themeMode: themeMode,
      ),
    ),
    GoRoute(
      path: Settings.routeName,
      builder: (context, state) => const Settings(),
    ),
    GoRoute(
      path: Home.routeName,
      builder: (context, state) {
        List<Currency> currencies = state.extra as List<Currency>;
        CurrencyApiProvider currencyApiProvider = Injector.appInstance.get();
        SharedPreferencesProvider sharedPreferencesProvider =
            Injector.appInstance.get();
        HomeBloc homeBloc = HomeBloc(
            currencies, currencyApiProvider, sharedPreferencesProvider);
        return BlocProvider(
          create: (context) => homeBloc,
          child: const Home(),
        );
      },
    ),
  ];
}
