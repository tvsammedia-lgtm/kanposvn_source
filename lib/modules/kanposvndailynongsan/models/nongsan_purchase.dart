class NongSanPurchaseOrder {
  final String id;
  final String orderNumber;
  final String supplierId;
  final String productId;
  final String warehouseId; // Kho nhập dự kiến
  final DateTime orderDate;
  final double expectedQuantity; // Số lượng dự kiến
  final double expectedPrice; // Giá dự kiến
  final String status; // DRAFT / APPROVED / CANCELLED (§48)
  final String note;
  final String assignee; // Người phụ trách
  final DateTime updatedAt;

  NongSanPurchaseOrder({
    required this.id,
    required this.supplierId,
    required this.productId,
    this.warehouseId = '',
    DateTime? orderDate,
    this.expectedQuantity = 0,
    this.expectedPrice = 0,
    this.status = 'DRAFT',
    this.note = '',
    this.assignee = '',
    DateTime? updatedAt,
    String? orderNumber,
  })  : orderNumber = orderNumber ??
            'PO-${(orderDate ?? DateTime.now()).millisecondsSinceEpoch.toString().substring(6)}',
        orderDate = orderDate ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderNumber': orderNumber,
        'supplierId': supplierId,
        'productId': productId,
        'warehouseId': warehouseId,
        'orderDate': orderDate.toIso8601String(),
        'expectedQuantity': expectedQuantity,
        'expectedPrice': expectedPrice,
        'status': status,
        'note': note,
        'assignee': assignee,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanPurchaseOrder.fromJson(Map<String, dynamic> json) =>
      NongSanPurchaseOrder(
        id: json['id'] ?? '',
        orderNumber: json['orderNumber'],
        supplierId: json['supplierId'] ?? '',
        productId: json['productId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        orderDate: json['orderDate'] != null
            ? DateTime.parse(json['orderDate'])
            : DateTime.now(),
        expectedQuantity: (json['expectedQuantity'] as num?)?.toDouble() ?? 0,
        expectedPrice: (json['expectedPrice'] as num?)?.toDouble() ?? 0,
        status: json['status'] ?? 'DRAFT',
        note: json['note'] ?? '',
        assignee: json['assignee'] ?? '',
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanWeighingTicket {
  final String id;
  final String ticketNumber;
  final String supplierId;
  final String vehiclePlate;
  final String driverName;
  final double grossWeight; // Trọng lượng xe vào (có hàng)
  final double tareWeight; // Trọng lượng xe ra (xe không)
  final double packagingWeight; // Trọng lượng bì
  final DateTime updatedAt;

  NongSanWeighingTicket({
    required this.id,
    required this.ticketNumber,
    required this.supplierId,
    this.vehiclePlate = '',
    this.driverName = '',
    this.grossWeight = 0,
    this.tareWeight = 0,
    this.packagingWeight = 0,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  /// §9.2 Công thức: TL hàng = TL xe có hàng - TL xe không hàng - TL bì.
  double get netWeight => grossWeight - tareWeight - packagingWeight;

  Map<String, dynamic> toJson() => {
        'id': id,
        'ticketNumber': ticketNumber,
        'supplierId': supplierId,
        'vehiclePlate': vehiclePlate,
        'driverName': driverName,
        'grossWeight': grossWeight,
        'tareWeight': tareWeight,
        'packagingWeight': packagingWeight,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanWeighingTicket.fromJson(Map<String, dynamic> json) =>
      NongSanWeighingTicket(
        id: json['id'] ?? '',
        ticketNumber: json['ticketNumber'] ?? '',
        supplierId: json['supplierId'] ?? '',
        vehiclePlate: json['vehiclePlate'] ?? '',
        driverName: json['driverName'] ?? '',
        grossWeight: (json['grossWeight'] as num?)?.toDouble() ?? 0,
        tareWeight: (json['tareWeight'] as num?)?.toDouble() ?? 0,
        packagingWeight: (json['packagingWeight'] as num?)?.toDouble() ?? 0,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanQualityInspection {
  final String id;
  final String weighingTicketId;
  final String productId;
  final double humidity;
  final double impurity;
  final double deductedWeight; // Khối lượng trừ do chất lượng kém
  final double adjustedPrice; // Giá điều chỉnh sau kiểm phẩm
  final String grade; // Hạng đạt được sau kiểm phẩm
  final DateTime updatedAt;

  NongSanQualityInspection({
    required this.id,
    required this.weighingTicketId,
    required this.productId,
    this.humidity = 0,
    this.impurity = 0,
    this.deductedWeight = 0,
    this.adjustedPrice = 0,
    this.grade = '',
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'weighingTicketId': weighingTicketId,
        'productId': productId,
        'humidity': humidity,
        'impurity': impurity,
        'deductedWeight': deductedWeight,
        'adjustedPrice': adjustedPrice,
        'grade': grade,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanQualityInspection.fromJson(Map<String, dynamic> json) =>
      NongSanQualityInspection(
        id: json['id'] ?? '',
        weighingTicketId: json['weighingTicketId'] ?? '',
        productId: json['productId'] ?? '',
        humidity: (json['humidity'] as num?)?.toDouble() ?? 0,
        impurity: (json['impurity'] as num?)?.toDouble() ?? 0,
        deductedWeight: (json['deductedWeight'] as num?)?.toDouble() ?? 0,
        adjustedPrice: (json['adjustedPrice'] as num?)?.toDouble() ?? 0,
        grade: json['grade'] ?? '',
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanPurchaseReceipt {
  final String id;
  final String receiptNumber;
  final String supplierId;
  final String weighingTicketId;
  final String qualityInspectionId;
  final String productId;
  final String warehouseId; // Kho nhập
  final String lotId; // Lô hàng được tạo từ phiếu nhập
  final double finalQuantity; // Số lượng sau khi cân và trừ hao
  final double unitPrice; // Đơn giá mua thực tế
  final double totalAmount; // Tiền hàng (§9.4)
  final double shippingFee; // Phí vận chuyển
  final double loadingFee; // Phí bốc xếp
  final double processingFee; // Phí sơ chế
  final double vatRate; // Thuế suất GTGT đầu vào (%)
  double get inputTax => totalAmount * vatRate;
  final String status; // §48: POSTED khi đã nhập kho
  final DateTime updatedAt;

  NongSanPurchaseReceipt({
    required this.id,
    required this.supplierId,
    this.weighingTicketId = '',
    this.qualityInspectionId = '',
    required this.productId,
    this.warehouseId = '',
    this.lotId = '',
    this.finalQuantity = 0,
    this.unitPrice = 0,
    this.shippingFee = 0,
    this.loadingFee = 0,
    this.processingFee = 0,
    this.vatRate = 0,
    this.status = 'POSTED',
    double? totalAmount,
    DateTime? updatedAt,
    String? receiptNumber,
  })  : totalAmount = totalAmount ?? (finalQuantity * unitPrice),
        receiptNumber = receiptNumber ?? _generateReceiptNumber(updatedAt),
        updatedAt = updatedAt ?? DateTime.now();

  static String _generateReceiptNumber(DateTime? at) {
    final t = at ?? DateTime.now();
    return 'PN-${t.year}${t.month.toString().padLeft(2, '0')}${t.day.toString().padLeft(2, '0')}';
  }

  /// §9.4 Tổng = Tiền hàng + Phí vận chuyển + Phí bốc xếp + Phí sơ chế.
  double get grandTotal => totalAmount + shippingFee + loadingFee + processingFee;

  Map<String, dynamic> toJson() => {
        'id': id,
        'receiptNumber': receiptNumber,
        'supplierId': supplierId,
        'weighingTicketId': weighingTicketId,
        'qualityInspectionId': qualityInspectionId,
        'productId': productId,
        'warehouseId': warehouseId,
        'lotId': lotId,
        'finalQuantity': finalQuantity,
        'unitPrice': unitPrice,
        'totalAmount': totalAmount,
        'shippingFee': shippingFee,
        'loadingFee': loadingFee,
        'processingFee': processingFee,
        'vatRate': vatRate,
        'status': status,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanPurchaseReceipt.fromJson(Map<String, dynamic> json) =>
      NongSanPurchaseReceipt(
        id: json['id'] ?? '',
        receiptNumber: json['receiptNumber'],
        supplierId: json['supplierId'] ?? '',
        weighingTicketId: json['weighingTicketId'] ?? '',
        qualityInspectionId: json['qualityInspectionId'] ?? '',
        productId: json['productId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        lotId: json['lotId'] ?? '',
        finalQuantity: (json['finalQuantity'] as num?)?.toDouble() ?? 0,
        unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
        totalAmount: (json['totalAmount'] as num?)?.toDouble(),
        shippingFee: (json['shippingFee'] as num?)?.toDouble() ?? 0,
        loadingFee: (json['loadingFee'] as num?)?.toDouble() ?? 0,
        processingFee: (json['processingFee'] as num?)?.toDouble() ?? 0,
        vatRate: (json['vatRate'] as num?)?.toDouble() ?? 0,
        status: json['status'] ?? 'POSTED',
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}