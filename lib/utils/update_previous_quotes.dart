import 'dart:convert';
import 'package:currency_converter/models/quote/quote.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/utils/shared_preferences_constants.dart';

Future<List<Quote>> updatePreviousQuotes(
    Quote quote, SharedPreferencesProvider sharedPreferencesProvider) async {
  List cachedQuotes =
      sharedPreferencesProvider.get(SharedPreferencesEnum.previousQuotes) ?? [];
  List<Quote> quotes = cachedQuotes
      .map((cachedQuote) => Quote.fromJson(jsonDecode(cachedQuote)))
      .toList();
  if (quotes.length > 9) {
    quotes.removeLast();
  }
  quotes.add(quote);
  cachedQuotes = quotes
      .map(
        (quote) => jsonEncode(quote.toJson()),
      )
      .toList();

  await sharedPreferencesProvider.set(
      SharedPreferencesEnum.previousQuotes, cachedQuotes);
  return quotes;
}
