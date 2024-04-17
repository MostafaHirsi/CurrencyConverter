part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final Currency baseCurrency;
  final double baseValue;
  final Currency targetCurrency;
  final double targetValue;

  const HomeState(
      {required this.baseCurrency,
      required this.baseValue,
      required this.targetCurrency,
      required this.targetValue});
}

class HomeInitialised extends HomeState {
  const HomeInitialised(
      {required super.baseCurrency,
      required super.baseValue,
      required super.targetCurrency,
      required super.targetValue});

  @override
  List<Object> get props =>
      [baseCurrency, targetCurrency, targetValue, targetCurrency];
}

class HomeLoading extends HomeInitialised {
  const HomeLoading(
      {required super.baseCurrency,
      required super.targetCurrency,
      required super.baseValue,
      required super.targetValue});

  @override
  List<Object> get props =>
      [baseCurrency, targetCurrency, targetValue, targetCurrency];
}

class HomeError extends HomeInitialised {
  final String error;

  const HomeError(
      {required this.error,
      required super.baseCurrency,
      required super.targetCurrency,
      required super.baseValue,
      required super.targetValue});

  @override
  List<Object> get props =>
      [error, baseCurrency, targetCurrency, targetValue, targetCurrency];
}
