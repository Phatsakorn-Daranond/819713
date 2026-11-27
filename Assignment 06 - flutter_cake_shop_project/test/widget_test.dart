import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cake_shop_project/main.dart';

void main() {
  testWidgets('Cake Shop app starts successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const CakeShopApp());

    expect(find.byType(CakeShopApp), findsOneWidget);
  });
}
