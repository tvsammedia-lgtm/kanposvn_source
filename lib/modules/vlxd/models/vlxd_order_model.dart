class VlxdOrderItem {
  final String productId;
  final String productName;
  final double quantity;
  final double unitPrice;
  final double totalPrice;

  VlxdOrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'productName': productName,
    'quantity': quantity,
    'unitPrice': unitPrice,
    'totalPrice': totalPrice,
  };

  factory VlxdOrderItem.fromJson(Map<String, dynamic> json) => VlxdOrderItem(
    productId: json['productId'] as String? ?? '',
    productName: json['productName'] as String? ?? '',
    quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
    unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
    totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
  );

  VlxdOrderItem copyWith({
    String? productId,
    String? productName,
    double? quantity,
    double? unitPrice,
    double? totalPrice,
  }) {
    return VlxdOrderItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

class VlxdOrderModel {
  final String id;
  final String orderNumber;
  final String type;
  final String customerId;
  final String customerName;
  final List<VlxdOrderItem> items;
  final double totalAmount;
  final double paidAmount;
  final String status;
  final DateTime createdAt;

  VlxdOrderModel({
    required this.id,
    required this.orderNumber,
    this.type = 'retail',
    this.customerId = '',
    this.customerName = '',
    this.items = const [],
    this.totalAmount = 0,
    this.paidAmount = 0,
    this.status = 'pending',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  double get remainingAmount => totalAmount - paidAmount;

  Map<String, dynamic> toJson() => {
    'id': id,
    'orderNumber': orderNumber,
    'type': type,
    'customerId': customerId,
    'customerName': customerName,
    'items': items.map((i) => i.toJson()).toList(),
    'totalAmount': totalAmount,
    'paidAmount': paidAmount,
    'status': status,
    'createdAt': createdAt.toIso8601String(),
  };

  factory VlxdOrderModel.fromJson(Map<String, dynamic> json) => VlxdOrderModel(
    id: json['id'] as String,
    orderNumber: json['orderNumber'] as String? ?? '',
    type: json['type'] as String? ?? 'retail',
    customerId: json['customerId'] as String? ?? '',
    customerName: json['customerName'] as String? ?? '',
    items: (json['items'] as List<dynamic>?)
            ?.map((i) => VlxdOrderItem.fromJson(i as Map<String, dynamic>))
            .toList() ??
        [],
    totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0,
    paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0,
    status: json['status'] as String? ?? 'pending',
    createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
  );

  VlxdOrderModel copyWith({
    String? id,
    String? orderNumber,
    String? type,
    String? customerId,
    String? customerName,
    List<VlxdOrderItem>? items,
    double? totalAmount,
    double? paidAmount,
    String? status,
  }) {
    return VlxdOrderModel(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      type: type ?? this.type,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      status: status ?? this.status,
      createdAt: createdAt,
    );
  }
}
