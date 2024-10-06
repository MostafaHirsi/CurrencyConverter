import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final double value;
  final String symbol;
  final bool enabled;
  final Function(String)? onChanged;
  const NumberInput(
      {super.key,
      required this.value,
      required this.symbol,
      this.enabled = true,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    String defaultLocale = Platform.localeName;
    CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter.currency(
      symbol: symbol,
      locale: defaultLocale,
      decimalDigits: 2,
      inputDirection: InputDirection.right,
    );
    TextEditingController controller =
        TextEditingController(text: formatter.formatDouble(value));
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return TextField(
      enabled: enabled,
      keyboardType: TextInputType.number,
      inputFormatters: [formatter],
      style: const TextStyle(
        fontSize: 60,
        letterSpacing: -4,
        fontWeight: FontWeight.w300,
      ),
      onChanged: enabled ? onChanged : null,
      showCursor: false,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      controller: controller,
    );
  }
}
