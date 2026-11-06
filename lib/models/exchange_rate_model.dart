class ExchangeRateModel {
  final String baseCurrency;
  final String targetCurrency;
  final double rate;
  final DateTime date;

  const ExchangeRateModel({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.rate,
    required this.date,
  });

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    final rates = json['rates'] as Map<String, dynamic>;

    return ExchangeRateModel(
      baseCurrency: json['base'] as String,
      targetCurrency: 'IDR',
      rate: (rates['IDR'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );
  }
}
