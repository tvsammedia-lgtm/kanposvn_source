class MedicineModel {
  final String id;
  final String code;
  final String barcode;
  final String name;
  final String activeIngredient;
  final String dosage;
  final String packaging;
  final String unit;
  final String manufacturer;
  final String country;
  final String category;
  final bool isOtc;
  final double costPrice;
  final double sellingPrice;
  final double vat;
  final DateTime? expiryDate;
  final String registrationNumber;
  final int stockQuantity;
  final int minStockThreshold;
  final bool isSynced;
  final DateTime updatedAt;

  MedicineModel({
    required this.id,
    required this.code,
    this.barcode = '',
    required this.name,
    this.activeIngredient = '',
    this.dosage = '',
    this.packaging = '',
    this.unit = 'Hộp',
    this.manufacturer = '',
    this.country = '',
    this.category = '',
    this.isOtc = true,
    this.costPrice = 0,
    this.sellingPrice = 0,
    this.vat = 0,
    this.expiryDate,
    this.registrationNumber = '',
    this.stockQuantity = 0,
    this.minStockThreshold = 10,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'barcode': barcode,
    'name': name,
    'activeIngredient': activeIngredient,
    'dosage': dosage,
    'packaging': packaging,
    'unit': unit,
    'manufacturer': manufacturer,
    'country': country,
    'category': category,
    'isOtc': isOtc,
    'costPrice': costPrice,
    'sellingPrice': sellingPrice,
    'vat': vat,
    'expiryDate': expiryDate?.toIso8601String(),
    'registrationNumber': registrationNumber,
    'stockQuantity': stockQuantity,
    'minStockThreshold': minStockThreshold,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    id: json['id'] as String,
    code: json['code'] as String? ?? '',
    barcode: json['barcode'] as String? ?? '',
    name: json['name'] as String? ?? '',
    activeIngredient: json['activeIngredient'] as String? ?? '',
    dosage: json['dosage'] as String? ?? '',
    packaging: json['packaging'] as String? ?? '',
    unit: json['unit'] as String? ?? 'Hộp',
    manufacturer: json['manufacturer'] as String? ?? '',
    country: json['country'] as String? ?? '',
    category: json['category'] as String? ?? '',
    isOtc: json['isOtc'] as bool? ?? true,
    costPrice: (json['costPrice'] as num?)?.toDouble() ?? 0,
    sellingPrice: (json['sellingPrice'] as num?)?.toDouble() ?? 0,
    vat: (json['vat'] as num?)?.toDouble() ?? 0,
    expiryDate: json['expiryDate'] != null ? DateTime.parse(json['expiryDate'] as String) : null,
    registrationNumber: json['registrationNumber'] as String? ?? '',
    stockQuantity: json['stockQuantity'] as int? ?? 0,
    minStockThreshold: json['minStockThreshold'] as int? ?? 10,
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  MedicineModel copyWith({
    String? id,
    String? code,
    String? barcode,
    String? name,
    String? activeIngredient,
    String? dosage,
    String? packaging,
    String? unit,
    String? manufacturer,
    String? country,
    String? category,
    bool? isOtc,
    double? costPrice,
    double? sellingPrice,
    double? vat,
    DateTime? expiryDate,
    String? registrationNumber,
    int? stockQuantity,
    int? minStockThreshold,
    bool? isSynced,
  }) {
    return MedicineModel(
      id: id ?? this.id,
      code: code ?? this.code,
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      activeIngredient: activeIngredient ?? this.activeIngredient,
      dosage: dosage ?? this.dosage,
      packaging: packaging ?? this.packaging,
      unit: unit ?? this.unit,
      manufacturer: manufacturer ?? this.manufacturer,
      country: country ?? this.country,
      category: category ?? this.category,
      isOtc: isOtc ?? this.isOtc,
      costPrice: costPrice ?? this.costPrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      vat: vat ?? this.vat,
      expiryDate: expiryDate ?? this.expiryDate,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      minStockThreshold: minStockThreshold ?? this.minStockThreshold,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}
