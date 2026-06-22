import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:office_task_jules_stitch/main.dart';

void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LuminaApp());

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // The app starts on the splash/welcome screen which is part of onboarding,
    // so we can just look for a widget that exists in the app. Since it routes,
    // finding any widget proves it compiled and loaded.
    expect(find.byType(MaterialApp), findsWidgets);
  });
}
