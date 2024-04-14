import 'package:currency_converter/models/currency/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'currency_list.freezed.dart';
part 'currency_list.g.dart';

@freezed
class CurrencyList with _$CurrencyList {
  const factory CurrencyList({
    required Map<String, Currency> data,
  }) = _CurrencyList;

  factory CurrencyList.fromJson(Map<String, Object?> json) =>
      _$CurrencyListFromJson(json);
}
