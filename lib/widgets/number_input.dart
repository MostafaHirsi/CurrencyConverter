import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class NumberInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String symbol;
  final bool enabled;
  const NumberInput(
      {super.key,
      required this.textEditingController,
      required this.symbol,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    String locale = Intl.getCurrentLocale();
    CurrencyTextInputFormatter formatter =
        CurrencyTextInputFormatter(symbol: symbol, locale: locale);
    if (textEditingController.text.isEmpty) {
      String formattedValue = formatter.format('0.00');
      textEditingController.text = formattedValue;
    }
    return Container(
      margin: const EdgeInsets.all(12),
      child: TextField(
        enabled: enabled,
        keyboardType: TextInputType.number,
        inputFormatters: [formatter],
        style: const TextStyle(
          fontSize: 46,
          letterSpacing: -1,
        ),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        controller: textEditingController,
      ),
    );
  }
}
