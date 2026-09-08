/// Phiếu thu / phiếu chi tiền (§16).
class NongSanPayment {
  final String id;
  final String paymentNumber;
  final String kind; // CUSTOMER_RECEIPT (Phiếu thu) / SUPPLIER_PAYMENT (Phiếu chi)
  final String direction; // IN (thu) / OUT (chi)
  final String method; // CASH / BANK
  final String partnerId; // Khách hàng (thu) hoặc nhà cung cấp (chi)
  final double amount;
  final String referenceId; // Liên kết Invoice/Receipt
  final String note;
  final DateTime timestamp;

  NongSanPayment({
    required this.id,
    required this.kind,
    required this.partnerId,
    String? direction,
    this.method = 'CASH',
    this.amount = 0,
    this.referenceId = '',
    this.note = '',
    DateTime? timestamp,
    String? paymentNumber,
  })  : direction = (direction == null || direction.isEmpty)
            ? (kind == 'SUPPLIER_PAYMENT' ? 'OUT' : 'IN')
            : direction,
        timestamp = timestamp ?? DateTime.now(),
        paymentNumber = paymentNumber ??
            'PT-${_stamp(DateTime.now())}';

  static String _stamp(DateTime t) =>
      '${t.year}${t.month.toString().padLeft(2, '0')}${t.day.toString().padLeft(2, '0')}';

  Map<String, dynamic> toJson() => {
        'id': id,
        'paymentNumber': paymentNumber,
        'kind': kind,
        'direction': direction,
        'method': method,
        'partnerId': partnerId,
        'amount': amount,
        'referenceId': referenceId,
        'note': note,
        'timestamp': timestamp.toIso8601String(),
      };

  factory NongSanPayment.fromJson(Map<String, dynamic> json) => NongSanPayment(
        id: json['id'] ?? '',
        paymentNumber: json['paymentNumber'],
        kind: json['kind'] ?? 'CUSTOMER_RECEIPT',
        partnerId: json['partnerId'] ?? '',
        direction: json['direction'],
        method: json['method'] ?? 'CASH',
        amount: (json['amount'] as num?)?.toDouble() ?? 0,
        referenceId: json['referenceId'] ?? '',
        note: json['note'] ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}

/// Chi phí (§27): Vận chuyển, Bốc xếp, Kho bãi, Điện, Nước, Nhân công, Sơ chế...
class NongSanExpense {
  final String id;
  final String category;
  final double amount;
  final String accountCode; // Tài khoản chi phí (641/642...)
  final String note;
  final DateTime timestamp;

  NongSanExpense({
    required this.id,
    required this.category,
    this.amount = 0,
    this.accountCode = '642',
    this.note = '',
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'amount': amount,
        'accountCode': accountCode,
        'note': note,
        'timestamp': timestamp.toIso8601String(),
      };

  factory NongSanExpense.fromJson(Map<String, dynamic> json) => NongSanExpense(
        id: json['id'] ?? '',
        category: json['category'] ?? '',
        amount: (json['amount'] as num?)?.toDouble() ?? 0,
        accountCode: json['accountCode'] ?? '642',
        note: json['note'] ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}