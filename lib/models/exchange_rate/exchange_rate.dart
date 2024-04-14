import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exchange_rate.freezed.dart';
part 'exchange_rate.g.dart';

@freezed
class ExchangeRate with _$ExchangeRate {
  const factory ExchangeRate({
    required Map<String, double> data,
  }) = _ExchangeRate;

  factory ExchangeRate.fromJson(Map<String, Object?> json) =>
      _$ExchangeRateFromJson(json);
}
