class NongSanSupplier {
  final String id;
  final String code; // Mã nhà cung cấp
  final String name;
  final String phone;
  final String address;
  final String taxId; // CCCD/MST nếu cần
  final String contactPerson; // Người liên hệ
  final String customerType; // Loại nhà cung cấp (Hộ nông dân, Thương lái, Công ty...)
  final double creditLimit; // Hạn mức công nợ
  final int paymentTermDays; // Điều khoản thanh toán (ngày)
  final double debtAmount; // Dư nợ hiện tại
  final double totalPurchased; // Tổng mua
  final double totalPaid; // Đã thanh toán
  final DateTime updatedAt;

  NongSanSupplier({
    required this.id,
    required this.name,
    this.phone = '',
    this.address = '',
    this.taxId = '',
    this.contactPerson = '',
    this.customerType = 'Hộ nông dân',
    this.creditLimit = 0,
    this.paymentTermDays = 0,
    this.debtAmount = 0,
    this.totalPurchased = 0,
    this.totalPaid = 0,
    DateTime? updatedAt,
    String? code,
  })  : code = code ?? id,
        updatedAt = updatedAt ?? DateTime.now();

  /// Dư nợ còn lại tính theo nghiệp vụ: Dư đầu + Mua - Đã thanh toán (§14).
  double get outstandingDebt => debtAmount;

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'phone': phone,
        'address': address,
        'taxId': taxId,
        'contactPerson': contactPerson,
        'customerType': customerType,
        'creditLimit': creditLimit,
        'paymentTermDays': paymentTermDays,
        'debtAmount': debtAmount,
        'totalPurchased': totalPurchased,
        'totalPaid': totalPaid,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanSupplier.fromJson(Map<String, dynamic> json) =>
      NongSanSupplier(
        id: json['id'] ?? '',
        code: json['code'],
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        address: json['address'] ?? '',
        taxId: json['taxId'] ?? '',
        contactPerson: json['contactPerson'] ?? '',
        customerType: json['customerType'] ?? 'Hộ nông dân',
        creditLimit: (json['creditLimit'] as num?)?.toDouble() ?? 0,
        paymentTermDays: json['paymentTermDays'] ?? 0,
        debtAmount: (json['debtAmount'] as num?)?.toDouble() ?? 0,
        totalPurchased: (json['totalPurchased'] as num?)?.toDouble() ?? 0,
        totalPaid: (json['totalPaid'] as num?)?.toDouble() ?? 0,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanCustomer {
  final String id;
  final String code; // Mã khách hàng
  final String name;
  final String phone;
  final String address;
  final String company; // Công ty
  final String taxId; // MST
  final String contactPerson; // Người liên hệ
  final double creditLimit; // Hạn mức tín dụng
  final int paymentTermDays; // Thời hạn thanh toán
  final double debtAmount; // Công nợ
  final double totalSales; // Tổng doanh số
  final double totalCollected; // Đã thu
  final DateTime updatedAt;

  NongSanCustomer({
    required this.id,
    required this.name,
    this.phone = '',
    this.address = '',
    this.company = '',
    this.taxId = '',
    this.contactPerson = '',
    this.creditLimit = 0,
    this.paymentTermDays = 0,
    this.debtAmount = 0,
    this.totalSales = 0,
    this.totalCollected = 0,
    DateTime? updatedAt,
    String? code,
  })  : code = code ?? id,
        updatedAt = updatedAt ?? DateTime.now();

  /// Còn phải thu = Dư đầu + Doanh số bán chịu - Đã thu - Hàng trả lại (§15).
  double get outstandingReceivable => debtAmount;

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'phone': phone,
        'address': address,
        'company': company,
        'taxId': taxId,
        'contactPerson': contactPerson,
        'creditLimit': creditLimit,
        'paymentTermDays': paymentTermDays,
        'debtAmount': debtAmount,
        'totalSales': totalSales,
        'totalCollected': totalCollected,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanCustomer.fromJson(Map<String, dynamic> json) =>
      NongSanCustomer(
        id: json['id'] ?? '',
        code: json['code'],
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        address: json['address'] ?? '',
        company: json['company'] ?? '',
        taxId: json['taxId'] ?? '',
        contactPerson: json['contactPerson'] ?? '',
        creditLimit: (json['creditLimit'] as num?)?.toDouble() ?? 0,
        paymentTermDays: json['paymentTermDays'] ?? 0,
        debtAmount: (json['debtAmount'] as num?)?.toDouble() ?? 0,
        totalSales: (json['totalSales'] as num?)?.toDouble() ?? 0,
        totalCollected: (json['totalCollected'] as num?)?.toDouble() ?? 0,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}