// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteImpl _$$QuoteImplFromJson(Map<String, dynamic> json) => _$QuoteImpl(
      baseCurrencyCode: json['base_currency_code'] as String,
      targetCurrencyCode: json['target_currency_code'] as String,
      baseCurrencyName: json['base_currency_name'] as String,
      targetCurrencyName: json['target_currency_name'] as String,
      baseValue: (json['base_value'] as num).toDouble(),
      targetValue: (json['target_value'] as num).toDouble(),
      selectedDate: json['selected_date'] == null
          ? null
          : DateTime.parse(json['selected_date'] as String),
    );

Map<String, dynamic> _$$QuoteImplToJson(_$QuoteImpl instance) =>
    <String, dynamic>{
      'base_currency_code': instance.baseCurrencyCode,
      'target_currency_code': instance.targetCurrencyCode,
      'base_currency_name': instance.baseCurrencyName,
      'target_currency_name': instance.targetCurrencyName,
      'base_value': instance.baseValue,
      'target_value': instance.targetValue,
      'selected_date': instance.selectedDate?.toIso8601String(),
    };
