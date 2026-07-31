class VlxdProductModel {
  final String id;
  final String code;
  final String name;
  final String category;
  final String unit;
  final double wholesalePrice;
  final double retailPrice;
  final int stockQuantity;
  final bool isSynced;
  final DateTime updatedAt;

  VlxdProductModel({
    required this.id,
    required this.code,
    required this.name,
    this.category = '',
    this.unit = 'Cái',
    this.wholesalePrice = 0,
    this.retailPrice = 0,
    this.stockQuantity = 0,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'category': category,
    'unit': unit,
    'wholesalePrice': wholesalePrice,
    'retailPrice': retailPrice,
    'stockQuantity': stockQuantity,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory VlxdProductModel.fromJson(Map<String, dynamic> json) => VlxdProductModel(
    id: json['id'] as String,
    code: json['code'] as String? ?? '',
    name: json['name'] as String? ?? '',
    category: json['category'] as String? ?? '',
    unit: json['unit'] as String? ?? 'Cái',
    wholesalePrice: (json['wholesalePrice'] as num?)?.toDouble() ?? 0,
    retailPrice: (json['retailPrice'] as num?)?.toDouble() ?? 0,
    stockQuantity: json['stockQuantity'] as int? ?? 0,
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  VlxdProductModel copyWith({
    String? id,
    String? code,
    String? name,
    String? category,
    String? unit,
    double? wholesalePrice,
    double? retailPrice,
    int? stockQuantity,
    bool? isSynced,
  }) {
    return VlxdProductModel(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      wholesalePrice: wholesalePrice ?? this.wholesalePrice,
      retailPrice: retailPrice ?? this.retailPrice,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}
