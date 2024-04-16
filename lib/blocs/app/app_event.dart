part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

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
