import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter/blocs/home/home_bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/generate_mock_providers.mocks.dart';

void main() {
  group('Home Bloc', () {
    final CurrencyApiProvider currencyApiProvider = MockCurrencyApiProvider();
    final SharedPreferencesProvider sharedPreferencesProvider =
        MockSharedPreferencesProvider();

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
    HomeBloc homeBloc =
        HomeBloc([euCurrency], currencyApiProvider, sharedPreferencesProvider);

    blocTest(
      'emits [] when nothing is added ',
      build: () => HomeBloc(
          [euCurrency], currencyApiProvider, sharedPreferencesProvider),
      expect: () => [],
    );
  });
}
