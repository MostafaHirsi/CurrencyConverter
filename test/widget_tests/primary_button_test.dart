import 'package:currency_converter/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PrimaryButton', () {
    group('when clicking on the primary button', () {
      testWidgets('then on press should be called',
          (WidgetTester tester) async {
        bool buttonPress = false;
        onPress() {
          buttonPress = true;
        }

        Widget myWidget = MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              onPress: onPress,
              text: "Button",
            ),
          ),
        );
        await tester.pumpWidget(myWidget);
        expect(find.text("Button"), findsOneWidget);
        await tester.tap(find.byType(PrimaryButton));
        expect(buttonPress, true);
      });
    });

    group('when primary button is loading', () {
      testWidgets('then on press should not be called',
          (WidgetTester tester) async {
        bool buttonPress = false;
        onPress() {
          buttonPress = true;
        }

        Widget myWidget = MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              onPress: onPress,
              text: "Button",
              isLoading: true,
            ),
          ),
        );
        await tester.pumpWidget(myWidget);
        expect(find.text("Button"), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.tap(find.byType(PrimaryButton));
        expect(buttonPress, false);
      });
    });
  });
}
