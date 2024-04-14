// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyListImpl _$$CurrencyListImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyListImpl(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Currency.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$CurrencyListImplToJson(_$CurrencyListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
