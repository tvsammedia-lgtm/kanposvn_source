class CustomerModel {
  final String id;
  final String code;
  final String fullName;
  final String phone;
  final String address;
  final String customerType;
  final int rewardPoints;
  final double currentDebt;
  final double totalSpent;
  final bool isSynced;
  final DateTime updatedAt;

  CustomerModel({
    required this.id, required this.code, required this.fullName,
    this.phone = '', this.address = '', this.customerType = 'Khách lẻ',
    this.rewardPoints = 0, this.currentDebt = 0, this.totalSpent = 0,
    this.isSynced = false, DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id, 'code': code, 'fullName': fullName, 'phone': phone,
    'address': address, 'customerType': customerType,
    'rewardPoints': rewardPoints, 'currentDebt': currentDebt,
    'totalSpent': totalSpent, 'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json['id'] as String, code: json['code'] as String? ?? '',
    fullName: json['fullName'] as String? ?? '', phone: json['phone'] as String? ?? '',
    address: json['address'] as String? ?? '', customerType: json['customerType'] as String? ?? 'Khách lẻ',
    rewardPoints: json['rewardPoints'] as int? ?? 0,
    currentDebt: (json['currentDebt'] as num?)?.toDouble() ?? 0,
    totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0,
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  CustomerModel copyWith({String? id, String? code, String? fullName, String? phone,
    String? address, String? customerType, int? rewardPoints,
    double? currentDebt, double? totalSpent, bool? isSynced}) {
    return CustomerModel(
      id: id ?? this.id, code: code ?? this.code, fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone, address: address ?? this.address,
      customerType: customerType ?? this.customerType, rewardPoints: rewardPoints ?? this.rewardPoints,
      currentDebt: currentDebt ?? this.currentDebt, totalSpent: totalSpent ?? this.totalSpent,
      isSynced: isSynced ?? this.isSynced, updatedAt: DateTime.now(),
    );
  }
}
