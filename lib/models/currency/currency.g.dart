// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      symbolNative: json['symbolNative'] as String,
      decimalDigits: json['decimalDigits'] as int,
      rounding: json['rounding'] as int,
      code: json['code'] as String,
      namePlural: json['namePlural'] as String,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'symbolNative': instance.symbolNative,
      'decimalDigits': instance.decimalDigits,
      'rounding': instance.rounding,
      'code': instance.code,
      'namePlural': instance.namePlural,
    };
