import 'package:currency_converter/models/currency/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'currency_list.freezed.dart';
part 'currency_list.g.dart';

@freezed
class CurrencyList with _$CurrencyList {
  const factory CurrencyList({
    required Currency EUR,
    required Currency USD,
    required Currency JPY,
    required Currency BGN,
    required Currency CZK,
    required Currency DKK,
    required Currency GBP,
    required Currency HUF,
    required Currency PLN,
    required Currency RON,
    required Currency SEK,
    required Currency CHF,
    required Currency ISK,
    required Currency NOK,
    required Currency HRK,
    required Currency RUB,
    required Currency TRY,
    required Currency AUD,
    required Currency BRL,
    required Currency CAD,
    required Currency CNY,
    required Currency HKD,
    required Currency IDR,
    required Currency ILS,
    required Currency INR,
    required Currency KRW,
    required Currency MXN,
    required Currency MYR,
    required Currency NZD,
    required Currency PHP,
    required Currency SGD,
    required Currency THB,
    required Currency ZAR,
  }) = _CurrencyList;

  factory CurrencyList.fromJson(Map<String, Object?> json) =>
      _$CurrencyListFromJson(json);
}
