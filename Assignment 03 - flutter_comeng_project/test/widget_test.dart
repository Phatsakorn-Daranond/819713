import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_comeng_project/main.dart';

void main() {
  testWidgets('SAU Developer app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const SAUDeveloperApp());
    expect(find.text('SAU Developer'), findsWidgets);
  });
}
