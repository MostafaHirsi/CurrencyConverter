import 'package:bloc/bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/models/exchange_rate/exchange_rate.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<Currency> currencies;
  final CurrencyApiProvider currencyApiProvider;

  HomeBloc(this.currencies, this.currencyApiProvider)
      : super(HomeInitialised(
          baseCurrency: currencies.first,
          targetCurrency: currencies[1],
          targetValue: 0,
          baseValue: 0,
        )) {
    on<HomeEvent>((event, emit) async {
      try {
        if (event is ConvertCurrency) {
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
        }

        if (event is SwitchCurrency) {
          emit(
            HomeInitialised(
              baseCurrency: event.baseCurrency,
              targetCurrency: event.targetCurrency,
              baseValue: 0.0,
              targetValue: 0.0,
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

    // Currency gbpCurrency = Currency.fromJson({
    //   "symbol": "£",
    //   "name": "British Pound Sterling",
    //   "symbol_native": "£",
    //   "decimal_digits": 2,
    //   "rounding": 0,
    //   "code": "GBP",
    //   "name_plural": "British pounds sterling",
    //   "type": "fiat"
    // });

    // Currency usdCurrency = Currency.fromJson({
    //   "symbol": "\$",
    //   "name": "US Dollar",
    //   "symbol_native": "\$",
    //   "decimal_digits": 2,
    //   "rounding": 0,
    //   "code": "USD",
    //   "name_plural": "US dollars",
    //   "type": "fiat"
    // });

    // add(ConvertBaseCurrency(
    //   baseCurrency: gbpCurrency,
    //   targetCurrency: usdCurrency,
    //   baseValue: 0.0,
    // ));
  }
}
