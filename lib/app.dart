import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/blocs/home/home_bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/providers/currency_api_provider/currency_api_provider.dart';
import 'package:currency_converter/screens/home.dart';
import 'package:currency_converter/screens/splash.dart';
import 'package:currency_converter/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injector/injector.dart';

import 'screens/settings.dart';

class App extends StatelessWidget {
  final ThemeMode initialThemeMode;
  const App({
    super.key,
    required this.initialThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of(context);
    GlobalKey<NavigatorState> navigatorKey = Injector.appInstance.get();
    return BlocListener(
      bloc: appBloc,
      listener: (context, state) {
        if (state is AppLoaded) {
          navigatorKey.currentState!
              .pushNamed(Home.routeName, arguments: state.currencies);
        }
      },
      child: BlocBuilder(
        bloc: appBloc,
        builder: (context, state) {
          ThemeMode themeMode =
              state is AppLoaded ? state.themeMode : initialThemeMode;
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
            navigatorKey: navigatorKey,
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case Settings.routeName:
                      return const Settings();
                    case Home.routeName:
                      List<Currency> currencies =
                          routeSettings.arguments as List<Currency>;
                      CurrencyApiProvider currencyApiProvider =
                          Injector.appInstance.get();
                      HomeBloc homeBloc =
                          HomeBloc(currencies, currencyApiProvider);
                      return BlocProvider(
                        create: (context) => homeBloc,
                        child: const Home(),
                      );
                    default:
                      return Splash(
                        themeMode: themeMode,
                      );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
