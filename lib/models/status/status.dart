import 'package:currency_converter/models/individual_quota/individual_quota.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class Status with _$Status {
  const factory Status({
    required int accountId,
    required Quotas quotas,
  }) = _Status;

  factory Status.fromJson(Map<String, Object?> json) => _$StatusFromJson(json);
}

@freezed
class Quotas with _$Quotas {
  const factory Quotas({
    required IndividualQuota month,
    required IndividualQuota grace,
  }) = _Quotas;

  factory Quotas.fromJson(Map<String, Object?> json) => _$QuotasFromJson(json);
}
