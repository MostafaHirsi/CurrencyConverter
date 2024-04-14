import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  @JsonSerializable(explicitToJson: true)
  const factory Quote({
    required String baseCurrencyCode,
    required String targetCurrencyCode,
    required String baseCurrencyName,
    required String targetCurrencyName,
    required double baseValue,
    required double targetValue,
  }) = _Quote;

  factory Quote.fromJson(Map<String, Object?> json) => _$QuoteFromJson(json);
}
