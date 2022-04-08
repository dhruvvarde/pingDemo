import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/main.dart';

void main() {
  testWidgets('Find Widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var text = find.text("Click on Button to check server time");
    expect(text, findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('Tap on button', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var button = find.text("Click");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
  });

  testWidgets('Check Listview Visibility', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var listView = find.byType(ListView);
    expect(listView, findsNothing);
    await tester.pumpAndSettle();
  });

  testWidgets('Find Listview', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final Finder button = find.text("Click");
    expect(button, findsOneWidget);

    await Future<void>.delayed(const Duration(seconds: 1));

    await tester.tap(button);

    await Future<void>.delayed(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    final Finder listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    await tester.pumpAndSettle();
  });
}
