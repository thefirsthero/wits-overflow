// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wits_overflow/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Finds temporary 'go to next screen button'
    var btnTravel = find.byKey(ValueKey(3));
    expect(btnTravel, findsOneWidget);

    // Pushes button to begin rest of test
    await tester.tap(btnTravel);
    await tester.pumpAndSettle();

    // Expect to find text text fields
    // Finds text fields
    var textFieldTitle = find.byKey(ValueKey(1));
    expect(textFieldTitle, findsOneWidget);

    var textFieldBody = find.byKey(ValueKey(2));
    expect(textFieldBody, findsOneWidget);

    // Enters text into textfields
    await tester.enterText(textFieldTitle, 'Test Title');
    expect(find.text('Test Title'), findsOneWidget);

    await tester.enterText(textFieldBody, 'Test Question Body');
    expect(find.text('Test Question Body'), findsOneWidget);

    // Find post button
    var btnPost = find.byKey(ValueKey(4));
    expect(btnPost, findsOneWidget);

    // Tap post button and expect cleared textfields
    await tester.tap(btnPost);
    await tester.pumpAndSettle();

    expect(find.text('Test Title'), findsNothing);
    expect(find.text('Test Question Body'), findsNothing);
  });
}
