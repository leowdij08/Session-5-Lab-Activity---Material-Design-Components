import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:codelabs_101/login.dart';

void main() {
  testWidgets('Login Page Smoke Test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that the login page shows "SHRINE"
    expect(find.text('SHRINE'), findsOneWidget);

    // Verify presence of username and password text fields
    expect(find.byType(TextField), findsNWidgets(2)); // Two TextFields for username and password

    // Enter username and password
    await tester.enterText(find.byType(TextField).at(0), 'testuser');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    // Verify that the entered text appears in the fields
    expect(find.text('testuser'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);

    // Tap the "NEXT" button
    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle();

    // Verify navigation to the next page
    expect(find.text('Welcome to the next page!'), findsOneWidget);
  });
}
