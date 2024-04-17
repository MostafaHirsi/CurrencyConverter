import 'package:currency_converter/models/currency/currency.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

class CurrenciesListModal extends StatelessWidget {
  final double iconSize = 20;
  final List<Currency> currencies;
  const CurrenciesListModal({super.key, required this.currencies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            40,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          Currency currency = currencies[index];
          String code = currency.code.substring(0, 2).toLowerCase();
          return Column(
            children: [
              buildListTile(context, code, currency),
              buildDivider(),
            ],
          );
        },
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
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
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
}
