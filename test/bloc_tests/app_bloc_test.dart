import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/generate_mock_providers.mocks.dart';

void main() {
  group('App Bloc', () {
    final CurrencyApiProvider currencyApiProvider = MockCurrencyApiProvider();
    final SharedPreferencesProvider sharedPreferencesProvider =
        MockSharedPreferencesProvider();
    blocTest(
      'emits [] when nothing is added',
      build: () => AppBloc(currencyApiProvider, sharedPreferencesProvider),
      expect: () => [],
    );
  });
}
