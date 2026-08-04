import 'cafe_menu.dart';

enum OrderType {
  taiBan('Tại bàn'),
  mangDi('Mang đi (Take Away)'),
  giaoHang('Giao hàng (Delivery)');

  final String label;
  const OrderType(this.label);
}

enum DeliveryPartner {
  grab('GrabFood'),
  shopee('ShopeeFood'),
  be('BeFood'),
  gojek('Gojek'),
  tuGiao('Tự giao');

  final String label;
  const DeliveryPartner(this.label);
}

enum PaymentMethod {
  tienMat('Tiền mặt'),
  qr('Mã QR / Chuyển khoản'),
  the('Thẻ ATM / Visa'),
  viDienTu('Ví điện tử'),
  nhieuPhuongThuc('Nhiều phương thức');

  final String label;
  const PaymentMethod(this.label);
}

enum OrderStatus {
  dangPhucVu('Đang phục vụ'),
  choThanhToan('Chờ thanh toán'),
  daThanhToan('Đã thanh toán'),
  daHuy('Đã hủy');

  final String label;
  const OrderStatus(this.label);
}

class CafeOrderItem {
  final String id;
  final String menuItemId;
  final String menuItemName;
  final MenuItemSize selectedSize;
  final List<MenuItemTopping> selectedToppings;
  final int quantity;
  final double unitPrice;
  final double discountAmount;
  final String note;

  CafeOrderItem({
    required this.id,
    required this.menuItemId,
    required this.menuItemName,
    required this.selectedSize,
    this.selectedToppings = const [],
    required this.quantity,
    required this.unitPrice,
    this.discountAmount = 0,
    this.note = '',
  });

  double get totalPrice {
    double itemPrice = unitPrice + selectedSize.extraPrice;
    for (var top in selectedToppings) {
      itemPrice += top.price;
    }
    return (itemPrice * quantity) - discountAmount;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'menuItemId': menuItemId,
    'menuItemName': menuItemName,
    'selectedSize': selectedSize.toJson(),
    'selectedToppings': selectedToppings.map((t) => t.toJson()).toList(),
    'quantity': quantity,
    'unitPrice': unitPrice,
    'discountAmount': discountAmount,
    'note': note,
    'totalPrice': totalPrice,
  };

  factory CafeOrderItem.fromJson(Map<String, dynamic> json) => CafeOrderItem(
    id: json['id'] ?? '',
    menuItemId: json['menuItemId'] ?? '',
    menuItemName: json['menuItemName'] ?? '',
    selectedSize: json['selectedSize'] != null
        ? MenuItemSize.fromJson(Map<String, dynamic>.from(json['selectedSize']))
        : MenuItemSize(name: 'M', extraPrice: 0),
    selectedToppings:
        (json['selectedToppings'] as List?)
            ?.map((t) => MenuItemTopping.fromJson(Map<String, dynamic>.from(t)))
            .toList() ??
        [],
    quantity: json['quantity'] ?? 1,
    unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
    discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0,
    note: json['note'] ?? '',
  );

  CafeOrderItem copyWith({
    MenuItemSize? selectedSize,
    List<MenuItemTopping>? selectedToppings,
    int? quantity,
    double? discountAmount,
    String? note,
  }) {
    return CafeOrderItem(
      id: id,
      menuItemId: menuItemId,
      menuItemName: menuItemName,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedToppings: selectedToppings ?? this.selectedToppings,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice,
      discountAmount: discountAmount ?? this.discountAmount,
      note: note ?? this.note,
    );
  }
}

class CafeOrder {
  final String id;
  final String orderCode;
  final OrderType orderType;
  final String? tableId;
  final String? tableName;
  final String customerName;
  final String customerPhone;
  final String? customerId;
  final DeliveryPartner? deliveryPartner;
  final String deliveryAddress;
  final double shippingFee;
  final List<CafeOrderItem> items;
  final double discountPercent;
  final double discountAmount;
  final String voucherCode;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
  final String sellerName;
  final String note;
  final DateTime? occupiedAt;
  final DateTime? paidAt;
  final DateTime? printedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  CafeOrder({
    required this.id,
    required this.orderCode,
    this.orderType = OrderType.taiBan,
    this.tableId,
    this.tableName,
    this.customerName = 'Khách lẻ',
    this.customerPhone = '',
    this.customerId,
    this.deliveryPartner,
    this.deliveryAddress = '',
    this.shippingFee = 0,
    required this.items,
    this.discountPercent = 0,
    this.discountAmount = 0,
    this.voucherCode = '',
    this.status = OrderStatus.dangPhucVu,
    this.paymentMethod = PaymentMethod.tienMat,
    this.sellerName = 'Thu ngân',
    this.note = '',
    this.occupiedAt,
    this.paidAt,
    this.printedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);

  double get totalDiscount {
    double percentDiscount = (subtotal * discountPercent) / 100;
    return percentDiscount + discountAmount;
  }

  double get grandTotal {
    double total = subtotal - totalDiscount + shippingFee;
    return total < 0 ? 0 : total;
  }

  CafeOrder copyWith({
    OrderType? orderType,
    String? tableId,
    String? tableName,
    String? customerName,
    String? customerPhone,
    String? customerId,
    DeliveryPartner? deliveryPartner,
    String? deliveryAddress,
    double? shippingFee,
    List<CafeOrderItem>? items,
    double? discountPercent,
    double? discountAmount,
    String? voucherCode,
    OrderStatus? status,
    PaymentMethod? paymentMethod,
    String? sellerName,
    String? note,
    DateTime? occupiedAt,
    DateTime? paidAt,
    DateTime? printedAt,
    DateTime? updatedAt,
  }) {
    return CafeOrder(
      id: id,
      orderCode: orderCode,
      orderType: orderType ?? this.orderType,
      tableId: tableId ?? this.tableId,
      tableName: tableName ?? this.tableName,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      customerId: customerId ?? this.customerId,
      deliveryPartner: deliveryPartner ?? this.deliveryPartner,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      shippingFee: shippingFee ?? this.shippingFee,
      items: items ?? this.items,
      discountPercent: discountPercent ?? this.discountPercent,
      discountAmount: discountAmount ?? this.discountAmount,
      voucherCode: voucherCode ?? this.voucherCode,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      sellerName: sellerName ?? this.sellerName,
      note: note ?? this.note,
      occupiedAt: occupiedAt ?? this.occupiedAt,
      paidAt: paidAt ?? this.paidAt,
      printedAt: printedAt ?? this.printedAt,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'orderCode': orderCode,
    'orderType': orderType.name,
    'tableId': tableId,
    'tableName': tableName,
    'customerName': customerName,
    'customerPhone': customerPhone,
    'customerId': customerId,
    'deliveryPartner': deliveryPartner?.name,
    'deliveryAddress': deliveryAddress,
    'shippingFee': shippingFee,
    'items': items.map((i) => i.toJson()).toList(),
    'discountPercent': discountPercent,
    'discountAmount': discountAmount,
    'voucherCode': voucherCode,
    'status': status.name,
    'paymentMethod': paymentMethod.name,
    'sellerName': sellerName,
    'note': note,
    'subtotal': subtotal,
    'grandTotal': grandTotal,
    'occupiedAt': occupiedAt?.toIso8601String(),
    'paidAt': paidAt?.toIso8601String(),
    'printedAt': printedAt?.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory CafeOrder.fromJson(Map<String, dynamic> json) => CafeOrder(
    id: json['id'] ?? '',
    orderCode: json['orderCode'] ?? '',
    orderType: OrderType.values.firstWhere(
      (e) => e.name == json['orderType'],
      orElse: () => OrderType.taiBan,
    ),
    tableId: json['tableId'],
    tableName: json['tableName'],
    customerName: json['customerName'] ?? 'Khách lẻ',
    customerPhone: json['customerPhone'] ?? '',
    customerId: json['customerId'],
    deliveryPartner: json['deliveryPartner'] != null
        ? DeliveryPartner.values.firstWhere(
            (e) => e.name == json['deliveryPartner'],
            orElse: () => DeliveryPartner.tuGiao,
          )
        : null,
    deliveryAddress: json['deliveryAddress'] ?? '',
    shippingFee: (json['shippingFee'] as num?)?.toDouble() ?? 0,
    items:
        (json['items'] as List?)
            ?.map((i) => CafeOrderItem.fromJson(Map<String, dynamic>.from(i)))
            .toList() ??
        [],
    discountPercent: (json['discountPercent'] as num?)?.toDouble() ?? 0,
    discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0,
    voucherCode: json['voucherCode'] ?? '',
    status: OrderStatus.values.firstWhere(
      (e) => e.name == json['status'],
      orElse: () => OrderStatus.dangPhucVu,
    ),
    paymentMethod: PaymentMethod.values.firstWhere(
      (e) => e.name == json['paymentMethod'],
      orElse: () => PaymentMethod.tienMat,
    ),
    sellerName: json['sellerName'] ?? 'Thu ngân',
    note: json['note'] ?? '',
    occupiedAt: json['occupiedAt'] != null
        ? DateTime.parse(json['occupiedAt'])
        : null,
    paidAt: json['paidAt'] != null
        ? DateTime.parse(json['paidAt'])
        : null,
    printedAt: json['printedAt'] != null
        ? DateTime.parse(json['printedAt'])
        : null,
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'])
        : DateTime.now(),
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now(),
  );
}
