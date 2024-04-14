// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  String get accountId => throw _privateConstructorUsedError;
  Quotas get quotas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call({String accountId, Quotas quotas});

  $QuotasCopyWith<$Res> get quotas;
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? quotas = null,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      quotas: null == quotas
          ? _value.quotas
          : quotas // ignore: cast_nullable_to_non_nullable
              as Quotas,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuotasCopyWith<$Res> get quotas {
    return $QuotasCopyWith<$Res>(_value.quotas, (value) {
      return _then(_value.copyWith(quotas: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountId, Quotas quotas});

  @override
  $QuotasCopyWith<$Res> get quotas;
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? quotas = null,
  }) {
    return _then(_$StatusImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      quotas: null == quotas
          ? _value.quotas
          : quotas // ignore: cast_nullable_to_non_nullable
              as Quotas,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusImpl with DiagnosticableTreeMixin implements _Status {
  const _$StatusImpl({required this.accountId, required this.quotas});

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  @override
  final String accountId;
  @override
  final Quotas quotas;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Status(accountId: $accountId, quotas: $quotas)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Status'))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty('quotas', quotas));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.quotas, quotas) || other.quotas == quotas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, quotas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status implements Status {
  const factory _Status(
      {required final String accountId,
      required final Quotas quotas}) = _$StatusImpl;

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  String get accountId;
  @override
  Quotas get quotas;
  @override
  @JsonKey(ignore: true)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Quotas _$QuotasFromJson(Map<String, dynamic> json) {
  return _Quotas.fromJson(json);
}

/// @nodoc
mixin _$Quotas {
  IndividualQuota get month => throw _privateConstructorUsedError;
  IndividualQuota get grace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotasCopyWith<Quotas> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotasCopyWith<$Res> {
  factory $QuotasCopyWith(Quotas value, $Res Function(Quotas) then) =
      _$QuotasCopyWithImpl<$Res, Quotas>;
  @useResult
  $Res call({IndividualQuota month, IndividualQuota grace});

  $IndividualQuotaCopyWith<$Res> get month;
  $IndividualQuotaCopyWith<$Res> get grace;
}

/// @nodoc
class _$QuotasCopyWithImpl<$Res, $Val extends Quotas>
    implements $QuotasCopyWith<$Res> {
  _$QuotasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? grace = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as IndividualQuota,
      grace: null == grace
          ? _value.grace
          : grace // ignore: cast_nullable_to_non_nullable
              as IndividualQuota,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IndividualQuotaCopyWith<$Res> get month {
    return $IndividualQuotaCopyWith<$Res>(_value.month, (value) {
      return _then(_value.copyWith(month: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IndividualQuotaCopyWith<$Res> get grace {
    return $IndividualQuotaCopyWith<$Res>(_value.grace, (value) {
      return _then(_value.copyWith(grace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuotasImplCopyWith<$Res> implements $QuotasCopyWith<$Res> {
  factory _$$QuotasImplCopyWith(
          _$QuotasImpl value, $Res Function(_$QuotasImpl) then) =
      __$$QuotasImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IndividualQuota month, IndividualQuota grace});

  @override
  $IndividualQuotaCopyWith<$Res> get month;
  @override
  $IndividualQuotaCopyWith<$Res> get grace;
}

/// @nodoc
class __$$QuotasImplCopyWithImpl<$Res>
    extends _$QuotasCopyWithImpl<$Res, _$QuotasImpl>
    implements _$$QuotasImplCopyWith<$Res> {
  __$$QuotasImplCopyWithImpl(
      _$QuotasImpl _value, $Res Function(_$QuotasImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? grace = null,
  }) {
    return _then(_$QuotasImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as IndividualQuota,
      grace: null == grace
          ? _value.grace
          : grace // ignore: cast_nullable_to_non_nullable
              as IndividualQuota,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotasImpl with DiagnosticableTreeMixin implements _Quotas {
  const _$QuotasImpl({required this.month, required this.grace});

  factory _$QuotasImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotasImplFromJson(json);

  @override
  final IndividualQuota month;
  @override
  final IndividualQuota grace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quotas(month: $month, grace: $grace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Quotas'))
      ..add(DiagnosticsProperty('month', month))
      ..add(DiagnosticsProperty('grace', grace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotasImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.grace, grace) || other.grace == grace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, grace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotasImplCopyWith<_$QuotasImpl> get copyWith =>
      __$$QuotasImplCopyWithImpl<_$QuotasImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotasImplToJson(
      this,
    );
  }
}

abstract class _Quotas implements Quotas {
  const factory _Quotas(
      {required final IndividualQuota month,
      required final IndividualQuota grace}) = _$QuotasImpl;

  factory _Quotas.fromJson(Map<String, dynamic> json) = _$QuotasImpl.fromJson;

  @override
  IndividualQuota get month;
  @override
  IndividualQuota get grace;
  @override
  @JsonKey(ignore: true)
  _$$QuotasImplCopyWith<_$QuotasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
