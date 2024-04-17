import 'package:currency_converter/models/env/env.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import '../providers/shared_preferences/shared_preferences_provider.dart';

Future<void> initialiseInjectors() async {
  SharedPreferencesProvider sharedPreferencesProvider =
      SharedPreferencesProvider();
  await sharedPreferencesProvider.initialise();
  Injector.appInstance.registerSingleton<SharedPreferencesProvider>(
      () => sharedPreferencesProvider);

  Injector.appInstance
      .registerSingleton<GlobalKey<NavigatorState>>(() => GlobalKey());

  Dio dio = Dio();
  dio.options = BaseOptions(queryParameters: {
    "apikey": Env.currencyApiKey,
  });
  CurrencyApiProvider currencyApiProvider = CurrencyApiProvider(dio);
  Injector.appInstance
      .registerSingleton<CurrencyApiProvider>(() => currencyApiProvider);
}
