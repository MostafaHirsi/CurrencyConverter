import 'dart:io';

import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/models/currency_list/currency_list.dart';
import 'package:currency_converter/models/exchange_rate/exchange_rate.dart';
import 'package:currency_converter/models/individual_quota/individual_quota.dart';
import 'package:currency_converter/models/status/status.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../utils/read_json_file.dart';

void main() {
  group(
    'Currency Api Provider Test',
    () {
      Dio dio = Dio();
      dio.options = BaseOptions(queryParameters: {
        "apikey": 'testKey',
      });
      final dioAdapter = DioAdapter(dio: dio);
      final CurrencyApiProvider currencyApiProvider = CurrencyApiProvider(dio);
      test(
        'getStatus',
        () async {
          final mockStatusResponse = readJsonFile(
              'test/unit_tests/currency_api_provider/mocks/status.json');

          dioAdapter.onGet(
            "https://api.freecurrencyapi.com/v1/status",
            (server) => server.reply(
              200,
              mockStatusResponse,
              delay: const Duration(seconds: 1),
            ),
          );

          Status expectedStatus = const Status(
            accountId: 302030841293443072,
            quotas: Quotas(
              month: IndividualQuota(remaining: 4993, total: 5000, used: 7),
              grace: IndividualQuota(remaining: 0, total: 0, used: 0),
            ),
          );

          Status actualStatus = await currencyApiProvider.getStatus();
          expect(actualStatus, expectedStatus);
        },
      );

      test(
        'getCurrencies',
        () async {
          final mockCurrenciesResponse = readJsonFile(
              'test/unit_tests/currency_api_provider/mocks/currencies.json');

          dioAdapter.onGet(
            "https://api.freecurrencyapi.com/v1/currencies",
            (server) => server.reply(
              200,
              mockCurrenciesResponse,
              delay: const Duration(seconds: 1),
            ),
          );

          CurrencyList actualCurrencyList =
              await currencyApiProvider.getCurrencies();

          Currency expectedGBP = const Currency(
            symbol: "£",
            name: "British Pound Sterling",
            symbolNative: "£",
            decimalDigits: 2,
            rounding: 0,
            code: "GBP",
            namePlural: "British pounds sterling",
            type: "fiat",
          );
          expect(actualCurrencyList.data["GBP"], expectedGBP);
        },
      );

      test(
        'getExchangeRate with USD as default currency',
        () async {
          final mockStatusResponse = readJsonFile(
              'test/unit_tests/currency_api_provider/mocks/latest.json');

          dioAdapter.onGet(
            "https://api.freecurrencyapi.com/v1/latest",
            (server) => server.reply(
              200,
              mockStatusResponse,
              delay: const Duration(seconds: 1),
            ),
          );

          ExchangeRate expectedExchangeRate = ExchangeRate.fromJson({
            "data": {
              "AUD": 1.5468402866,
              "BGN": 1.8302301931,
              "BRL": 5.1284107716,
              "CAD": 1.3773502007,
              "CHF": 0.9141300954,
              "CNY": 7.2353710327,
              "CZK": 23.7950936103,
              "DKK": 7.0104509291,
              "EUR": 0.9390801096,
              "GBP": 0.8031401183,
              "HKD": 7.8360808813,
              "HRK": 6.7989911646,
              "HUF": 368.9104322231,
              "IDR": 15826.235296923,
              "ILS": 3.7721304952,
              "INR": 83.5010731448,
              "ISK": 141.4541948444,
              "JPY": 153.2989406162,
              "KRW": 1378.0310365111,
              "MXN": 16.6307423253,
              "MYR": 4.7696107178,
              "NOK": 10.8986419214,
              "NZD": 1.6839901987,
              "PHP": 56.6048102706,
              "PLN": 4.0257906998,
              "RON": 4.6727806078,
              "RUB": 93.2937851015,
              "SEK": 10.8859521193,
              "SGD": 1.3600102337,
              "THB": 36.5952450695,
              "TRY": 32.3506444481,
              "USD": 1,
              "ZAR": 18.833363217
            }
          });

          ExchangeRate actualExchangeRate =
              await currencyApiProvider.getExchangeRate();
          expect(actualExchangeRate, expectedExchangeRate);
        },
      );

      test(
        'getExchangeRate with GBP as default currency',
        () async {
          final mockStatusResponse = readJsonFile(
              'test/unit_tests/currency_api_provider/mocks/latest_with_gbp_default.json');

          dioAdapter.onGet(
            "https://api.freecurrencyapi.com/v1/latest",
            (server) => server.reply(
              200,
              mockStatusResponse,
              delay: const Duration(seconds: 1),
            ),
          );

          ExchangeRate expectedExchangeRate = ExchangeRate.fromJson({
            "data": {
              "AUD": 1.9259905605,
              "BGN": 2.2788429458,
              "BRL": 6.3854496305,
              "CAD": 1.7149562938,
              "CHF": 1.1381950354,
              "CNY": 9.0088527118,
              "CZK": 29.6275744022,
              "DKK": 8.7288018234,
              "EUR": 1.1692606162,
              "GBP": 1,
              "HKD": 9.7568042023,
              "HRK": 8.4655105749,
              "HUF": 459.3350821572,
              "IDR": 19705.4473264544,
              "ILS": 4.696727768,
              "INR": 103.9682506728,
              "ISK": 176.1264213072,
              "JPY": 190.8744652685,
              "KRW": 1715.8040111705,
              "MXN": 20.7071492836,
              "MYR": 5.9387031094,
              "NOK": 13.5700379959,
              "NZD": 2.0967576645,
              "PHP": 70.4793708854,
              "PLN": 5.0125633225,
              "RON": 5.818138705,
              "RUB": 116.1612811709,
              "SEK": 13.5542377616,
              "SGD": 1.6933660799,
              "THB": 45.5652061647,
              "TRY": 40.2801998194,
              "USD": 1.2451127483,
              "ZAR": 23.4496606356
            }
          });

          ExchangeRate actualExchangeRate =
              await currencyApiProvider.getExchangeRate(baseCurrency: "GBP");
          expect(actualExchangeRate, expectedExchangeRate);
        },
      );
    },
  );
}
