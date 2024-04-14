// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      accountId: json['account_id'] as int,
      quotas: Quotas.fromJson(json['quotas'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'quotas': instance.quotas,
    };

_$QuotasImpl _$$QuotasImplFromJson(Map<String, dynamic> json) => _$QuotasImpl(
      month: IndividualQuota.fromJson(json['month'] as Map<String, dynamic>),
      grace: IndividualQuota.fromJson(json['grace'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuotasImplToJson(_$QuotasImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'grace': instance.grace,
    };
