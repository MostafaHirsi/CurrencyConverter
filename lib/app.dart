import 'dart:io';

import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/navigation/router.dart';
import 'package:currency_converter/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  final ThemeMode initialThemeMode;
  const App({
    super.key,
    required this.initialThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of(context);
    List<GoRoute> routes = buildRoutes(initialThemeMode);
    GoRouter router = GoRouter(routes: routes);
    return BlocBuilder<AppBloc, AppState>(
      bloc: appBloc,
      builder: (context, state) {
        ThemeMode themeMode =
            state is AppLoaded ? state.themeMode : initialThemeMode;
        String defaultLocale = Platform.localeName;
        String locale = state is AppLoaded ? state.locale : defaultLocale;
        return MaterialApp.router(
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('fr', ''),
          ],
          locale: Locale(locale),
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          themeMode: themeMode,
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}
