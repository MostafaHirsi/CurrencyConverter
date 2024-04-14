// Mocks generated by Mockito 5.4.4 from annotations
// in currency_converter/test/mocks/generate_mock_providers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:currency_converter/src/providers/backend/backend_provider.dart'
    as _i2;
import 'package:currency_converter/src/providers/shared_preferences/shared_preferences_provider.dart'
    as _i4;
import 'package:currency_converter/src/utils/shared_preferences_constants.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [BackendProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackendProvider extends _i1.Mock implements _i2.BackendProvider {
  MockBackendProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get endpoint => (super.noSuchMethod(
        Invocation.getter(#endpoint),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#endpoint),
        ),
      ) as String);
}

/// A class which mocks [SharedPreferencesProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesProvider<T> extends _i1.Mock
    implements _i4.SharedPreferencesProvider<T> {
  MockSharedPreferencesProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> initialise() => (super.noSuchMethod(
        Invocation.method(
          #initialise,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  dynamic set(
    _i6.SharedPreferencesEnum? key,
    T? value,
  ) =>
      super.noSuchMethod(Invocation.method(
        #set,
        [
          key,
          value,
        ],
      ));

  @override
  T get(_i6.SharedPreferencesEnum? key) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [key],
        ),
        returnValue: _i3.dummyValue<T>(
          this,
          Invocation.method(
            #get,
            [key],
          ),
        ),
      ) as T);

  @override
  dynamic containsKey(_i6.SharedPreferencesEnum? key) =>
      super.noSuchMethod(Invocation.method(
        #containsKey,
        [key],
      ));
}
