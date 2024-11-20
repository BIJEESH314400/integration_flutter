import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:unit_widget_test_demo/second_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
// for test the particular Ui//
  testWidgets('Test a particular UI', (WidgetTester tester) async {
    // Pump the specific widget you want to test
    await tester.pumpWidget(
      MaterialApp(
        home: SecondPage(),
      ),
    );

    // Interact with and test elements on the SpecificPage
    final textFieldFinder = find.byKey(const Key('second_page_textField'));
    await tester.enterText(textFieldFinder, 'testing');
    expect(textFieldFinder, findsOneWidget);

    final buttonFinder = find.byKey(const Key('second_page_button'));
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verify outcomes (e.g., navigation, changes)
    expect(find.text('Success!'), findsOneWidget);
  });
}
