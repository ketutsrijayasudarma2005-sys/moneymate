class TransactionModel {
  final String? id;
  final String title;
  final double amount;
  final String type;
  final String category;
  final DateTime transactionDate;
  final String? note;

  const TransactionModel({
    this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.transactionDate,
    this.note,
  });

  // Mengubah data dari Supabase menjadi objek TransactionModel.
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id']?.toString(),
      title: map['title'] as String,
      amount: (map['amount'] as num).toDouble(),
      type: map['type'] as String,
      category: map['category'] as String,
      transactionDate: DateTime.parse(map['transaction_date'].toString()),
      note: map['note'] as String?,
    );
  }

  // Mengubah objek TransactionModel menjadi data untuk Supabase.
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'amount': amount,
      'type': type,
      'category': category,
      'transaction_date': transactionDate.toIso8601String(),
      'note': note,
    };
  }

  // Membuat salinan objek dengan perubahan pada data tertentu.
  TransactionModel copyWith({
    String? id,
    String? title,
    double? amount,
    String? type,
    String? category,
    DateTime? transactionDate,
    String? note,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      category: category ?? this.category,
      transactionDate: transactionDate ?? this.transactionDate,
      note: note ?? this.note,
    );
  }
}
