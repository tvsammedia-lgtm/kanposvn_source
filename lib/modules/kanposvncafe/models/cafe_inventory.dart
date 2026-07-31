enum InventoryType {
  nguyenLieu('Nguyên liệu'),
  thanhPham('Thành phẩm');

  final String label;
  const InventoryType(this.label);
}

enum InventoryTransactionType {
  nhapKho('Nhập kho'),
  xuatKho('Xuất kho'),
  tuDongTruBanHang('Tự động trừ bán hàng'),
  dieuChinh('Điều chỉnh kiểm kê');

  final String label;
  const InventoryTransactionType(this.label);
}

class InventoryItem {
  final String id;
  final String code;
  final String name;
  final InventoryType type;
  final String unit; // g, ml, kg, hộp, chai, gói...
  final double currentStock;
  final double minStock; // Định mức tối thiểu để cảnh báo
  final double costPrice; // Giá vốn nhập vào
  final String supplierId;
  final DateTime updatedAt;

  InventoryItem({
    required this.id,
    required this.code,
    required this.name,
    this.type = InventoryType.nguyenLieu,
    required this.unit,
    required this.currentStock,
    this.minStock = 10,
    this.costPrice = 0,
    this.supplierId = '',
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  bool get isLowStock => currentStock <= minStock;

  InventoryItem copyWith({
    String? name,
    InventoryType? type,
    String? unit,
    double? currentStock,
    double? minStock,
    double? costPrice,
    String? supplierId,
    DateTime? updatedAt,
  }) {
    return InventoryItem(
      id: id,
      code: code,
      name: name ?? this.name,
      type: type ?? this.type,
      unit: unit ?? this.unit,
      currentStock: currentStock ?? this.currentStock,
      minStock: minStock ?? this.minStock,
      costPrice: costPrice ?? this.costPrice,
      supplierId: supplierId ?? this.supplierId,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'type': type.name,
    'unit': unit,
    'currentStock': currentStock,
    'minStock': minStock,
    'costPrice': costPrice,
    'supplierId': supplierId,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory InventoryItem.fromJson(Map<String, dynamic> json) => InventoryItem(
    id: json['id'] ?? '',
    code: json['code'] ?? '',
    name: json['name'] ?? '',
    type: InventoryType.values.firstWhere(
      (e) => e.name == json['type'],
      orElse: () => InventoryType.nguyenLieu,
    ),
    unit: json['unit'] ?? 'g',
    currentStock: (json['currentStock'] as num?)?.toDouble() ?? 0,
    minStock: (json['minStock'] as num?)?.toDouble() ?? 10,
    costPrice: (json['costPrice'] as num?)?.toDouble() ?? 0,
    supplierId: json['supplierId'] ?? '',
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now(),
  );
}

class InventoryTransaction {
  final String id;
  final String inventoryItemId;
  final String inventoryItemName;
  final InventoryTransactionType type;
  final double quantityChange;
  final double oldStock;
  final double newStock;
  final String unit;
  final String note;
  final String performerName;
  final DateTime timestamp;

  InventoryTransaction({
    required this.id,
    required this.inventoryItemId,
    required this.inventoryItemName,
    required this.type,
    required this.quantityChange,
    required this.oldStock,
    required this.newStock,
    required this.unit,
    this.note = '',
    this.performerName = 'Hệ thống',
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'inventoryItemId': inventoryItemId,
    'inventoryItemName': inventoryItemName,
    'type': type.name,
    'quantityChange': quantityChange,
    'oldStock': oldStock,
    'newStock': newStock,
    'unit': unit,
    'note': note,
    'performerName': performerName,
    'timestamp': timestamp.toIso8601String(),
  };

  factory InventoryTransaction.fromJson(Map<String, dynamic> json) =>
      InventoryTransaction(
        id: json['id'] ?? '',
        inventoryItemId: json['inventoryItemId'] ?? '',
        inventoryItemName: json['inventoryItemName'] ?? '',
        type: InventoryTransactionType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => InventoryTransactionType.nhapKho,
        ),
        quantityChange: (json['quantityChange'] as num?)?.toDouble() ?? 0,
        oldStock: (json['oldStock'] as num?)?.toDouble() ?? 0,
        newStock: (json['newStock'] as num?)?.toDouble() ?? 0,
        unit: json['unit'] ?? 'g',
        note: json['note'] ?? '',
        performerName: json['performerName'] ?? 'Hệ thống',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}
