// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

// Import the app under test. The package name comes from pubspec.yaml (thuchanh02)
import 'package:thuchanh02/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  // Build the app and trigger a frame. The app's root widget is `ThucHanhApp`.
  await tester.pumpWidget(const ThucHanhApp());

  // The sample app doesn't have the default counter UI from the Flutter template,
  // so we at least verify the app's title is present.
  expect(find.text('Thực hành 02'), findsOneWidget);
  });
}
