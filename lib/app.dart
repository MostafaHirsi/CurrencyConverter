import 'package:currency_converter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injector/injector.dart';

import 'providers/currency_api_provider/currency_api_provider.dart';
import 'providers/shared_preferences/shared_preferences_provider.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    CurrencyApiProvider backendProvider = Injector.appInstance.get();
    SharedPreferencesProvider sharedPreferencesProvider =
        Injector.appInstance.get();
    AppBloc appBloc = AppBloc(backendProvider, sharedPreferencesProvider);
    return BlocProvider(
      create: (context) => appBloc,
      child: AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
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
            themeMode: settingsController.themeMode,
            theme: ThemeData(
              textTheme: GoogleFonts.montserratTextTheme(),
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
            ),
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    default:
                      return const Home();
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
