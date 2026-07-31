enum CafeOrderType { dineIn, takeaway, delivery }
enum CafePaymentMethod { cash, card, bankTransfer, qrCode }
enum CafePaymentStatus { unpaid, paid, refunded }
enum CafeOrderStatus { pending, preparing, completed, cancelled }

class CafeOrderItem {
  final String productId;
  final String productName;
  final String sizeName;
  final List<String> selectedToppings;
  final int quantity;
  final double unitPrice;
  final double totalPrice;
  final String notes;

  const CafeOrderItem({
    required this.productId,
    required this.productName,
    this.sizeName = '',
    this.selectedToppings = const [],
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.notes = '',
  });

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'sizeName': sizeName,
        'selectedToppings': selectedToppings,
        'quantity': quantity,
        'unitPrice': unitPrice,
        'totalPrice': totalPrice,
        'notes': notes,
      };

  factory CafeOrderItem.fromJson(Map<String, dynamic> json) => CafeOrderItem(
        productId: json['productId'] ?? '',
        productName: json['productName'] ?? '',
        sizeName: json['sizeName'] ?? '',
        selectedToppings: (json['selectedToppings'] as List<dynamic>?)
                ?.map((t) => t.toString())
                .toList() ??
            [],
        quantity: json['quantity'] ?? 1,
        unitPrice: (json['unitPrice'] ?? 0).toDouble(),
        totalPrice: (json['totalPrice'] ?? 0).toDouble(),
        notes: json['notes'] ?? '',
      );

  CafeOrderItem copyWith({
    String? productId,
    String? productName,
    String? sizeName,
    List<String>? selectedToppings,
    int? quantity,
    double? unitPrice,
    double? totalPrice,
    String? notes,
  }) =>
      CafeOrderItem(
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        sizeName: sizeName ?? this.sizeName,
        selectedToppings: selectedToppings ?? this.selectedToppings,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        totalPrice: totalPrice ?? this.totalPrice,
        notes: notes ?? this.notes,
      );
}

class CafeOrderModel {
  final String id;
  final String orderNumber;
  final CafeOrderType type;
  final String? tableId;
  final String customerName;
  final String customerPhone;
  final List<CafeOrderItem> items;
  final double totalAmount;
  final double discountAmount;
  final double deliveryFee;
  final CafePaymentMethod paymentMethod;
  final CafePaymentStatus paymentStatus;
  final CafeOrderStatus status;
  final DateTime createdAt;

  const CafeOrderModel({
    required this.id,
    required this.orderNumber,
    required this.type,
    this.tableId,
    this.customerName = '',
    this.customerPhone = '',
    this.items = const [],
    required this.totalAmount,
    this.discountAmount = 0,
    this.deliveryFee = 0,
    this.paymentMethod = CafePaymentMethod.cash,
    this.paymentStatus = CafePaymentStatus.unpaid,
    this.status = CafeOrderStatus.pending,
    required this.createdAt,
  });

  double get finalAmount => totalAmount - discountAmount + deliveryFee;

  String get typeLabel {
    switch (type) {
      case CafeOrderType.dineIn:
        return 'Tại bàn';
      case CafeOrderType.takeaway:
        return 'Mang về';
      case CafeOrderType.delivery:
        return 'Giao hàng';
    }
  }

  String get statusLabel {
    switch (status) {
      case CafeOrderStatus.pending:
        return 'Chờ xử lý';
      case CafeOrderStatus.preparing:
        return 'Đang pha';
      case CafeOrderStatus.completed:
        return 'Hoàn thành';
      case CafeOrderStatus.cancelled:
        return 'Đã hủy';
    }
  }

  String get paymentStatusLabel {
    switch (paymentStatus) {
      case CafePaymentStatus.unpaid:
        return 'Chưa thanh toán';
      case CafePaymentStatus.paid:
        return 'Đã thanh toán';
      case CafePaymentStatus.refunded:
        return 'Đã hoàn tiền';
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderNumber': orderNumber,
        'type': type.name,
        'tableId': tableId,
        'customerName': customerName,
        'customerPhone': customerPhone,
        'items': items.map((i) => i.toJson()).toList(),
        'totalAmount': totalAmount,
        'discountAmount': discountAmount,
        'deliveryFee': deliveryFee,
        'paymentMethod': paymentMethod.name,
        'paymentStatus': paymentStatus.name,
        'status': status.name,
        'createdAt': createdAt.toIso8601String(),
      };

  factory CafeOrderModel.fromJson(Map<String, dynamic> json) =>
      CafeOrderModel(
        id: json['id'] ?? '',
        orderNumber: json['orderNumber'] ?? '',
        type: CafeOrderType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => CafeOrderType.dineIn,
        ),
        tableId: json['tableId'],
        customerName: json['customerName'] ?? '',
        customerPhone: json['customerPhone'] ?? '',
        items: (json['items'] as List<dynamic>?)
                ?.map((i) => CafeOrderItem.fromJson(i))
                .toList() ??
            [],
        totalAmount: (json['totalAmount'] ?? 0).toDouble(),
        discountAmount: (json['discountAmount'] ?? 0).toDouble(),
        deliveryFee: (json['deliveryFee'] ?? 0).toDouble(),
        paymentMethod: CafePaymentMethod.values.firstWhere(
          (e) => e.name == json['paymentMethod'],
          orElse: () => CafePaymentMethod.cash,
        ),
        paymentStatus: CafePaymentStatus.values.firstWhere(
          (e) => e.name == json['paymentStatus'],
          orElse: () => CafePaymentStatus.unpaid,
        ),
        status: CafeOrderStatus.values.firstWhere(
          (e) => e.name == json['status'],
          orElse: () => CafeOrderStatus.pending,
        ),
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
      );

  CafeOrderModel copyWith({
    String? id,
    String? orderNumber,
    CafeOrderType? type,
    String? tableId,
    String? customerName,
    String? customerPhone,
    List<CafeOrderItem>? items,
    double? totalAmount,
    double? discountAmount,
    double? deliveryFee,
    CafePaymentMethod? paymentMethod,
    CafePaymentStatus? paymentStatus,
    CafeOrderStatus? status,
    DateTime? createdAt,
    bool clearTable = false,
  }) =>
      CafeOrderModel(
        id: id ?? this.id,
        orderNumber: orderNumber ?? this.orderNumber,
        type: type ?? this.type,
        tableId: clearTable ? null : (tableId ?? this.tableId),
        customerName: customerName ?? this.customerName,
        customerPhone: customerPhone ?? this.customerPhone,
        items: items ?? this.items,
        totalAmount: totalAmount ?? this.totalAmount,
        discountAmount: discountAmount ?? this.discountAmount,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
}
