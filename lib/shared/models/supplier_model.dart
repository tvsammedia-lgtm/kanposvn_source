class SupplierModel {
  final String id;
  final String code;
  final String name;
  final String taxCode;
  final String address;
  final String phone;
  final String email;
  final double currentDebt;
  final bool isSynced;
  final DateTime updatedAt;

  SupplierModel({
    required this.id, required this.code, required this.name,
    this.taxCode = '', this.address = '', this.phone = '', this.email = '',
    this.currentDebt = 0, this.isSynced = false, DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id, 'code': code, 'name': name, 'taxCode': taxCode,
    'address': address, 'phone': phone, 'email': email,
    'currentDebt': currentDebt, 'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
    id: json['id'] as String, code: json['code'] as String? ?? '',
    name: json['name'] as String? ?? '', taxCode: json['taxCode'] as String? ?? '',
    address: json['address'] as String? ?? '', phone: json['phone'] as String? ?? '',
    email: json['email'] as String? ?? '',
    currentDebt: (json['currentDebt'] as num?)?.toDouble() ?? 0,
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  SupplierModel copyWith({String? id, String? code, String? name, String? taxCode,
    String? address, String? phone, String? email, double? currentDebt, bool? isSynced}) {
    return SupplierModel(
      id: id ?? this.id, code: code ?? this.code, name: name ?? this.name,
      taxCode: taxCode ?? this.taxCode, address: address ?? this.address,
      phone: phone ?? this.phone, email: email ?? this.email,
      currentDebt: currentDebt ?? this.currentDebt, isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}
