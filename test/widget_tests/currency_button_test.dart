import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/widgets/currency_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyButton', () {
    group('when clicking on the currency button', () {
      testWidgets('then on press should be called',
          (WidgetTester tester) async {
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
        bool buttonPress = false;
        onPress() {
          buttonPress = true;
        }

        Widget myWidget = MaterialApp(
          home: Scaffold(
            body: CurrencyButton(
              onPress: onPress,
              currency: usdCurrency,
            ),
          ),
        );
        await tester.pumpWidget(myWidget);
        expect(find.text("\$ USD - US Dollar "), findsOneWidget);
        await tester.tap(find.byType(CurrencyButton));
        expect(buttonPress, true);
      });
    });
  });
}
