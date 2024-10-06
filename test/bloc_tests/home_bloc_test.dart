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

    Currency usdCurrency = Currency.fromJson({
      "symbol": "\$",
      "name": "US Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "USD",
      "name_plural": "US dollars",
      "type": "fiat"
    });

    Currency gbpCurrency = Currency.fromJson({
      "symbol": "£",
      "name": "British Pound Sterling",
      "symbol_native": "£",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "GBP",
      "name_plural": "British pounds sterling",
      "type": "fiat"
    });
    blocTest(
      'emits [] when nothing is added ',
      build: () => HomeBloc([euCurrency, usdCurrency], currencyApiProvider,
          sharedPreferencesProvider),
      expect: () => [],
    );

    blocTest(
      'emits [HomeInitialised] when ChangeCurrency is added ',
      build: () => HomeBloc([euCurrency, usdCurrency, gbpCurrency],
          currencyApiProvider, sharedPreferencesProvider),
      act: (bloc) => bloc.add(
        ChangeCurrency(
          baseCurrency: gbpCurrency,
          targetCurrency: usdCurrency,
          selectedDate: DateTime.now(),
        ),
      ),
      expect: () => [
        HomeInitialised(
          baseCurrency: gbpCurrency,
          targetCurrency: usdCurrency,
          baseValue: 0,
          targetValue: 0,
        )
      ],
    );

    blocTest(
      'emits [HomeInitialised] when FlipCurrency is added ',
      build: () => HomeBloc([euCurrency, usdCurrency, gbpCurrency],
          currencyApiProvider, sharedPreferencesProvider),
      act: (bloc) => bloc.add(FlipCurrency(
        1.32,
        1.60,
        baseCurrency: gbpCurrency,
        targetCurrency: usdCurrency,
        selectedDate: DateTime.now(),
      )),
      expect: () => [
        HomeInitialised(
          baseCurrency: usdCurrency,
          targetCurrency: gbpCurrency,
          baseValue: 1.32,
          targetValue: 1.60,
        )
      ],
    );

    blocTest(
      'emits [HomeInitialised] when ChangeCurrency is added ',
      build: () => HomeBloc([euCurrency, usdCurrency, gbpCurrency],
          currencyApiProvider, sharedPreferencesProvider),
      act: (bloc) => bloc.add(ChangeCurrency(
        baseCurrency: gbpCurrency,
        targetCurrency: usdCurrency,
        selectedDate: DateTime.now(),
      )),
      expect: () => [
        HomeInitialised(
          baseCurrency: gbpCurrency,
          targetCurrency: usdCurrency,
          baseValue: 0,
          targetValue: 0,
        )
      ],
    );
  });
}
