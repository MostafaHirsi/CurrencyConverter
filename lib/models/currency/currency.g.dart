// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      symbolNative: json['symbol_native'] as String,
      decimalDigits: (json['decimal_digits'] as num).toInt(),
      rounding: (json['rounding'] as num).toInt(),
      code: json['code'] as String,
      namePlural: json['name_plural'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'symbol_native': instance.symbolNative,
      'decimal_digits': instance.decimalDigits,
      'rounding': instance.rounding,
      'code': instance.code,
      'name_plural': instance.namePlural,
      'type': instance.type,
    };
