class NongSanWarehouse {
  final String id;
  final String name;
  final String location;
  final String type; // Nguyên liệu, Thành phẩm, Đông lạnh, Hàng khô, Hải sản...
  final DateTime updatedAt;

  NongSanWarehouse({
    required this.id,
    required this.name,
    this.location = '',
    this.type = 'Nguyên liệu',
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'type': type,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanWarehouse.fromJson(Map<String, dynamic> json) =>
      NongSanWarehouse(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        location: json['location'] ?? '',
        type: json['type'] ?? 'Nguyên liệu',
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanStockTransaction {
  final String id;
  final String warehouseId;
  final String productId;
  final String lotId;
  final String type; // IMPORT, EXPORT, ADJUSTMENT, TRANSFER_IN, TRANSFER_OUT
  final double quantity; // Positive for import, negative for export
  final String referenceId; // Liên kết tới Receipt / Invoice / Return
  final String note;
  final DateTime timestamp;

  NongSanStockTransaction({
    required this.id,
    required this.warehouseId,
    required this.productId,
    this.lotId = '',
    required this.type,
    required this.quantity,
    this.referenceId = '',
    this.note = '',
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'warehouseId': warehouseId,
        'productId': productId,
        'lotId': lotId,
        'type': type,
        'quantity': quantity,
        'referenceId': referenceId,
        'note': note,
        'timestamp': timestamp.toIso8601String(),
      };

  factory NongSanStockTransaction.fromJson(Map<String, dynamic> json) =>
      NongSanStockTransaction(
        id: json['id'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        productId: json['productId'] ?? '',
        lotId: json['lotId'] ?? '',
        type: json['type'] ?? 'IMPORT',
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        referenceId: json['referenceId'] ?? '',
        note: json['note'] ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}

class NongSanSalesOrder {
  final String id;
  final String orderNumber;
  final String customerId;
  final String warehouseId;
  final String productId;
  final double quantity;
  final double unitPrice;
  final double discount;
  final double taxRate; // % thuế xuất (GTGT đầu ra)
  final String status; // §48: DRAFT / APPROVED / POSTED / CANCELLED
  final String note;
  final DateTime updatedAt;

  NongSanSalesOrder({
    required this.id,
    required this.customerId,
    required this.warehouseId,
    required this.productId,
    this.quantity = 0,
    this.unitPrice = 0,
    this.discount = 0,
    this.taxRate = 0,
    this.status = 'DRAFT',
    this.note = '',
    DateTime? updatedAt,
    String? orderNumber,
  })  : orderNumber = orderNumber ??
            'SO-${(updatedAt ?? DateTime.now()).millisecondsSinceEpoch.toString().substring(6)}',
        updatedAt = updatedAt ?? DateTime.now();

  double get grossAmount => quantity * unitPrice;
  double get tax => (grossAmount - discount) * taxRate;
  double get totalPayment => grossAmount - discount + tax;

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderNumber': orderNumber,
        'customerId': customerId,
        'warehouseId': warehouseId,
        'productId': productId,
        'quantity': quantity,
        'unitPrice': unitPrice,
        'discount': discount,
        'taxRate': taxRate,
        'status': status,
        'note': note,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanSalesOrder.fromJson(Map<String, dynamic> json) =>
      NongSanSalesOrder(
        id: json['id'] ?? '',
        orderNumber: json['orderNumber'],
        customerId: json['customerId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        productId: json['productId'] ?? '',
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
        discount: (json['discount'] as num?)?.toDouble() ?? 0,
        taxRate: (json['taxRate'] as num?)?.toDouble() ?? 0,
        status: json['status'] ?? 'DRAFT',
        note: json['note'] ?? '',
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanSalesInvoice {
  final String id;
  final String invoiceNumber;
  final String customerId;
  final String warehouseId;
  final String productId;
  final String orderId; // Đơn bán gốc (§12.2)
  final double quantity;
  final double unitPrice;
  final double discount;
  final double tax; // Thuế xuất (§12.4)
  final double shippingFee; // Phí vận chuyển
  final double totalPayment;
  final String paymentMethod; // CASH / BANK / DEBT (§16)
  final double paidAmount; // Đã thu ngay
  final String status; // §48: POSTED khi ghi sổ
  final DateTime updatedAt;

  NongSanSalesInvoice({
    required this.id,
    required this.customerId,
    required this.warehouseId,
    required this.productId,
    this.orderId = '',
    required this.quantity,
    required this.unitPrice,
    this.discount = 0,
    this.tax = 0,
    this.shippingFee = 0,
    this.paymentMethod = 'CASH',
    this.paidAmount = 0,
    this.status = 'POSTED',
    double? totalPayment,
    DateTime? updatedAt,
    String? invoiceNumber,
  })  : totalPayment = totalPayment ??
            ((quantity * unitPrice) - discount + tax + shippingFee),
        invoiceNumber = invoiceNumber ??
            'HD-${(updatedAt ?? DateTime.now()).millisecondsSinceEpoch.toString().substring(6)}',
        updatedAt = updatedAt ?? DateTime.now();

  /// §12.4 Tiền hàng - Chiết khấu + Thuế + Phí = Tổng thanh toán.
  double get grossAmount => quantity * unitPrice;
  double get receivableAmount => totalPayment - paidAmount;

  Map<String, dynamic> toJson() => {
        'id': id,
        'invoiceNumber': invoiceNumber,
        'customerId': customerId,
        'warehouseId': warehouseId,
        'productId': productId,
        'orderId': orderId,
        'quantity': quantity,
        'unitPrice': unitPrice,
        'discount': discount,
        'tax': tax,
        'shippingFee': shippingFee,
        'totalPayment': totalPayment,
        'paymentMethod': paymentMethod,
        'paidAmount': paidAmount,
        'status': status,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanSalesInvoice.fromJson(Map<String, dynamic> json) =>
      NongSanSalesInvoice(
        id: json['id'] ?? '',
        invoiceNumber: json['invoiceNumber'],
        customerId: json['customerId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        productId: json['productId'] ?? '',
        orderId: json['orderId'] ?? '',
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
        discount: (json['discount'] as num?)?.toDouble() ?? 0,
        tax: (json['tax'] as num?)?.toDouble() ?? 0,
        shippingFee: (json['shippingFee'] as num?)?.toDouble() ?? 0,
        totalPayment: (json['totalPayment'] as num?)?.toDouble(),
        paymentMethod: json['paymentMethod'] ?? 'CASH',
        paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0,
        status: json['status'] ?? 'POSTED',
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

class NongSanStockIssue {
  final String id;
  final String invoiceId; // Phiếu xuất kho tạo từ đơn bán (§12.3)
  final String productId;
  final String warehouseId;
  final String lotId;
  final double quantity;
  final double unitCost; // Giá vốn đơn vị
  final double lineCost; // Giá vốn dòng = quantity * unitCost
  final String note;
  final DateTime timestamp;

  NongSanStockIssue({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.warehouseId,
    required this.lotId,
    required this.quantity,
    this.unitCost = 0,
    this.note = '',
    DateTime? timestamp,
  })  : lineCost = quantity * unitCost,
        timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'invoiceId': invoiceId,
        'productId': productId,
        'warehouseId': warehouseId,
        'lotId': lotId,
        'quantity': quantity,
        'unitCost': unitCost,
        'lineCost': lineCost,
        'note': note,
        'timestamp': timestamp.toIso8601String(),
      };

  factory NongSanStockIssue.fromJson(Map<String, dynamic> json) =>
      NongSanStockIssue(
        id: json['id'] ?? '',
        invoiceId: json['invoiceId'] ?? '',
        productId: json['productId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        lotId: json['lotId'] ?? '',
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        unitCost: (json['unitCost'] as num?)?.toDouble() ?? 0,
        note: json['note'] ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}

class NongSanStockTransfer {
  final String id;
  final String lotId;
  final String productId;
  final String fromWarehouseId;
  final String toWarehouseId;
  final double quantity;
  final double unitCost;
  final String note;
  final DateTime timestamp;

  NongSanStockTransfer({
    required this.id,
    required this.lotId,
    required this.productId,
    required this.fromWarehouseId,
    required this.toWarehouseId,
    required this.quantity,
    this.unitCost = 0,
    this.note = '',
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'lotId': lotId,
        'productId': productId,
        'fromWarehouseId': fromWarehouseId,
        'toWarehouseId': toWarehouseId,
        'quantity': quantity,
        'unitCost': unitCost,
        'note': note,
        'timestamp': timestamp.toIso8601String(),
      };

  factory NongSanStockTransfer.fromJson(Map<String, dynamic> json) =>
      NongSanStockTransfer(
        id: json['id'] ?? '',
        lotId: json['lotId'] ?? '',
        productId: json['productId'] ?? '',
        fromWarehouseId: json['fromWarehouseId'] ?? '',
        toWarehouseId: json['toWarehouseId'] ?? '',
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        unitCost: (json['unitCost'] as num?)?.toDouble() ?? 0,
        note: json['note'] ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}

class NongSanStockAdjustment {
  final String id;
  final String lotId;
  final String productId;
  final String warehouseId;
  final double quantityDelta; // Dương: điều chỉnh tăng; âm: giảm
  final String reason; // Kiểm kê / Hủy hàng / Nhập lại (§10.2)
  final DateTime timestamp;

  NongSanStockAdjustment({
    required this.id,
    required this.lotId,
    required this.productId,
    required this.warehouseId,
    this.quantityDelta = 0,
    this.reason = '',
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'lotId': lotId,
        'productId': productId,
        'warehouseId': warehouseId,
        'quantityDelta': quantityDelta,
        'reason': reason,
        'timestamp': timestamp.toIso8601String(),
      };

  factory NongSanStockAdjustment.fromJson(Map<String, dynamic> json) =>
      NongSanStockAdjustment(
        id: json['id'] ?? '',
        lotId: json['lotId'] ?? '',
        productId: json['productId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        quantityDelta: (json['quantityDelta'] as num?)?.toDouble() ?? 0,
        reason: json['reason'] ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
      );
}

class NongSanSalesReturn {
  final String id;
  final String returnNumber;
  final String invoiceId; // Chứng từ bán hàng gốc (§13)
  final String customerId;
  final String productId;
  final String warehouseId;
  final double quantity; // Số lượng trả lại
  final double refundAmount; // Giá trị hoàn
  final double cogsRefund; // Giá vốn phần trả lại
  final String reason;
  final String status; // §48: POSTED
  final DateTime updatedAt;

  NongSanSalesReturn({
    required this.id,
    required this.invoiceId,
    required this.customerId,
    required this.productId,
    required this.warehouseId,
    this.quantity = 0,
    this.refundAmount = 0,
    this.cogsRefund = 0,
    this.reason = '',
    this.status = 'POSTED',
    DateTime? updatedAt,
    String? returnNumber,
  })  : returnNumber = returnNumber ??
            'TR-${(updatedAt ?? DateTime.now()).millisecondsSinceEpoch.toString().substring(6)}',
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'returnNumber': returnNumber,
        'invoiceId': invoiceId,
        'customerId': customerId,
        'productId': productId,
        'warehouseId': warehouseId,
        'quantity': quantity,
        'refundAmount': refundAmount,
        'cogsRefund': cogsRefund,
        'reason': reason,
        'status': status,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory NongSanSalesReturn.fromJson(Map<String, dynamic> json) =>
      NongSanSalesReturn(
        id: json['id'] ?? '',
        returnNumber: json['returnNumber'],
        invoiceId: json['invoiceId'] ?? '',
        customerId: json['customerId'] ?? '',
        productId: json['productId'] ?? '',
        warehouseId: json['warehouseId'] ?? '',
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        refundAmount: (json['refundAmount'] as num?)?.toDouble() ?? 0,
        cogsRefund: (json['cogsRefund'] as num?)?.toDouble() ?? 0,
        reason: json['reason'] ?? '',
        status: json['status'] ?? 'POSTED',
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}