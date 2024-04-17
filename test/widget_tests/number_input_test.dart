import 'package:currency_converter/widgets/number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NumberInput', () {
    group('when using the dollar symbol', () {
      String symbol = '\$';
      group('and value is 0', () {
        testWidgets('then should display a value of \$0.00',
            (WidgetTester tester) async {
          Widget myWidget = MaterialApp(
            home: Scaffold(
              body: NumberInput(
                value: 0,
                symbol: symbol,
              ),
            ),
          );
          await tester.pumpWidget(myWidget);
          expect(find.text('\$0.00'), findsAtLeast(1));
        });
      });
      group('and user enters 10 into number input', () {
        testWidgets('then should display a value of \$0.10',
            (WidgetTester tester) async {
          Key textFieldKey = Key('textField');
          Widget myWidget = MaterialApp(
            home: Scaffold(
              body: NumberInput(
                key: textFieldKey,
                value: 0,
                symbol: symbol,
              ),
            ),
          );
          await tester.pumpWidget(myWidget);
          await tester.enterText(find.byType(TextField), '10');

          await tester.pump();
          expect(find.text('\$0.10'), findsAtLeast(1));
        });
      });
      group('and user enters 100000 into number input', () {
        testWidgets('then should display a value of \$1,000.00',
            (WidgetTester tester) async {
          Key textFieldKey = Key('textField');
          Widget myWidget = MaterialApp(
            home: Scaffold(
              body: NumberInput(
                key: textFieldKey,
                value: 0,
                symbol: symbol,
              ),
            ),
          );
          await tester.pumpWidget(myWidget);
          await tester.enterText(find.byType(TextField), '100000');
          await tester.pump();
          expect(find.text('\$1,000.00'), findsAtLeast(1));
        });
      });
      group('and number input is not enabled', () {
        testWidgets('then should display a value of \$0.00',
            (WidgetTester tester) async {
          Key textFieldKey = Key('textField');
          Widget myWidget = MaterialApp(
            home: Scaffold(
              body: NumberInput(
                key: textFieldKey,
                value: 0,
                symbol: symbol,
                enabled: false,
              ),
            ),
          );
          await tester.pumpWidget(myWidget);
          await tester.enterText(find.byType(TextField), '100000');
          await tester.pump();
          expect(find.text('\$0.00'), findsAtLeast(1));
        });
      });
    });
  });
}
