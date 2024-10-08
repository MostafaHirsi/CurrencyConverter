import 'dart:async';

import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/utils/colors.dart';
import 'package:currency_converter/widgets/custom_textfield.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrenciesListModal extends StatefulWidget {
  final List<Currency> currencies;

  CurrenciesListModal({super.key, required this.currencies});

  @override
  State<CurrenciesListModal> createState() => _CurrenciesListModalState();
}

class _CurrenciesListModalState extends State<CurrenciesListModal> {
  final double iconSize = 20;

  Timer? _debounce;

  String searchTerms = '';
  final String hint = 'British Pound Sterling';
  final icon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    List currencyList = searchTerms.isNotEmpty
        ? widget.currencies.where((currency) {
            bool isCodePartialMatch =
                currency.code.toLowerCase().contains(searchTerms.toLowerCase());
            bool isNamePartialMatch =
                currency.name.toLowerCase().contains(searchTerms.toLowerCase());

            bool isSymbolPartialMatch =
                currency.symbol.contains(searchTerms.toLowerCase()) ||
                    currency.symbolNative.contains(searchTerms.toLowerCase());
            return isCodePartialMatch ||
                isNamePartialMatch ||
                isSymbolPartialMatch;
          }).toList()
        : widget.currencies;
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
          CustomTextfield(
            hint: hint,
            icon: icon,
            onSearchChanged: _onSearchChanged,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currencyList.length,
              itemBuilder: (context, index) {
                Currency currency = currencyList[index];
                String code = currency.code.substring(0, 2).toLowerCase();
                return Column(
                  children: [
                    buildListTile(context, code, currency),
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

  ListTile buildListTile(BuildContext context, String code, Currency currency) {
    return ListTile(
      onTap: () => Navigator.pop(context, currency),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Flag.fromString(
        code,
        width: iconSize,
        height: iconSize,
        borderRadius: 100,
        fit: BoxFit.fitHeight,
      ),
      title: Text(
        '${currency.symbol} ${currency.code} - ${currency.name} ',
        style: const TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchTerms = query;
      });
    });
  }
}
