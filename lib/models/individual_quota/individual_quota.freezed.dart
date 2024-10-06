// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'individual_quota.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IndividualQuota _$IndividualQuotaFromJson(Map<String, dynamic> json) {
  return _IndividualQuota.fromJson(json);
}

/// @nodoc
mixin _$IndividualQuota {
  int get total => throw _privateConstructorUsedError;
  int get used => throw _privateConstructorUsedError;
  int get remaining => throw _privateConstructorUsedError;

  /// Serializes this IndividualQuota to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IndividualQuota
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IndividualQuotaCopyWith<IndividualQuota> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualQuotaCopyWith<$Res> {
  factory $IndividualQuotaCopyWith(
          IndividualQuota value, $Res Function(IndividualQuota) then) =
      _$IndividualQuotaCopyWithImpl<$Res, IndividualQuota>;
  @useResult
  $Res call({int total, int used, int remaining});
}

/// @nodoc
class _$IndividualQuotaCopyWithImpl<$Res, $Val extends IndividualQuota>
    implements $IndividualQuotaCopyWith<$Res> {
  _$IndividualQuotaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IndividualQuota
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? used = null,
    Object? remaining = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndividualQuotaImplCopyWith<$Res>
    implements $IndividualQuotaCopyWith<$Res> {
  factory _$$IndividualQuotaImplCopyWith(_$IndividualQuotaImpl value,
          $Res Function(_$IndividualQuotaImpl) then) =
      __$$IndividualQuotaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int used, int remaining});
}

/// @nodoc
class __$$IndividualQuotaImplCopyWithImpl<$Res>
    extends _$IndividualQuotaCopyWithImpl<$Res, _$IndividualQuotaImpl>
    implements _$$IndividualQuotaImplCopyWith<$Res> {
  __$$IndividualQuotaImplCopyWithImpl(
      _$IndividualQuotaImpl _value, $Res Function(_$IndividualQuotaImpl) _then)
      : super(_value, _then);

  /// Create a copy of IndividualQuota
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? used = null,
    Object? remaining = null,
  }) {
    return _then(_$IndividualQuotaImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndividualQuotaImpl
    with DiagnosticableTreeMixin
    implements _IndividualQuota {
  const _$IndividualQuotaImpl(
      {required this.total, required this.used, required this.remaining});

  factory _$IndividualQuotaImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndividualQuotaImplFromJson(json);

  @override
  final int total;
  @override
  final int used;
  @override
  final int remaining;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualQuota(total: $total, used: $used, remaining: $remaining)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndividualQuota'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('used', used))
      ..add(DiagnosticsProperty('remaining', remaining));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualQuotaImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, used, remaining);

  /// Create a copy of IndividualQuota
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IndividualQuotaImplCopyWith<_$IndividualQuotaImpl> get copyWith =>
      __$$IndividualQuotaImplCopyWithImpl<_$IndividualQuotaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndividualQuotaImplToJson(
      this,
    );
  }
}

abstract class _IndividualQuota implements IndividualQuota {
  const factory _IndividualQuota(
      {required final int total,
      required final int used,
      required final int remaining}) = _$IndividualQuotaImpl;

  factory _IndividualQuota.fromJson(Map<String, dynamic> json) =
      _$IndividualQuotaImpl.fromJson;

  @override
  int get total;
  @override
  int get used;
  @override
  int get remaining;

  /// Create a copy of IndividualQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IndividualQuotaImplCopyWith<_$IndividualQuotaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
