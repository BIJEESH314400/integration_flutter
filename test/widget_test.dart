import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_widget_test_demo/home_page.dart';



void main(){

  testWidgets('widget test ',(WidgetTester tester ) async {
    //arrange
    await tester.pumpWidget(
        const MaterialApp(
            home: HomePage())
        );

    final textFieldFinderA = find.byKey( const Key('textField_a'));
    expect(textFieldFinderA,findsOneWidget);
    await tester.enterText(textFieldFinderA, '2');
    expect(find.text('2'), findsOneWidget);


    final textFieldFinderB = find.byKey(const Key('textField_b'));
    expect(textFieldFinderB,findsOneWidget);
    await tester.enterText(textFieldFinderB, '5');
    expect(find.text('5'), findsOneWidget);


    final buttonFinder = find.text('Click Me');
    expect(buttonFinder, findsOneWidget);
    await tester.tap(buttonFinder);

    await tester.pump();

    final textFinder =  find.text('7');
    expect(textFinder, findsOneWidget);

  });


}