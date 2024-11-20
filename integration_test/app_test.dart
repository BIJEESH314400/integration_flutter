import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:unit_widget_test_demo/main.dart' as app;
import 'package:unit_widget_test_demo/second_page.dart';


void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // for test the entire app//

  testWidgets('integration test Entire app', (WidgetTester tester) async {
    app.main();
      await tester.pumpAndSettle();
      final textFieldFinder = find.byKey(const Key('textField_a'));
      expect(textFieldFinder, findsOneWidget);
      await tester.enterText(textFieldFinder, '10');

      // Verify the entered text
      expect(find.text('10'), findsOneWidget);

      // Find the second TextField using the key
      final textFieldFinder2 = find.byKey(const Key('textField_b'));
      expect(textFieldFinder2, findsOneWidget);
      await tester.enterText(textFieldFinder2, '20');

      // Verify the entered text
      expect(find.text('20'), findsOneWidget);
      // Find the button and tap it multiple times
      final Finder button = find.text('Click Me');


      for (var i=0; i <3 ;i++){
        await tester.tap(button);
        await Future.delayed(const Duration(seconds: 1));
      }

      await tester.pumpAndSettle();
      expect(find.text('30'), findsOneWidget);

      // **Navigate to Another Page**
      final Finder navigateButton = find.byKey(const Key('navigate_button'));
      expect(navigateButton, findsOneWidget);
      await tester.tap(navigateButton);
      await tester.pumpAndSettle();

      // **Test the Second Page**
      expect(find.byType(SecondPage), findsOneWidget);

      // Interact with elements on the second page
      final textFieldOnSecondPage = find.byKey(const Key('second_page_textField'));
      expect(textFieldOnSecondPage, findsOneWidget);
      await tester.enterText(textFieldOnSecondPage, 'Testing Second Page');
      expect(find.text('Testing Second Page'), findsOneWidget);

      final secondPageButton = find.byKey(const Key('second_page_button'));
      await tester.tap(secondPageButton);
      await tester.pumpAndSettle();

      // Verify result or effect on the second page
      expect(find.text('Success!'), findsOneWidget);
  });

}