class ExpenseModel {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final String createdBy;
  final String notes;
  final bool isSynced;
  final DateTime updatedAt;

  ExpenseModel({
    required this.id, required this.title, required this.category,
    required this.amount, required this.date, this.createdBy = '',
    this.notes = '', this.isSynced = false, DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id, 'title': title, 'category': category, 'amount': amount,
    'date': date.toIso8601String(), 'createdBy': createdBy,
    'notes': notes, 'isSynced': isSynced, 'updatedAt': updatedAt.toIso8601String(),
  };

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
    id: json['id'] as String, title: json['title'] as String? ?? '',
    category: json['category'] as String? ?? '',
    amount: (json['amount'] as num?)?.toDouble() ?? 0,
    date: DateTime.parse(json['date'] as String),
    createdBy: json['createdBy'] as String? ?? '',
    notes: json['notes'] as String? ?? '',
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );
}
