import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeListModal extends StatelessWidget {
  final double iconSize = 20;
  final List<ThemeMode> themeModes;
  const ThemeListModal({super.key, required this.themeModes});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 18,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            40,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Text(
              AppLocalizations.of(context)!.currenciesModalTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: themeModes.length,
              itemBuilder: (context, index) {
                ThemeMode themeMode = themeModes[index];
                return Column(
                  children: [
                    buildListTile(context, themeMode),
                    buildDivider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Divider buildDivider() {
    return const Divider(
      endIndent: 20,
      indent: 20,
    );
  }

  ListTile buildListTile(BuildContext context, ThemeMode themeMode) {
    return ListTile(
      onTap: () => Navigator.pop(context, themeMode),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(
        getThemeLabel(themeMode, context),
        style: const TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  String getThemeLabel(ThemeMode themeMode, BuildContext context) {
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
