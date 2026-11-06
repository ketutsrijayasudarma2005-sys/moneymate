import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/exchange_rate_model.dart';

class ExchangeRateService {
  static const String _baseUrl = 'api.frankfurter.app';

  Future<ExchangeRateModel> getUsdToIdrRate() async {
    final uri = Uri.https(_baseUrl, '/latest', {'from': 'USD', 'to': 'IDR'});

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData =
            jsonDecode(response.body) as Map<String, dynamic>;

        return ExchangeRateModel.fromJson(jsonData);
      }

      throw Exception('Gagal mengambil kurs. Status: ${response.statusCode}');
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengambil data kurs: $e');
    }
  }
}
