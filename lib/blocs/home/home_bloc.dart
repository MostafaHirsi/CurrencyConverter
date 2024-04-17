import 'package:bloc/bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/models/exchange_rate/exchange_rate.dart';
import 'package:currency_converter/models/quote/quote.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/utils/update_previous_quotes.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<Currency> currencies;
  final CurrencyApiProvider currencyApiProvider;
  final SharedPreferencesProvider sharedPreferencesProvider;

  HomeBloc(
      this.currencies, this.currencyApiProvider, this.sharedPreferencesProvider)
      : super(HomeInitialised(
          baseCurrency: currencies.first,
          targetCurrency: currencies[1],
          targetValue: 0,
          baseValue: 0,
        )) {
    on<HomeEvent>((event, emit) async {
      try {
        if (event is ConvertCurrency) {
          await convertCurrency(emit, event);
        }

        if (event is ChangeCurrency) {
          emit(
            HomeInitialised(
              baseCurrency: event.baseCurrency,
              targetCurrency: event.targetCurrency,
              baseValue: 0.0,
              targetValue: 0.0,
            ),
          );
        }

        if (event is FlipCurrency) {
          emit(
            HomeInitialised(
              baseCurrency: event.targetCurrency,
              targetCurrency: event.baseCurrency,
              baseValue: event.targetValue,
              targetValue: event.baseValue,
            ),
          );
        }
      } catch (e) {
        emit(
          HomeError(
            error: 'Something went wrong, please try again later',
            baseCurrency: event.baseCurrency,
            targetCurrency: event.targetCurrency,
            baseValue: 0,
            targetValue: 0,
          ),
        );
      }
    });
  }

  Future<void> convertCurrency(
      Emitter<HomeState> emit, ConvertCurrency event) async {
    emit(
      HomeLoading(
        baseCurrency: event.baseCurrency,
        targetCurrency: event.targetCurrency,
        baseValue: event.baseValue,
        targetValue: 0.0,
      ),
    );
    ExchangeRate exchangeRate = await currencyApiProvider.getExchangeRate(
        baseCurrency: event.baseCurrency.code);
    double targetInitialValue =
        exchangeRate.data[event.targetCurrency.code] as double;

    double targetValue = targetInitialValue * event.baseValue;
    emit(
      HomeInitialised(
        baseCurrency: event.baseCurrency,
        targetCurrency: event.targetCurrency,
        baseValue: event.baseValue,
        targetValue: targetValue,
      ),
    );

    Quote quote = Quote(
      baseCurrencyCode: event.baseCurrency.code,
      targetCurrencyCode: event.targetCurrency.code,
      baseCurrencyName: event.baseCurrency.name,
      targetCurrencyName: event.targetCurrency.name,
      baseValue: event.baseValue,
      targetValue: targetValue,
    );

    await updatePreviousQuotes(quote, sharedPreferencesProvider);
  }
}
