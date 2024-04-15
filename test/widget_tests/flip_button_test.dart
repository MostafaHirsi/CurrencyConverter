import 'package:currency_converter/widgets/flip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlipButton', () {
    group('when clicking on the flip button', () {
      testWidgets('then on press should be called',
          (WidgetTester tester) async {
        bool buttonPress = false;
        onPress() {
          buttonPress = true;
        }

        Widget myWidget = MaterialApp(
          home: Scaffold(
            body: FlipButton(onPress: onPress),
          ),
        );
        await tester.pumpWidget(myWidget);
        await tester.tap(find.byType(FlipButton));
        expect(buttonPress, true);
      });
    });
  });
}
