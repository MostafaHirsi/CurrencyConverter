part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  final Currency baseCurrency;
  final Currency targetCurrency;

  const HomeEvent({required this.baseCurrency, required this.targetCurrency});
}

class SwitchCurrency extends HomeEvent {
  const SwitchCurrency(
      {required super.baseCurrency, required super.targetCurrency});
  @override
  List<Object?> get props => [baseCurrency, targetCurrency];
}

class ConvertCurrency extends HomeEvent {
  final double baseValue;
  const ConvertCurrency(
      {required this.baseValue,
      required super.baseCurrency,
      required super.targetCurrency});

  @override
  List<Object?> get props => [baseCurrency, targetCurrency, baseValue];
}
