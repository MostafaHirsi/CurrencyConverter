part of 'app_bloc.dart';

@immutable
sealed class AppEvent extends Equatable {}

final class LoadApp extends AppEvent {
  @override
  List<Object> get props => [];
}

final class UpdateThemeMode extends AppEvent {
  final ThemeMode themeMode;

  UpdateThemeMode({required this.themeMode});
  @override
  List<Object> get props => [themeMode];
}

final class UpdateLocale extends AppEvent {
  final String locale;

  UpdateLocale({required this.locale});
  @override
  List<Object> get props => [locale];
}
