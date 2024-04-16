import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/models/currency_list/currency_list.dart';
import 'package:currency_converter/utils/shared_preferences_constants.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../providers/currency_api_provider/currency_api_provider.dart';
import '../../providers/shared_preferences/shared_preferences_provider.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CurrencyApiProvider currencyApiProvider;
  final SharedPreferencesProvider sharedPreferencesProvider;

  AppBloc(this.currencyApiProvider, this.sharedPreferencesProvider)
      : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      try {
        if (event is LoadApp) {
          emit(AppLoading());
          List<Currency> currencies = await retrieveCurrencies();
          await storeCurrencies(currencies);
          ThemeMode themeMode = await retrieveThemeMode();
          emit(AppLoaded(currencies, themeMode));
        }
        if (event is UpdateThemeMode) {
          ThemeMode themeMode = event.themeMode;
          await sharedPreferencesProvider.set(
              SharedPreferencesEnum.themeMode, themeMode.index);
          List<Currency> currencies = await retrieveCurrencies(fromCache: true);
          emit(AppLoaded(currencies, themeMode));
        }
      } on DioException catch (dioException) {
        String errorMessage = "Something went wrong, please try again later.";
        switch (dioException.response?.statusCode) {
          case 401:
          case 403:
          case 404:
          case 422:
          case 429:
          case 500:
          default:
        }
        emit(AppError(message: errorMessage));
      } catch (e) {
        emit(
            AppError(message: "Something went wrong, please try again later."));
      }
    });
    add(LoadApp());
  }

  Future<ThemeMode> retrieveThemeMode() async {
    late ThemeMode themeMode;
    if (sharedPreferencesProvider
        .containsKey(SharedPreferencesEnum.themeMode)) {
      themeMode = ThemeMode.values[
          sharedPreferencesProvider.get(SharedPreferencesEnum.themeMode)];
    } else {
      themeMode = ThemeMode.system;
      await sharedPreferencesProvider.set(
          SharedPreferencesEnum.themeMode, themeMode.index);
    }
    return themeMode;
  }

  Future<void> storeCurrencies(List<Currency> currencies) async {
    List<String> stringCurrencies =
        currencies.map((currency) => jsonEncode(currency.toJson())).toList();
    await sharedPreferencesProvider.set(
        SharedPreferencesEnum.currencies, stringCurrencies);
  }

  Future<List<Currency>> retrieveCurrencies({bool fromCache = false}) async {
    if (fromCache) {
      List<String> cachedCurrencies =
          await sharedPreferencesProvider.get(SharedPreferencesEnum.currencies);
      return cachedCurrencies
          .map((currency) => Currency.fromJson(jsonDecode(currency)))
          .toList();
    }
    CurrencyList currencyList = await currencyApiProvider.getCurrencies();
    List<Currency> currencies = currencyList.data.values.toList();
    return currencies;
  }
}
