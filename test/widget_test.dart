import 'package:flutter_test/flutter_test.dart';
import 'package:moneymate/app.dart';

void main() {
  testWidgets('MoneyMate app displays welcome text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MoneyMateApp());

    expect(find.text('Welcome to MoneyMate'), findsOneWidget);
  });
}
