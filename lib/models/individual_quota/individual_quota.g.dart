// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_quota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndividualQuotaImpl _$$IndividualQuotaImplFromJson(
        Map<String, dynamic> json) =>
    _$IndividualQuotaImpl(
      total: json['total'] as int,
      used: json['used'] as int,
      remaining: json['remaining'] as int,
    );

Map<String, dynamic> _$$IndividualQuotaImplToJson(
        _$IndividualQuotaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'used': instance.used,
      'remaining': instance.remaining,
    };
