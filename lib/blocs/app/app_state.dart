part of 'app_bloc.dart';

@immutable
sealed class AppState extends Equatable {}

final class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

final class AppLoading extends AppState {
  @override
  List<Object> get props => [];
}

final class AppLoaded extends AppState {
  final List<Currency> currencies;
  final ThemeMode themeMode;
  final String locale;

  AppLoaded(this.currencies, this.themeMode, this.locale);
  @override
  List<Object> get props => [currencies, themeMode, locale];
}

final class AppError extends AppState {
  final String message;

  AppError({required this.message});
  @override
  List<Object> get props => [message];
}
