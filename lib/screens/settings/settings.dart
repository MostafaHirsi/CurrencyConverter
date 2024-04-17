import 'dart:io';

import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/modals/languages_list.dart';
import 'package:currency_converter/modals/theme_list.dart';
import 'package:currency_converter/utils/language_local.dart';
import 'package:currency_converter/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    LanguageLocal languageLocal = LanguageLocal();
    String defaultLocale = Platform.localeName;
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocBuilder(
      bloc: appBloc,
      builder: (context, state) {
        String locale = state is AppLoaded ? state.locale : defaultLocale;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.settingsTitle),
          ),
          body: Column(
            children: [
              SettingsTile(
                title: AppLocalizations.of(context)!.language,
                subTitle: languageLocal.getDisplayLanguage(locale),
                onTap: () async {
                  String? selectedLocale = await showModalBottomSheet<String?>(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    showDragHandle: true,
                    builder: (context) => const LanguagesListModal(
                      languageCodes: ['en', 'fr'],
                    ),
                  );
                  if (selectedLocale != null) {
                    appBloc.add(UpdateLocale(locale: selectedLocale));
                  }
                },
              ),
              SettingsTile(
                title: AppLocalizations.of(context)!.theme,
                subTitle: getThemeLabel(appBloc, context),
                onTap: () async {
                  ThemeMode? selectedTheme =
                      await showModalBottomSheet<ThemeMode?>(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    showDragHandle: true,
                    builder: (context) => const ThemeListModal(
                      themeModes: ThemeMode.values,
                    ),
                  );
                  if (selectedTheme != null) {
                    appBloc.add(UpdateThemeMode(themeMode: selectedTheme));
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  String getThemeLabel(AppBloc appBloc, BuildContext context) {
    AppState state = appBloc.state;
    ThemeMode themeMode =
        state is AppLoaded ? state.themeMode : ThemeMode.system;

    switch (themeMode) {
      case ThemeMode.light:
        return AppLocalizations.of(context)!.lightTheme;
      case ThemeMode.dark:
        return AppLocalizations.of(context)!.darkTheme;
      case ThemeMode.system:
        return AppLocalizations.of(context)!.auto;
    }
  }
}

// DropdownButton<ThemeMode>(
//               value: themeMode,
//               onChanged: (value) {
//                 if (value != null) {
//                   appBloc.add(UpdateThemeMode(themeMode: value));
//                 }
//               },
//               items: [
//                 DropdownMenuItem(
//                   value: ThemeMode.system,
//                   child: Text(AppLocalizations.of(context)!.auto),
//                 ),
//                 DropdownMenuItem(
//                   value: ThemeMode.light,
//                   child: Text(AppLocalizations.of(context)!.lightTheme),
//                 ),
//                 DropdownMenuItem(
//                   value: ThemeMode.dark,
//                   child: Text(AppLocalizations.of(context)!.darkTheme),
//                 )
//               ],
//             ),
//           )