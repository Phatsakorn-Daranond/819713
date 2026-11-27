
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshop_ui_project/main.dart';

void main() {
  testWidgets('Berry Juice app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const BerryJuiceApp());

    expect(find.text('BERRY JUICE'), findsOneWidget);
  });
}
