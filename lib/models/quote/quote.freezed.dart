// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
mixin _$Quote {
  String get baseCurrencyCode => throw _privateConstructorUsedError;
  String get targetCurrencyCode => throw _privateConstructorUsedError;
  String get baseCurrencyName => throw _privateConstructorUsedError;
  String get targetCurrencyName => throw _privateConstructorUsedError;
  double get baseValue => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  /// Serializes this Quote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res, Quote>;
  @useResult
  $Res call(
      {String baseCurrencyCode,
      String targetCurrencyCode,
      String baseCurrencyName,
      String targetCurrencyName,
      double baseValue,
      double targetValue,
      DateTime? selectedDate});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res, $Val extends Quote>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = null,
    Object? targetCurrencyCode = null,
    Object? baseCurrencyName = null,
    Object? targetCurrencyName = null,
    Object? baseValue = null,
    Object? targetValue = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      baseCurrencyCode: null == baseCurrencyCode
          ? _value.baseCurrencyCode
          : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      targetCurrencyCode: null == targetCurrencyCode
          ? _value.targetCurrencyCode
          : targetCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      baseCurrencyName: null == baseCurrencyName
          ? _value.baseCurrencyName
          : baseCurrencyName // ignore: cast_nullable_to_non_nullable
              as String,
      targetCurrencyName: null == targetCurrencyName
          ? _value.targetCurrencyName
          : targetCurrencyName // ignore: cast_nullable_to_non_nullable
              as String,
      baseValue: null == baseValue
          ? _value.baseValue
          : baseValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteImplCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$$QuoteImplCopyWith(
          _$QuoteImpl value, $Res Function(_$QuoteImpl) then) =
      __$$QuoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseCurrencyCode,
      String targetCurrencyCode,
      String baseCurrencyName,
      String targetCurrencyName,
      double baseValue,
      double targetValue,
      DateTime? selectedDate});
}

/// @nodoc
class __$$QuoteImplCopyWithImpl<$Res>
    extends _$QuoteCopyWithImpl<$Res, _$QuoteImpl>
    implements _$$QuoteImplCopyWith<$Res> {
  __$$QuoteImplCopyWithImpl(
      _$QuoteImpl _value, $Res Function(_$QuoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = null,
    Object? targetCurrencyCode = null,
    Object? baseCurrencyName = null,
    Object? targetCurrencyName = null,
    Object? baseValue = null,
    Object? targetValue = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_$QuoteImpl(
      baseCurrencyCode: null == baseCurrencyCode
          ? _value.baseCurrencyCode
          : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      targetCurrencyCode: null == targetCurrencyCode
          ? _value.targetCurrencyCode
          : targetCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      baseCurrencyName: null == baseCurrencyName
          ? _value.baseCurrencyName
          : baseCurrencyName // ignore: cast_nullable_to_non_nullable
              as String,
      targetCurrencyName: null == targetCurrencyName
          ? _value.targetCurrencyName
          : targetCurrencyName // ignore: cast_nullable_to_non_nullable
              as String,
      baseValue: null == baseValue
          ? _value.baseValue
          : baseValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QuoteImpl with DiagnosticableTreeMixin implements _Quote {
  const _$QuoteImpl(
      {required this.baseCurrencyCode,
      required this.targetCurrencyCode,
      required this.baseCurrencyName,
      required this.targetCurrencyName,
      required this.baseValue,
      required this.targetValue,
      this.selectedDate});

  factory _$QuoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteImplFromJson(json);

  @override
  final String baseCurrencyCode;
  @override
  final String targetCurrencyCode;
  @override
  final String baseCurrencyName;
  @override
  final String targetCurrencyName;
  @override
  final double baseValue;
  @override
  final double targetValue;
  @override
  final DateTime? selectedDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quote(baseCurrencyCode: $baseCurrencyCode, targetCurrencyCode: $targetCurrencyCode, baseCurrencyName: $baseCurrencyName, targetCurrencyName: $targetCurrencyName, baseValue: $baseValue, targetValue: $targetValue, selectedDate: $selectedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Quote'))
      ..add(DiagnosticsProperty('baseCurrencyCode', baseCurrencyCode))
      ..add(DiagnosticsProperty('targetCurrencyCode', targetCurrencyCode))
      ..add(DiagnosticsProperty('baseCurrencyName', baseCurrencyName))
      ..add(DiagnosticsProperty('targetCurrencyName', targetCurrencyName))
      ..add(DiagnosticsProperty('baseValue', baseValue))
      ..add(DiagnosticsProperty('targetValue', targetValue))
      ..add(DiagnosticsProperty('selectedDate', selectedDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteImpl &&
            (identical(other.baseCurrencyCode, baseCurrencyCode) ||
                other.baseCurrencyCode == baseCurrencyCode) &&
            (identical(other.targetCurrencyCode, targetCurrencyCode) ||
                other.targetCurrencyCode == targetCurrencyCode) &&
            (identical(other.baseCurrencyName, baseCurrencyName) ||
                other.baseCurrencyName == baseCurrencyName) &&
            (identical(other.targetCurrencyName, targetCurrencyName) ||
                other.targetCurrencyName == targetCurrencyName) &&
            (identical(other.baseValue, baseValue) ||
                other.baseValue == baseValue) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      baseCurrencyCode,
      targetCurrencyCode,
      baseCurrencyName,
      targetCurrencyName,
      baseValue,
      targetValue,
      selectedDate);

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      __$$QuoteImplCopyWithImpl<_$QuoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteImplToJson(
      this,
    );
  }
}

abstract class _Quote implements Quote {
  const factory _Quote(
      {required final String baseCurrencyCode,
      required final String targetCurrencyCode,
      required final String baseCurrencyName,
      required final String targetCurrencyName,
      required final double baseValue,
      required final double targetValue,
      final DateTime? selectedDate}) = _$QuoteImpl;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$QuoteImpl.fromJson;

  @override
  String get baseCurrencyCode;
  @override
  String get targetCurrencyCode;
  @override
  String get baseCurrencyName;
  @override
  String get targetCurrencyName;
  @override
  double get baseValue;
  @override
  double get targetValue;
  @override
  DateTime? get selectedDate;

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
