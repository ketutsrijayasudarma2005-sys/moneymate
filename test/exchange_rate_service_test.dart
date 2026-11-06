import 'package:flutter_test/flutter_test.dart';
import 'package:moneymate/models/exchange_rate_model.dart';

void main() {
  group('ExchangeRateModel', () {
    test('berhasil membaca data JSON kurs USD ke IDR', () {
      final json = {
        'amount': 1,
        'base': 'USD',
        'date': '2026-11-05',
        'rates': {'IDR': 16500.0},
      };

      final result = ExchangeRateModel.fromJson(json);

      expect(result.baseCurrency, 'USD');
      expect(result.targetCurrency, 'IDR');
      expect(result.rate, 16500.0);
      expect(result.date, DateTime(2026, 11, 5));
    });
  });
}
