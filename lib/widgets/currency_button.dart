import 'package:currency_converter/models/currency/currency.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class CurrencyButton extends StatelessWidget {
  final double iconSize = 20;
  final Currency currency;
  final Function() onPress;
  const CurrencyButton(
      {super.key, required this.currency, required this.onPress});

  @override
  Widget build(BuildContext context) {
    String code = currency.code.substring(0, 2).toLowerCase();
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              right: 6,
            ),
            child: Flag.fromString(
              code,
              width: iconSize,
              height: iconSize,
              borderRadius: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 6,
            ),
            child: Text(
              '${currency.symbolNative} ${currency.code} - ${currency.name} ',
              style: const TextStyle(
                letterSpacing: 0,
                wordSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded)
        ],
      ),
    );
  }
}
