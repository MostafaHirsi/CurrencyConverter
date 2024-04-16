import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/screens/home.dart';
import 'package:currency_converter/utils/colors.dart';
import 'package:currency_converter/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/settings.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of(context);
    return BlocBuilder(
      bloc: appBloc,
      builder: (context, state) {
        ThemeMode themeMode =
            state is AppLoaded ? state.themeMode : ThemeMode.system;
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          themeMode: themeMode,
          theme: theme,
          darkTheme: darkTheme,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Settings.routeName:
                    return const Settings();
                  default:
                    return const Home();
                }
              },
            );
          },
        );
      },
    );
  }
}
