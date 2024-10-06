// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyList _$CurrencyListFromJson(Map<String, dynamic> json) {
  return _CurrencyList.fromJson(json);
}

/// @nodoc
mixin _$CurrencyList {
  Map<String, Currency> get data => throw _privateConstructorUsedError;

  /// Serializes this CurrencyList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyListCopyWith<CurrencyList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyListCopyWith<$Res> {
  factory $CurrencyListCopyWith(
          CurrencyList value, $Res Function(CurrencyList) then) =
      _$CurrencyListCopyWithImpl<$Res, CurrencyList>;
  @useResult
  $Res call({Map<String, Currency> data});
}

/// @nodoc
class _$CurrencyListCopyWithImpl<$Res, $Val extends CurrencyList>
    implements $CurrencyListCopyWith<$Res> {
  _$CurrencyListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Currency>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyListImplCopyWith<$Res>
    implements $CurrencyListCopyWith<$Res> {
  factory _$$CurrencyListImplCopyWith(
          _$CurrencyListImpl value, $Res Function(_$CurrencyListImpl) then) =
      __$$CurrencyListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Currency> data});
}

/// @nodoc
class __$$CurrencyListImplCopyWithImpl<$Res>
    extends _$CurrencyListCopyWithImpl<$Res, _$CurrencyListImpl>
    implements _$$CurrencyListImplCopyWith<$Res> {
  __$$CurrencyListImplCopyWithImpl(
      _$CurrencyListImpl _value, $Res Function(_$CurrencyListImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CurrencyListImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Currency>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyListImpl with DiagnosticableTreeMixin implements _CurrencyList {
  const _$CurrencyListImpl({required final Map<String, Currency> data})
      : _data = data;

  factory _$CurrencyListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyListImplFromJson(json);

  final Map<String, Currency> _data;
  @override
  Map<String, Currency> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CurrencyList(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CurrencyList'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CurrencyList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyListImplCopyWith<_$CurrencyListImpl> get copyWith =>
      __$$CurrencyListImplCopyWithImpl<_$CurrencyListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyListImplToJson(
      this,
    );
  }
}

abstract class _CurrencyList implements CurrencyList {
  const factory _CurrencyList({required final Map<String, Currency> data}) =
      _$CurrencyListImpl;

  factory _CurrencyList.fromJson(Map<String, dynamic> json) =
      _$CurrencyListImpl.fromJson;

  @override
  Map<String, Currency> get data;

  /// Create a copy of CurrencyList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyListImplCopyWith<_$CurrencyListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
