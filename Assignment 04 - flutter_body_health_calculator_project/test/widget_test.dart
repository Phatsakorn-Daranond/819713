import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_body_health_calculator_project/main.dart';

void main() {
  testWidgets('Body Health Calculator app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const BodyHealthCalculatorApp());
    await tester.pump();

    expect(find.text('Body ว้าว'), findsWidgets);
  });
}
