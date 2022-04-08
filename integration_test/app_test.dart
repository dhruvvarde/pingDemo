import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('tap on button', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder text = find.text("Click on Button to check server time");
    expect(text, findsOneWidget);

    final Finder button = find.text("Click");
    expect(button, findsOneWidget);

    await tester.tap(button);

    await tester.pumpAndSettle();
  });

  testWidgets('send ping request', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

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

  testWidgets('check ping response', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    var ping = Ping('google.com', count: 1);
    var data = await ping.stream.first;
    expect(data, isA<PingData>());

    await tester.pumpAndSettle();
  });
}
