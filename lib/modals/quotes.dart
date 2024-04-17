import 'package:currency_converter/models/quote/quote.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/utils/get_flag.dart';
import 'package:currency_converter/utils/retrieve_quotes.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class QuotesModal extends StatelessWidget {
  final double iconSize = 20;
  const QuotesModal({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesProvider sharedPreferencesProvider =
        Injector.appInstance.get();
    List<Quote> quotes = retrieveQuotes(sharedPreferencesProvider);
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
              "Previous Quotes",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
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
        '$baseValue - $targetValue',
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
