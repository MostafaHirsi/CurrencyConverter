import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/models/currency_list/currency_list.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/utils/shared_preferences_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/generate_mock_providers.mocks.dart';

void main() {
  group('App Bloc', () {
    final CurrencyApiProvider currencyApiProvider = MockCurrencyApiProvider();
    final SharedPreferencesProvider sharedPreferencesProvider =
        MockSharedPreferencesProvider();
    CurrencyList currencyList = CurrencyList.fromJson({
      "data": {
        "EUR": {
          "symbol": "€",
          "name": "Euro",
          "symbol_native": "€",
          "decimal_digits": 2,
          "rounding": 0,
          "code": "EUR",
          "name_plural": "Euros",
          "type": "fiat"
        }
      }
    });
    Currency euCurrency = Currency.fromJson({
      "symbol": "€",
      "name": "Euro",
      "symbol_native": "€",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "EUR",
      "name_plural": "Euros",
      "type": "fiat"
    });
    blocTest(
      'emits [] when nothing is added',
      build: () => AppBloc(currencyApiProvider, sharedPreferencesProvider),
      expect: () => [],
    );
    group('Load App event', () {
      blocTest(
        'when currencies list and theme mode is retrieved successfully, app bloc emits [AppLoading, AppLoaded]',
        setUp: () {
          when(currencyApiProvider.getCurrencies())
              .thenAnswer((_) => Future.value(currencyList));

          when(sharedPreferencesProvider
                  .containsKey(SharedPreferencesEnum.themeMode))
              .thenReturn(false);
        },
        build: () => AppBloc(currencyApiProvider, sharedPreferencesProvider),
        expect: () => [
          AppLoading(),
          AppLoaded([euCurrency], ThemeMode.system)
        ],
      );
      blocTest(
        'when currencies list and theme mode is not retrieved successfully, app bloc emits [AppLoading, AppError]',
        setUp: () {
          when(currencyApiProvider.getCurrencies()).thenThrow(
            DioException(
              requestOptions: RequestOptions(),
              response:
                  Response(requestOptions: RequestOptions(), statusCode: 404),
            ),
          );
          when(sharedPreferencesProvider
                  .containsKey(SharedPreferencesEnum.themeMode))
              .thenReturn(false);
        },
        build: () => AppBloc(currencyApiProvider, sharedPreferencesProvider),
        expect: () => [
          AppLoading(),
          AppError(message: 'Something went wrong, please try again later.')
        ],
      );
    });

    group('Update Thememode event', () {
      blocTest(
        'when currencies list and theme mode is retrieved successfully, app bloc emits [AppLoading, AppLoaded]',
        setUp: () {
          when(currencyApiProvider.getCurrencies())
              .thenAnswer((_) => Future.value(currencyList));

          List<String> currencyListJson = [jsonEncode(euCurrency.toJson())];

          when(sharedPreferencesProvider.get(SharedPreferencesEnum.currencies))
              .thenAnswer((_) => Future.value(currencyListJson));
          when(sharedPreferencesProvider
                  .containsKey(SharedPreferencesEnum.themeMode))
              .thenReturn(false);

          when(sharedPreferencesProvider.get(SharedPreferencesEnum.themeMode))
              .thenReturn(false);

          when(sharedPreferencesProvider.set(
                  SharedPreferencesEnum.themeMode, ThemeMode.dark.index))
              .thenAnswer((_) => Future.value(null));
        },
        build: () => AppBloc(currencyApiProvider, sharedPreferencesProvider),
        act: (bloc) => bloc.add(UpdateThemeMode(themeMode: ThemeMode.dark)),
        expect: () => [
          AppLoading(),
          AppLoaded([euCurrency], ThemeMode.system),
          AppLoaded([euCurrency], ThemeMode.dark),
        ],
      );
    });
  });
}
