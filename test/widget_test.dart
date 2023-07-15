// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_todo_flutter/main.dart';
import 'package:simple_todo_flutter/todo_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Inputs "admin" at the email field
    await tester.enterText(find.byKey(const Key('email')), 'admin');

    // Inputs "admin" at the password field
    await tester.enterText(find.byKey(const Key('password')), 'admin');

    // Tap the login button
    await tester.tap(find.byKey(const Key('login')));

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Expect to navigate to the TodoPage
    expect(find.byType(TodoPage), findsOneWidget);

    // Expect to find the TodoPage title
    expect(find.text('Todo List'), findsOneWidget);

    // Expect to find the TodoPage add todo field
    expect(find.byKey(const Key('add_todo')), findsOneWidget);

    // Expect to find the TodoPage add todo button
    expect(find.byKey(const Key('add_todo_button')), findsOneWidget);

    // Inputs "Buy milk" at the add todo field
    await tester.enterText(find.byKey(const Key('add_todo')), 'Buy milk');

    // Tap the add todo button∆
    await tester.tap(find.byKey(const Key('add_todo_button')));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect to find the "Buy milk" todo
    expect(find.text('Buy milk'), findsOneWidget);
  });
}
