class NongSanProduct {
  final String id;
  final String code;
  final String name;
  final String sku; // SKU
  final String category; // Nhóm hàng (Nông sản, Lâm sản, Thủy sản, Hải sản)
  final String unit; // Kg, Tấn, Bao, Kiện...
  final String unitPurchase; // Đơn vị mua
  final String unitSale; // Đơn vị bán
  final double referencePrice; // Giá mua tham khảo (§8.1)
  final double salePriceRef; // Giá bán tham khảo
  final DateTime updatedAt;

  NongSanProduct({
    required this.id,
    required this.code,
    required this.name,
    this.sku = '',
    this.category = 'Nông sản',
    this.unit = 'Kg',
    this.unitPurchase = '',
    this.unitSale = '',
    this.referencePrice = 0,
    this.salePriceRef = 0,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'sku': sku,
        'category': category,
        'unit': unit,
        'unitPurchase': unitPurchase,
        'unitSale': unitSale,
        'referencePrice': referencePrice,
        'salePriceRef': salePriceRef,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanProduct.fromJson(Map<String, dynamic> json) => NongSanProduct(
        id: json['id'] ?? '',
        code: json['code'] ?? '',
        name: json['name'] ?? '',
        sku: json['sku'] ?? '',
        category: json['category'] ?? 'Nông sản',
        unit: json['unit'] ?? 'Kg',
        unitPurchase: json['unitPurchase'] ?? '',
        unitSale: json['unitSale'] ?? '',
        referencePrice: (json['referencePrice'] as num?)?.toDouble() ?? 0,
        salePriceRef: (json['salePriceRef'] as num?)?.toDouble() ?? 0,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanProductQuality {
  final String id;
  final String productId;
  final String size;
  final String grade; // Hạng / Grade
  final double humidity; // Độ ẩm %
  final double impurityRate; // Tỷ lệ tạp chất %
  final double lossRate; // Tỷ lệ hao hụt %
  final DateTime updatedAt;

  NongSanProductQuality({
    required this.id,
    required this.productId,
    this.size = '',
    this.grade = '',
    this.humidity = 0,
    this.impurityRate = 0,
    this.lossRate = 0,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'size': size,
        'grade': grade,
        'humidity': humidity,
        'impurityRate': impurityRate,
        'lossRate': lossRate,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanProductQuality.fromJson(Map<String, dynamic> json) =>
      NongSanProductQuality(
        id: json['id'] ?? '',
        productId: json['productId'] ?? '',
        size: json['size'] ?? '',
        grade: json['grade'] ?? '',
        humidity: (json['humidity'] as num?)?.toDouble() ?? 0,
        impurityRate: (json['impurityRate'] as num?)?.toDouble() ?? 0,
        lossRate: (json['lossRate'] as num?)?.toDouble() ?? 0,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanLot {
  final String id;
  final String lotId;
  final String productId;
  final String supplierId;
  final String warehouseId;
  final DateTime importDate;
  final double initialQuantity;
  final double currentQuantity;
  final double costPrice; // Giá vốn (đã phân bổ chi phí thu mua §9.4)
  final String grade; // Chất lượng / Grade
  final String size;
  final DateTime? expiryDate; // Hạn sử dụng nếu có
  final DateTime updatedAt;

  NongSanLot({
    required this.id,
    required this.lotId,
    required this.productId,
    required this.supplierId,
    required this.warehouseId,
    required this.importDate,
    this.initialQuantity = 0,
    this.currentQuantity = 0,
    this.costPrice = 0,
    this.grade = '',
    this.size = '',
    this.expiryDate,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'lotId': lotId,
        'productId': productId,
        'supplierId': supplierId,
        'warehouseId': warehouseId,
        'importDate': importDate.toIso8601String(),
        'initialQuantity': initialQuantity,
        'currentQuantity': currentQuantity,
        'costPrice': costPrice,
        'grade': grade,
        'size': size,
        'expiryDate': expiryDate?.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanLot.fromJson(Map<String, dynamic> json) => NongSanLot(
        id: json['id'] ?? '',
        lotId: json['lotId'] ?? '',
        productId: json['productId'] ?? '',
        supplierId: json['supplierId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        importDate: json['importDate'] != null
            ? DateTime.parse(json['importDate'])
            : DateTime.now(),
        initialQuantity: (json['initialQuantity'] as num?)?.toDouble() ?? 0,
        currentQuantity: (json['currentQuantity'] as num?)?.toDouble() ?? 0,
        costPrice: (json['costPrice'] as num?)?.toDouble() ?? 0,
        grade: json['grade'] ?? '',
        size: json['size'] ?? '',
        expiryDate: json['expiryDate'] != null
            ? DateTime.parse(json['expiryDate'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}