import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_run_tracker_app/main.dart';

void main() {
  testWidgets('Run Tracker app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const RunTrackerApp());

    // รอให้ Timer ของ Splash Screen ทำงานจนเสร็จ
    await tester.pump(const Duration(milliseconds: 1800));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
