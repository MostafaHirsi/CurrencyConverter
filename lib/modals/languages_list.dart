import 'package:currency_converter/utils/language_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagesListModal extends StatelessWidget {
  final double iconSize = 20;
  final List<String> languageCodes;
  const LanguagesListModal({super.key, required this.languageCodes});

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
              itemCount: languageCodes.length,
              itemBuilder: (context, index) {
                String languageCode = languageCodes[index];
                return Column(
                  children: [
                    buildListTile(context, languageCode),
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

  ListTile buildListTile(BuildContext context, String code) {
    LanguageLocal languageLocal = LanguageLocal();
    return ListTile(
      onTap: () => Navigator.pop(context, code),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(
        languageLocal.getDisplayLanguage(code),
        style: const TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
