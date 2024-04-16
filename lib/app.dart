import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/screens/home.dart';
import 'package:currency_converter/utils/colors.dart';
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
