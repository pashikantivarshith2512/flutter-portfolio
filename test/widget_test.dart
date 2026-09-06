import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_flutter/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.exception.toString().contains('NetworkImage') ||
          details.exception.toString().contains('HTTP request failed')) {
        return;
      }
      originalOnError?.call(details);
    };

    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify that student name Varshith is present on HomePage
    expect(find.text('Varshith'), findsOneWidget);
    expect(find.text('B.Tech CSE Student'), findsOneWidget);

    FlutterError.onError = originalOnError;
  });
}
