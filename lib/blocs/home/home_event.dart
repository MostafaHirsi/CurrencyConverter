part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  final Currency baseCurrency;
  final Currency targetCurrency;

  const HomeEvent({required this.baseCurrency, required this.targetCurrency});
}

class ChangeCurrency extends HomeEvent {
  const ChangeCurrency(
      {required super.baseCurrency, required super.targetCurrency});
  @override
  List<Object?> get props => [baseCurrency, targetCurrency];
}

class FlipCurrency extends HomeEvent {
  final double targetValue;
  final double baseValue;
  const FlipCurrency(this.targetValue, this.baseValue,
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
