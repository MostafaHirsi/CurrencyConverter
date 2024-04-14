import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'individual_quota.freezed.dart';
part 'individual_quota.g.dart';

@freezed
class IndividualQuota with _$IndividualQuota {
  const factory IndividualQuota({
    required int total,
    required int used,
    required int remaining,
  }) = _IndividualQuota;

  factory IndividualQuota.fromJson(Map<String, Object?> json) =>
      _$IndividualQuotaFromJson(json);
}
