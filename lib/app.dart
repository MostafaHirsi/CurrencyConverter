import 'package:currency_converter/screens/home.dart';
import 'package:currency_converter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
    SvgTheme svgTheme = SvgTheme(
      currentColor: settingsController.themeMode == ThemeMode.dark
          ? AppColors.white
          : AppColors.black,
    );
    return DefaultSvgTheme(
      theme: svgTheme,
      child: BlocProvider(
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
                useMaterial3: true,
                fontFamily: 'Montserrat',
                splashFactory: NoSplash.splashFactory,
                dividerColor: AppColors.grey,
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                    shape: const CircleBorder(),
                    side: BorderSide.none,
                    padding: const EdgeInsets.all(12),
                    foregroundColor: Colors.black,
                  ),
                ),
                progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: Colors.grey,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                    ),
                    backgroundColor: AppColors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          6,
                        ),
                      ),
                    ),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.grey,
                  ),
                ),
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
              ),
              darkTheme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: const AppBarTheme(
                  color: Colors.black,
                ),
                progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: Colors.grey,
                ),
                dividerColor: AppColors.darkerGrey,
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.darkerGrey,
                    shape: const CircleBorder(),
                    side: BorderSide.none,
                    padding: const EdgeInsets.all(12),
                    foregroundColor: Colors.white,
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    backgroundColor: AppColors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          6,
                        ),
                      ),
                    ),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.grey,
                  ),
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
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
      ),
    );
  }
}
