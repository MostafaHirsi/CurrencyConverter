import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/widgets/currency_button.dart';
import 'package:currency_converter/widgets/flip_button.dart';
import 'package:currency_converter/widgets/number_input.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController baseValueController = TextEditingController();
  TextEditingController targeValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Currency usdCurrency = Currency.fromJson({
      "symbol": "\$",
      "name": "US Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "USD",
      "name_plural": "US dollars",
      "type": "fiat"
    });
    Currency gbpCurrency = Currency.fromJson({
      "symbol": "£",
      "name": "British Pound Sterling",
      "symbol_native": "£",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "GBP",
      "name_plural": "British pounds sterling",
      "type": "fiat"
    });
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: CurrencyButton(
                currency: usdCurrency,
                onPress: () {},
              ),
            ),
            NumberInput(
              textEditingController: baseValueController,
              symbol: usdCurrency.symbol,
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 24,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Divider(),
                  FlipButton(
                    onPress: () {},
                  )
                ],
              ),
            ),
            Flexible(
              child: CurrencyButton(
                currency: gbpCurrency,
                onPress: () {},
              ),
            ),
            NumberInput(
              textEditingController: targeValueController,
              symbol: gbpCurrency.symbol,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
