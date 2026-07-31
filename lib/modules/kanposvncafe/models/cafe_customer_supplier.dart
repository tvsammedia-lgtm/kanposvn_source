enum CustomerTier {
  dong('Đồng'),
  bac('Bạc'),
  vang('Vàng'),
  kimCuong('Kim Cương');

  final String label;
  const CustomerTier(this.label);
}

class CafeCustomer {
  final String id;
  final String name;
  final String phone;
  final int rewardPoints;
  final String birthday;
  final CustomerTier tier;
  final double totalSpent;
  final double debtAmount; // Công nợ nếu bán chịu
  final DateTime updatedAt;

  CafeCustomer({
    required this.id,
    required this.name,
    required this.phone,
    this.rewardPoints = 0,
    this.birthday = '',
    this.tier = CustomerTier.dong,
    this.totalSpent = 0,
    this.debtAmount = 0,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  CafeCustomer copyWith({
    String? name,
    String? phone,
    int? rewardPoints,
    String? birthday,
    CustomerTier? tier,
    double? totalSpent,
    double? debtAmount,
    DateTime? updatedAt,
  }) {
    return CafeCustomer(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      birthday: birthday ?? this.birthday,
      tier: tier ?? this.tier,
      totalSpent: totalSpent ?? this.totalSpent,
      debtAmount: debtAmount ?? this.debtAmount,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'rewardPoints': rewardPoints,
    'birthday': birthday,
    'tier': tier.name,
    'totalSpent': totalSpent,
    'debtAmount': debtAmount,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory CafeCustomer.fromJson(Map<String, dynamic> json) => CafeCustomer(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    phone: json['phone'] ?? '',
    rewardPoints: json['rewardPoints'] ?? 0,
    birthday: json['birthday'] ?? '',
    tier: CustomerTier.values.firstWhere(
      (e) => e.name == json['tier'],
      orElse: () => CustomerTier.dong,
    ),
    totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0,
    debtAmount: (json['debtAmount'] as num?)?.toDouble() ?? 0,
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now(),
  );
}

class CafeSupplier {
  final String id;
  final String name;
  final String phone;
  final String address;
  final double debtAmount; // Công nợ phải trả cho NCC
  final String note;
  final DateTime updatedAt;

  CafeSupplier({
    required this.id,
    required this.name,
    this.phone = '',
    this.address = '',
    this.debtAmount = 0,
    this.note = '',
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  CafeSupplier copyWith({
    String? name,
    String? phone,
    String? address,
    double? debtAmount,
    String? note,
    DateTime? updatedAt,
  }) {
    return CafeSupplier(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      debtAmount: debtAmount ?? this.debtAmount,
      note: note ?? this.note,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'address': address,
    'debtAmount': debtAmount,
    'note': note,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory CafeSupplier.fromJson(Map<String, dynamic> json) => CafeSupplier(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    phone: json['phone'] ?? '',
    address: json['address'] ?? '',
    debtAmount: (json['debtAmount'] as num?)?.toDouble() ?? 0,
    note: json['note'] ?? '',
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now(),
  );
}
