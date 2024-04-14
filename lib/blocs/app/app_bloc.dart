import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../providers/currency_api_provider/currency_api_provider.dart';
import '../../providers/shared_preferences/shared_preferences_provider.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CurrencyApiProvider backendProvider;
  final SharedPreferencesProvider sharedPreferencesProvider;

  AppBloc(this.backendProvider, this.sharedPreferencesProvider)
      : super(AppInitial()) {
    on<AppEvent>((event, emit) async {});
  }
}
