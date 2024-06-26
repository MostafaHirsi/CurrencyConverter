import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';

@GenerateMocks([
  CurrencyApiProvider,
  SharedPreferencesProvider,
])
class MockProviders {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}
