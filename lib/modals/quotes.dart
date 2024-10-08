import 'package:currency_converter/models/quote/quote.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/utils/get_flag.dart';
import 'package:currency_converter/utils/retrieve_quotes.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class QuotesModal extends StatelessWidget {
  final double iconSize = 20;
  const QuotesModal({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesProvider sharedPreferencesProvider =
        Injector.appInstance.get();
    List<Quote> quotes =
        retrieveQuotes(sharedPreferencesProvider).reversed.toList();
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18),
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
              AppLocalizations.of(context)!.quoteModalTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                Quote quote = quotes[index];
                return Column(
                  children: [
                    buildListTile(context, quote),
                    buildDivider(),
                  ],
                );
              },
            ),
          )
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

  ListTile buildListTile(BuildContext context, Quote quote) {
    Flag baseFlag = getFlag(quote.baseCurrencyCode, iconSize);
    Flag targetFlag = getFlag(quote.targetCurrencyCode, iconSize);
    String baseValue = quote.baseValue.toStringAsFixed(2);
    String targetValue = quote.targetValue.toStringAsFixed(2);
    final DateTime dateToFormat = quote.selectedDate ?? DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(dateToFormat);
    return ListTile(
      onTap: () => Navigator.pop(context, quote),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: SizedBox(
        width: iconSize * 1.5,
        height: iconSize * 1.5,
        child: Stack(
          children: [
            Positioned(
              child: baseFlag,
            ),
            Positioned(
              bottom: -0.5,
              right: -0.5,
              child: targetFlag,
            ),
          ],
        ),
      ),
      title: Text(
        '${quote.baseCurrencyCode} - ${quote.targetCurrencyCode} ',
        style: const TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        formattedDate,
      ),
      trailing: Text(
        '$baseValue → $targetValue',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
