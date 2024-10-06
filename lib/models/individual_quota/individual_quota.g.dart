// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_quota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndividualQuotaImpl _$$IndividualQuotaImplFromJson(
        Map<String, dynamic> json) =>
    _$IndividualQuotaImpl(
      total: (json['total'] as num).toInt(),
      used: (json['used'] as num).toInt(),
      remaining: (json['remaining'] as num).toInt(),
    );

Map<String, dynamic> _$$IndividualQuotaImplToJson(
        _$IndividualQuotaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'used': instance.used,
      'remaining': instance.remaining,
    };
