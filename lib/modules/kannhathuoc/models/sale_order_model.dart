class SaleOrderItem {
  final String medicineId;
  final String medicineName;
  final String unit;
  final int quantity;
  final double unitPrice;
  final double discount;
  final double totalPrice;

  SaleOrderItem({
    required this.medicineId,
    required this.medicineName,
    this.unit = 'Hộp',
    required this.quantity,
    required this.unitPrice,
    this.discount = 0,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() => {
    'medicineId': medicineId,
    'medicineName': medicineName,
    'unit': unit,
    'quantity': quantity,
    'unitPrice': unitPrice,
    'discount': discount,
    'totalPrice': totalPrice,
  };

  factory SaleOrderItem.fromJson(Map<String, dynamic> json) => SaleOrderItem(
    medicineId: json['medicineId'] as String? ?? '',
    medicineName: json['medicineName'] as String? ?? '',
    unit: json['unit'] as String? ?? 'Hộp',
    quantity: json['quantity'] as int? ?? 0,
    unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
    discount: (json['discount'] as num?)?.toDouble() ?? 0,
    totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
  );

  SaleOrderItem copyWith({
    String? medicineId,
    String? medicineName,
    String? unit,
    int? quantity,
    double? unitPrice,
    double? discount,
    double? totalPrice,
  }) {
    return SaleOrderItem(
      medicineId: medicineId ?? this.medicineId,
      medicineName: medicineName ?? this.medicineName,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount ?? this.discount,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

class SaleOrderModel {
  final String id;
  final String invoiceNumber;
  final String customerId;
  final String customerName;
  final String saleType;
  final String doctorName;
  final String diagnosis;
  final DateTime saleDate;
  final String createdBy;
  final double totalAmount;
  final double discountAmount;
  final double vatAmount;
  final double netAmount;
  final String paymentMethod;
  final String paymentStatus;
  final List<SaleOrderItem> items;
  final bool isSynced;
  final DateTime updatedAt;

  SaleOrderModel({
    required this.id,
    required this.invoiceNumber,
    this.customerId = '',
    this.customerName = '',
    this.saleType = 'Bán lẻ',
    this.doctorName = '',
    this.diagnosis = '',
    required this.saleDate,
    this.createdBy = '',
    this.totalAmount = 0,
    this.discountAmount = 0,
    this.vatAmount = 0,
    this.netAmount = 0,
    this.paymentMethod = 'Tiền mặt',
    this.paymentStatus = 'Đã thanh toán',
    this.items = const [],
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'invoiceNumber': invoiceNumber,
    'customerId': customerId,
    'customerName': customerName,
    'saleType': saleType,
    'doctorName': doctorName,
    'diagnosis': diagnosis,
    'saleDate': saleDate.toIso8601String(),
    'createdBy': createdBy,
    'totalAmount': totalAmount,
    'discountAmount': discountAmount,
    'vatAmount': vatAmount,
    'netAmount': netAmount,
    'paymentMethod': paymentMethod,
    'paymentStatus': paymentStatus,
    'items': items.map((e) => e.toJson()).toList(),
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory SaleOrderModel.fromJson(Map<String, dynamic> json) => SaleOrderModel(
    id: json['id'] as String,
    invoiceNumber: json['invoiceNumber'] as String? ?? '',
    customerId: json['customerId'] as String? ?? '',
    customerName: json['customerName'] as String? ?? '',
    saleType: json['saleType'] as String? ?? 'Bán lẻ',
    doctorName: json['doctorName'] as String? ?? '',
    diagnosis: json['diagnosis'] as String? ?? '',
    saleDate: DateTime.parse(json['saleDate'] as String),
    createdBy: json['createdBy'] as String? ?? '',
    totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0,
    discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0,
    vatAmount: (json['vatAmount'] as num?)?.toDouble() ?? 0,
    netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0,
    paymentMethod: json['paymentMethod'] as String? ?? 'Tiền mặt',
    paymentStatus: json['paymentStatus'] as String? ?? 'Đã thanh toán',
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => SaleOrderItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  SaleOrderModel copyWith({
    String? id,
    String? invoiceNumber,
    String? customerId,
    String? customerName,
    String? saleType,
    String? doctorName,
    String? diagnosis,
    DateTime? saleDate,
    String? createdBy,
    double? totalAmount,
    double? discountAmount,
    double? vatAmount,
    double? netAmount,
    String? paymentMethod,
    String? paymentStatus,
    List<SaleOrderItem>? items,
    bool? isSynced,
  }) {
    return SaleOrderModel(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      saleType: saleType ?? this.saleType,
      doctorName: doctorName ?? this.doctorName,
      diagnosis: diagnosis ?? this.diagnosis,
      saleDate: saleDate ?? this.saleDate,
      createdBy: createdBy ?? this.createdBy,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      vatAmount: vatAmount ?? this.vatAmount,
      netAmount: netAmount ?? this.netAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      items: items ?? this.items,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}
