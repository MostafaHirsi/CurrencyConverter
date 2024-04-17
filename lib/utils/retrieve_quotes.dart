import 'dart:convert';
import 'package:currency_converter/models/quote/quote.dart';
import 'package:currency_converter/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:currency_converter/utils/shared_preferences_constants.dart';

List<Quote> retrieveQuotes(
    SharedPreferencesProvider sharedPreferencesProvider) {
  List cachedQuotes =
      sharedPreferencesProvider.get(SharedPreferencesEnum.previousQuotes) ?? [];
  List<Quote> quotes = cachedQuotes
      .map((cachedQuote) => Quote.fromJson(jsonDecode(cachedQuote)))
      .toList();
  return quotes;
}
