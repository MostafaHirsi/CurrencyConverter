import 'package:bloc/bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<Currency> currencies;
  final CurrencyApiProvider currencyApiProvider;
  HomeBloc(this.currencies, this.currencyApiProvider) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }
}
