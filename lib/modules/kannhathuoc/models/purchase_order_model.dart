class PurchaseOrderItem {
  final String medicineId;
  final String medicineName;
  final String unit;
  final int quantity;
  final double importPrice;
  final double discount;
  final double totalPrice;
  final String batchNumber;
  final DateTime? expiryDate;

  PurchaseOrderItem({
    required this.medicineId,
    required this.medicineName,
    this.unit = 'Hộp',
    required this.quantity,
    required this.importPrice,
    this.discount = 0,
    required this.totalPrice,
    this.batchNumber = '',
    this.expiryDate,
  });

  Map<String, dynamic> toJson() => {
    'medicineId': medicineId,
    'medicineName': medicineName,
    'unit': unit,
    'quantity': quantity,
    'importPrice': importPrice,
    'discount': discount,
    'totalPrice': totalPrice,
    'batchNumber': batchNumber,
    'expiryDate': expiryDate?.toIso8601String(),
  };

  factory PurchaseOrderItem.fromJson(Map<String, dynamic> json) => PurchaseOrderItem(
    medicineId: json['medicineId'] as String? ?? '',
    medicineName: json['medicineName'] as String? ?? '',
    unit: json['unit'] as String? ?? 'Hộp',
    quantity: json['quantity'] as int? ?? 0,
    importPrice: (json['importPrice'] as num?)?.toDouble() ?? 0,
    discount: (json['discount'] as num?)?.toDouble() ?? 0,
    totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
    batchNumber: json['batchNumber'] as String? ?? '',
    expiryDate: json['expiryDate'] != null ? DateTime.parse(json['expiryDate'] as String) : null,
  );

  PurchaseOrderItem copyWith({
    String? medicineId,
    String? medicineName,
    String? unit,
    int? quantity,
    double? importPrice,
    double? discount,
    double? totalPrice,
    String? batchNumber,
    DateTime? expiryDate,
  }) {
    return PurchaseOrderItem(
      medicineId: medicineId ?? this.medicineId,
      medicineName: medicineName ?? this.medicineName,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      importPrice: importPrice ?? this.importPrice,
      discount: discount ?? this.discount,
      totalPrice: totalPrice ?? this.totalPrice,
      batchNumber: batchNumber ?? this.batchNumber,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }
}

class PurchaseOrderModel {
  final String id;
  final String orderCode;
  final String supplierId;
  final String supplierName;
  final DateTime importDate;
  final String createdBy;
  final double totalAmount;
  final double discountAmount;
  final double vatAmount;
  final double netAmount;
  final double paidAmount;
  final String paymentMethod;
  final String status;
  final List<PurchaseOrderItem> items;
  final bool isSynced;
  final DateTime updatedAt;

  PurchaseOrderModel({
    required this.id,
    required this.orderCode,
    this.supplierId = '',
    this.supplierName = '',
    required this.importDate,
    this.createdBy = '',
    this.totalAmount = 0,
    this.discountAmount = 0,
    this.vatAmount = 0,
    this.netAmount = 0,
    this.paidAmount = 0,
    this.paymentMethod = 'Tiền mặt',
    this.status = 'Nhập kho',
    this.items = const [],
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'orderCode': orderCode,
    'supplierId': supplierId,
    'supplierName': supplierName,
    'importDate': importDate.toIso8601String(),
    'createdBy': createdBy,
    'totalAmount': totalAmount,
    'discountAmount': discountAmount,
    'vatAmount': vatAmount,
    'netAmount': netAmount,
    'paidAmount': paidAmount,
    'paymentMethod': paymentMethod,
    'status': status,
    'items': items.map((e) => e.toJson()).toList(),
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory PurchaseOrderModel.fromJson(Map<String, dynamic> json) => PurchaseOrderModel(
    id: json['id'] as String,
    orderCode: json['orderCode'] as String? ?? '',
    supplierId: json['supplierId'] as String? ?? '',
    supplierName: json['supplierName'] as String? ?? '',
    importDate: DateTime.parse(json['importDate'] as String),
    createdBy: json['createdBy'] as String? ?? '',
    totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0,
    discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0,
    vatAmount: (json['vatAmount'] as num?)?.toDouble() ?? 0,
    netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0,
    paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0,
    paymentMethod: json['paymentMethod'] as String? ?? 'Tiền mặt',
    status: json['status'] as String? ?? 'Nhập kho',
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => PurchaseOrderItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  PurchaseOrderModel copyWith({
    String? id,
    String? orderCode,
    String? supplierId,
    String? supplierName,
    DateTime? importDate,
    String? createdBy,
    double? totalAmount,
    double? discountAmount,
    double? vatAmount,
    double? netAmount,
    double? paidAmount,
    String? paymentMethod,
    String? status,
    List<PurchaseOrderItem>? items,
    bool? isSynced,
  }) {
    return PurchaseOrderModel(
      id: id ?? this.id,
      orderCode: orderCode ?? this.orderCode,
      supplierId: supplierId ?? this.supplierId,
      supplierName: supplierName ?? this.supplierName,
      importDate: importDate ?? this.importDate,
      createdBy: createdBy ?? this.createdBy,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      vatAmount: vatAmount ?? this.vatAmount,
      netAmount: netAmount ?? this.netAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      items: items ?? this.items,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}
