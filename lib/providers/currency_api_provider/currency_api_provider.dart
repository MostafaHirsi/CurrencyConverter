import 'package:currency_converter/models/currency_list/currency_list.dart';
import 'package:currency_converter/models/exchange_rate/exchange_rate.dart';
import 'package:currency_converter/models/status/status.dart';
import 'package:dio/dio.dart';
import 'package:sprintf/sprintf.dart';

class CurrencyApiProvider {
  final Dio _dio;
  final String endpoint = "https://api.freecurrencyapi.com/v1/%s";

  CurrencyApiProvider(this._dio);

  Future<Status> getStatus() async {
    Response response = await _dio.get(
      sprintf(endpoint, ['status']),
    );

    Status status = Status.fromJson(response.data);
    return status;
  }

  Future<CurrencyList> getCurrencies() async {
    Response response = await _dio.get(
      sprintf(endpoint, ['currencies']),
    );

    CurrencyList currencyList = CurrencyList.fromJson(response.data);
    return currencyList;
  }

  Future<ExchangeRate> getExchangeRate({String baseCurrency = 'USD'}) async {
    String params = baseCurrency.isNotEmpty ? '&base_currency=GBP' : '';
    Map<String, dynamic> queryParams = {
      "apikey": _dio.options.queryParameters['apikey'],
      "base_currency": baseCurrency
    };
    Response response = await _dio.get(sprintf(endpoint, ['latest', params]),
        queryParameters: queryParams);

    ExchangeRate exchangeRate = ExchangeRate.fromJson(response.data);
    return exchangeRate;
  }
}
