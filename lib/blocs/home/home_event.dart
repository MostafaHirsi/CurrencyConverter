part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  final Currency baseCurrency;
  final Currency targetCurrency;
  final DateTime selectedDate;

  const HomeEvent({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.selectedDate,
  });
}

class ChangeCurrency extends HomeEvent {
  final double? targetValue;
  final double? baseValue;
  const ChangeCurrency({
    required super.baseCurrency,
    required super.targetCurrency,
    required super.selectedDate,
    this.targetValue = 0.0,
    this.baseValue = 0.0,
  });
  @override
  List<Object?> get props =>
      [baseCurrency, targetCurrency, selectedDate, baseValue, targetValue];
}

class FlipCurrency extends HomeEvent {
  final double targetValue;
  final double baseValue;
  const FlipCurrency(this.targetValue, this.baseValue,
      {required super.baseCurrency,
      required super.targetCurrency,
      required super.selectedDate});
  @override
  List<Object?> get props => [baseCurrency, targetCurrency, selectedDate];
}

class ConvertCurrency extends HomeEvent {
  final double baseValue;
  const ConvertCurrency(
      {required this.baseValue,
      required super.baseCurrency,
      required super.targetCurrency,
      required super.selectedDate});

  @override
  List<Object?> get props =>
      [baseCurrency, targetCurrency, baseValue, selectedDate];
}
