import 'dart:convert';

/// Role enum matching PRD section 30
enum UserRole {
  admin,
  manager,
  cashier,
  waiter,
  barista,
  accountant,
  owner,
}

extension UserRoleExtension on UserRole {
  String get label {
    switch (this) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.manager:
        return 'Quản lý';
      case UserRole.cashier:
        return 'Thu ngân';
      case UserRole.waiter:
        return 'Phục vụ';
      case UserRole.barista:
        return 'Pha chế';
      case UserRole.accountant:
        return 'Kế toán';
      case UserRole.owner:
        return 'Chủ quán';
    }
  }
}

/// Table status matching PRD section 6
enum TableStatus {
  empty, // Trống (Xanh)
  occupied, // Có khách (Đỏ)
  ordering, // Đang gọi món
  serving, // Đang phục vụ
  pendingPayment, // Chờ thanh toán (Cam)
  paid, // Đã thanh toán
  cleaning, // Đang dọn (Xám)
  reserved, // Đã đặt trước
}

extension TableStatusExtension on TableStatus {
  String get label {
    switch (this) {
      case TableStatus.empty:
        return 'Trống';
      case TableStatus.occupied:
        return 'Có khách';
      case TableStatus.ordering:
        return 'Đang gọi món';
      case TableStatus.serving:
        return 'Đang phục vụ';
      case TableStatus.pendingPayment:
        return 'Chờ thanh toán';
      case TableStatus.paid:
        return 'Đã thanh toán';
      case TableStatus.cleaning:
        return 'Đang dọn';
      case TableStatus.reserved:
        return 'Đã đặt trước';
    }
  }
}

/// Order type matching PRD section 8, 9
enum OrderType {
  atTable, // Tại bàn
  takeaway, // Mang đi
  delivery, // Giao hàng
}

extension OrderTypeExtension on OrderType {
  String get label {
    switch (this) {
      case OrderType.atTable:
        return 'Tại bàn';
      case OrderType.takeaway:
        return 'Mang đi';
      case OrderType.delivery:
        return 'Giao hàng';
    }
  }
}

/// User Model
class UserModel {
  final String id;
  final String username;
  final String password;
  final String fullName;
  final UserRole role;
  final bool isActive;
  final bool isSynced;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.username,
    this.password = '',
    required this.fullName,
    required this.role,
    this.isActive = true,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'fullName': fullName,
        'role': role.name,
        'isActive': isActive,
        'isSynced': isSynced,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? '',
        username: json['username'] ?? '',
        password: json['password'] ?? '',
        fullName: json['fullName'] ?? '',
        role: UserRole.values.firstWhere(
          (e) => e.name == json['role'],
          orElse: () => UserRole.cashier,
        ),
        isActive: json['isActive'] ?? true,
        isSynced: json['isSynced'] ?? false,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

/// Area Model (Khu vực: Tầng 1, Tầng 2, Sân vườn...)
class AreaModel {
  final String id;
  final String name;
  final int displayOrder;
  final bool isSynced;

  AreaModel({
    required this.id,
    required this.name,
    this.displayOrder = 0,
    this.isSynced = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'displayOrder': displayOrder,
        'isSynced': isSynced,
      };

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        displayOrder: json['displayOrder'] ?? 0,
        isSynced: json['isSynced'] ?? false,
      );
}

/// Table Model (Bàn)
class TableModel {
  final String id;
  final String areaId;
  final String areaName;
  final String name;
  final int seats;
  final TableStatus status;
  final String? currentCustomerName;
  final int customerCount;
  final DateTime? occupiedAt;
  final String? currentOrderId;
  final String? note;
  final bool isSynced;
  final DateTime updatedAt;

  TableModel({
    required this.id,
    required this.areaId,
    required this.areaName,
    required this.name,
    this.seats = 4,
    this.status = TableStatus.empty,
    this.currentCustomerName,
    this.customerCount = 0,
    this.occupiedAt,
    this.currentOrderId,
    this.note,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  TableModel copyWith({
    String? id,
    String? areaId,
    String? areaName,
    String? name,
    int? seats,
    TableStatus? status,
    String? currentCustomerName,
    int? customerCount,
    DateTime? occupiedAt,
    String? currentOrderId,
    String? note,
    bool? isSynced,
    DateTime? updatedAt,
  }) {
    return TableModel(
      id: id ?? this.id,
      areaId: areaId ?? this.areaId,
      areaName: areaName ?? this.areaName,
      name: name ?? this.name,
      seats: seats ?? this.seats,
      status: status ?? this.status,
      currentCustomerName: currentCustomerName ?? this.currentCustomerName,
      customerCount: customerCount ?? this.customerCount,
      occupiedAt: occupiedAt ?? this.occupiedAt,
      currentOrderId: currentOrderId ?? this.currentOrderId,
      note: note ?? this.note,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'areaId': areaId,
        'areaName': areaName,
        'name': name,
        'seats': seats,
        'status': status.name,
        'currentCustomerName': currentCustomerName,
        'customerCount': customerCount,
        'occupiedAt': occupiedAt?.toIso8601String(),
        'currentOrderId': currentOrderId,
        'note': note,
        'isSynced': isSynced,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        id: json['id'] ?? '',
        areaId: json['areaId'] ?? '',
        areaName: json['areaName'] ?? '',
        name: json['name'] ?? '',
        seats: json['seats'] ?? 4,
        status: TableStatus.values.firstWhere(
          (e) => e.name == json['status'],
          orElse: () => TableStatus.empty,
        ),
        currentCustomerName: json['currentCustomerName'],
        customerCount: json['customerCount'] ?? 0,
        occupiedAt: json['occupiedAt'] != null
            ? DateTime.parse(json['occupiedAt'])
            : null,
        currentOrderId: json['currentOrderId'],
        note: json['note'],
        isSynced: json['isSynced'] ?? false,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

/// Category Model (Cafe, Trà sữa, Sinh tố, Nước ép...)
class CategoryModel {
  final String id;
  final String name;
  final String iconName;
  final int displayOrder;
  final bool isSynced;

  CategoryModel({
    required this.id,
    required this.name,
    this.iconName = 'local_cafe',
    this.displayOrder = 0,
    this.isSynced = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iconName': iconName,
        'displayOrder': displayOrder,
        'isSynced': isSynced,
      };

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        iconName: json['iconName'] ?? 'local_cafe',
        displayOrder: json['displayOrder'] ?? 0,
        isSynced: json['isSynced'] ?? false,
      );
}

/// Product Size
class ProductSize {
  final String name; // S, M, L
  final double extraPrice;

  ProductSize({required this.name, this.extraPrice = 0.0});

  Map<String, dynamic> toJson() => {
        'name': name,
        'extraPrice': extraPrice,
      };

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
        name: json['name'] ?? 'M',
        extraPrice: (json['extraPrice'] ?? 0.0).toDouble(),
      );
}

/// Product Topping
class ProductTopping {
  final String id;
  final String name;
  final double price;

  ProductTopping({required this.id, required this.name, required this.price});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
      };

  factory ProductTopping.fromJson(Map<String, dynamic> json) => ProductTopping(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        price: (json['price'] ?? 0.0).toDouble(),
      );
}

/// Product Model
class ProductModel {
  final String id;
  final String categoryId;
  final String categoryName;
  final String code;
  final String name;
  final double basePrice;
  final String imageUrl;
  final String description;
  final List<ProductSize> sizes;
  final List<ProductTopping> toppings;
  final bool isAvailable;
  final bool isSynced;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.code,
    required this.name,
    required this.basePrice,
    this.imageUrl = '',
    this.description = '',
    this.sizes = const [],
    this.toppings = const [],
    this.isAvailable = true,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'categoryId': categoryId,
        'categoryName': categoryName,
        'code': code,
        'name': name,
        'basePrice': basePrice,
        'imageUrl': imageUrl,
        'description': description,
        'sizes': sizes.map((s) => s.toJson()).toList(),
        'toppings': toppings.map((t) => t.toJson()).toList(),
        'isAvailable': isAvailable,
        'isSynced': isSynced,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] ?? '',
        categoryId: json['categoryId'] ?? '',
        categoryName: json['categoryName'] ?? '',
        code: json['code'] ?? '',
        name: json['name'] ?? '',
        basePrice: (json['basePrice'] ?? 0.0).toDouble(),
        imageUrl: json['imageUrl'] ?? '',
        description: json['description'] ?? '',
        sizes: (json['sizes'] as List? ?? [])
            .map((e) => ProductSize.fromJson(e))
            .toList(),
        toppings: (json['toppings'] as List? ?? [])
            .map((e) => ProductTopping.fromJson(e))
            .toList(),
        isAvailable: json['isAvailable'] ?? true,
        isSynced: json['isSynced'] ?? false,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

/// Recipe Ingredient Item
class RecipeIngredient {
  final String inventoryItemId;
  final String ingredientName;
  final double quantityNeeded;
  final String unit;

  RecipeIngredient({
    required this.inventoryItemId,
    required this.ingredientName,
    required this.quantityNeeded,
    required this.unit,
  });

  Map<String, dynamic> toJson() => {
        'inventoryItemId': inventoryItemId,
        'ingredientName': ingredientName,
        'quantityNeeded': quantityNeeded,
        'unit': unit,
      };

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) => RecipeIngredient(
        inventoryItemId: json['inventoryItemId'] ?? '',
        ingredientName: json['ingredientName'] ?? '',
        quantityNeeded: (json['quantityNeeded'] ?? 0.0).toDouble(),
        unit: json['unit'] ?? '',
      );
}

/// Recipe Model (Công thức pha chế)
class RecipeModel {
  final String id;
  final String productId;
  final String productName;
  final List<RecipeIngredient> ingredients;
  final bool isSynced;

  RecipeModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.ingredients,
    this.isSynced = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'productName': productName,
        'ingredients': ingredients.map((i) => i.toJson()).toList(),
        'isSynced': isSynced,
      };

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json['id'] ?? '',
        productId: json['productId'] ?? '',
        productName: json['productName'] ?? '',
        ingredients: (json['ingredients'] as List? ?? [])
            .map((e) => RecipeIngredient.fromJson(e))
            .toList(),
        isSynced: json['isSynced'] ?? false,
      );
}

/// Inventory Item Model (Nguyên liệu kho)
class InventoryItemModel {
  final String id;
  final String name;
  final String sku;
  final String unit;
  final double currentStock;
  final double minStock;
  final double costPrice;
  final String? supplierName;
  final bool isSynced;
  final DateTime updatedAt;

  InventoryItemModel({
    required this.id,
    required this.name,
    required this.sku,
    required this.unit,
    required this.currentStock,
    this.minStock = 5.0,
    required this.costPrice,
    this.supplierName,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  bool get isLowStock => currentStock <= minStock;

  InventoryItemModel copyWith({
    String? id,
    String? name,
    String? sku,
    String? unit,
    double? currentStock,
    double? minStock,
    double? costPrice,
    String? supplierName,
    bool? isSynced,
    DateTime? updatedAt,
  }) {
    return InventoryItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      unit: unit ?? this.unit,
      currentStock: currentStock ?? this.currentStock,
      minStock: minStock ?? this.minStock,
      costPrice: costPrice ?? this.costPrice,
      supplierName: supplierName ?? this.supplierName,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'sku': sku,
        'unit': unit,
        'currentStock': currentStock,
        'minStock': minStock,
        'costPrice': costPrice,
        'supplierName': supplierName,
        'isSynced': isSynced,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      InventoryItemModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        sku: json['sku'] ?? '',
        unit: json['unit'] ?? '',
        currentStock: (json['currentStock'] ?? 0.0).toDouble(),
        minStock: (json['minStock'] ?? 5.0).toDouble(),
        costPrice: (json['costPrice'] ?? 0.0).toDouble(),
        supplierName: json['supplierName'],
        isSynced: json['isSynced'] ?? false,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

/// Inventory Transaction Model
class InventoryTransactionModel {
  final String id;
  final String inventoryItemId;
  final String inventoryItemName;
  final String type; // IN, OUT, ADJUSTMENT, SALE
  final double quantity;
  final String unit;
  final String note;
  final DateTime createdAt;
  final String createdBy;
  final bool isSynced;

  InventoryTransactionModel({
    required this.id,
    required this.inventoryItemId,
    required this.inventoryItemName,
    required this.type,
    required this.quantity,
    required this.unit,
    this.note = '',
    DateTime? createdAt,
    this.createdBy = 'Hệ thống',
    this.isSynced = false,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'inventoryItemId': inventoryItemId,
        'inventoryItemName': inventoryItemName,
        'type': type,
        'quantity': quantity,
        'unit': unit,
        'note': note,
        'createdAt': createdAt.toIso8601String(),
        'createdBy': createdBy,
        'isSynced': isSynced,
      };

  factory InventoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      InventoryTransactionModel(
        id: json['id'] ?? '',
        inventoryItemId: json['inventoryItemId'] ?? '',
        inventoryItemName: json['inventoryItemName'] ?? '',
        type: json['type'] ?? 'SALE',
        quantity: (json['quantity'] ?? 0.0).toDouble(),
        unit: json['unit'] ?? '',
        note: json['note'] ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
        createdBy: json['createdBy'] ?? 'Hệ thống',
        isSynced: json['isSynced'] ?? false,
      );
}

/// Customer Model
class CustomerModel {
  final String id;
  final String name;
  final String phone;
  final int points;
  final String membershipTier; // Đồng, Bạc, Vàng, Kim Cương
  final double debt;
  final double totalSpent;
  final bool isSynced;
  final DateTime updatedAt;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    this.points = 0,
    this.membershipTier = 'Đồng',
    this.debt = 0.0,
    this.totalSpent = 0.0,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'points': points,
        'membershipTier': membershipTier,
        'debt': debt,
        'totalSpent': totalSpent,
        'isSynced': isSynced,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        points: json['points'] ?? 0,
        membershipTier: json['membershipTier'] ?? 'Đồng',
        debt: (json['debt'] ?? 0.0).toDouble(),
        totalSpent: (json['totalSpent'] ?? 0.0).toDouble(),
        isSynced: json['isSynced'] ?? false,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

/// Supplier Model
class SupplierModel {
  final String id;
  final String name;
  final String phone;
  final String company;
  final double debt;
  final bool isSynced;

  SupplierModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.company,
    this.debt = 0.0,
    this.isSynced = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'company': company,
        'debt': debt,
        'isSynced': isSynced,
      };

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        company: json['company'] ?? '',
        debt: (json['debt'] ?? 0.0).toDouble(),
        isSynced: json['isSynced'] ?? false,
      );
}

/// Order Item Model
class OrderItemModel {
  final String productId;
  final String productName;
  final String sizeName;
  final double sizeExtraPrice;
  final List<ProductTopping> selectedToppings;
  final double unitPrice;
  final int quantity;
  final String note;

  OrderItemModel({
    required this.productId,
    required this.productName,
    this.sizeName = 'M',
    this.sizeExtraPrice = 0.0,
    this.selectedToppings = const [],
    required this.unitPrice,
    required this.quantity,
    this.note = '',
  });

  double get itemUnitPrice {
    double toppingsPrice = selectedToppings.fold(0.0, (sum, t) => sum + t.price);
    return unitPrice + sizeExtraPrice + toppingsPrice;
  }

  double get totalPrice => itemUnitPrice * quantity;

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'sizeName': sizeName,
        'sizeExtraPrice': sizeExtraPrice,
        'selectedToppings': selectedToppings.map((t) => t.toJson()).toList(),
        'unitPrice': unitPrice,
        'quantity': quantity,
        'note': note,
        'totalPrice': totalPrice,
      };

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        productId: json['productId'] ?? '',
        productName: json['productName'] ?? '',
        sizeName: json['sizeName'] ?? 'M',
        sizeExtraPrice: (json['sizeExtraPrice'] ?? 0.0).toDouble(),
        selectedToppings: (json['selectedToppings'] as List? ?? [])
            .map((e) => ProductTopping.fromJson(e))
            .toList(),
        unitPrice: (json['unitPrice'] ?? 0.0).toDouble(),
        quantity: json['quantity'] ?? 1,
        note: json['note'] ?? '',
      );
}

/// Order Model
class OrderModel {
  final String id;
  final String orderCode;
  final OrderType type;
  final String status; // DRAFT, SERVED, PENDING_PAYMENT, COMPLETED, CANCELLED
  final String? tableId;
  final String? tableName;
  final String? areaName;
  final String? customerId;
  final String? customerName;
  final String? customerPhone;
  final List<OrderItemModel> items;
  final double subtotal;
  final double discountPercent;
  final double discountAmount;
  final double deliveryFee;
  final String? deliveryPartner; // Grab, ShopeeFood, BeFood, Gojek, Tự giao
  final double totalAmount;
  final String paymentMethod; // CASH, VIETQR, BANK_TRANSFER, CARD, E_WALLET, MULTI
  final String paymentStatus; // UNPAID, PAID
  final String note;
  final DateTime createdAt;
  final DateTime? occupiedAt; // Giờ vào (khi khách ngồi)
  final DateTime? paidAt; // Giờ ra (khi thanh toán)
  final String createdBy;
  final bool isSynced;
  final DateTime updatedAt;

  OrderModel({
    required this.id,
    required this.orderCode,
    required this.type,
    this.status = 'DRAFT',
    this.tableId,
    this.tableName,
    this.areaName,
    this.customerId,
    this.customerName,
    this.customerPhone,
    required this.items,
    required this.subtotal,
    this.discountPercent = 0.0,
    this.discountAmount = 0.0,
    this.deliveryFee = 0.0,
    this.deliveryPartner,
    required this.totalAmount,
    this.paymentMethod = 'CASH',
    this.paymentStatus = 'UNPAID',
    this.note = '',
    DateTime? createdAt,
    this.occupiedAt,
    this.paidAt,
    this.createdBy = 'Thu ngân',
    this.isSynced = false,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  OrderModel copyWith({
    String? id,
    String? orderCode,
    OrderType? type,
    String? status,
    String? tableId,
    String? tableName,
    String? areaName,
    String? customerId,
    String? customerName,
    String? customerPhone,
    List<OrderItemModel>? items,
    double? subtotal,
    double? discountPercent,
    double? discountAmount,
    double? deliveryFee,
    String? deliveryPartner,
    double? totalAmount,
    String? paymentMethod,
    String? paymentStatus,
    String? note,
    DateTime? createdAt,
    DateTime? occupiedAt,
    DateTime? paidAt,
    String? createdBy,
    bool? isSynced,
    DateTime? updatedAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      orderCode: orderCode ?? this.orderCode,
      type: type ?? this.type,
      status: status ?? this.status,
      tableId: tableId ?? this.tableId,
      tableName: tableName ?? this.tableName,
      areaName: areaName ?? this.areaName,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      discountPercent: discountPercent ?? this.discountPercent,
      discountAmount: discountAmount ?? this.discountAmount,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      deliveryPartner: deliveryPartner ?? this.deliveryPartner,
      totalAmount: totalAmount ?? this.totalAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      occupiedAt: occupiedAt ?? this.occupiedAt,
      paidAt: paidAt ?? this.paidAt,
      createdBy: createdBy ?? this.createdBy,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderCode': orderCode,
        'type': type.name,
        'status': status,
        'tableId': tableId,
        'tableName': tableName,
        'areaName': areaName,
        'customerId': customerId,
        'customerName': customerName,
        'customerPhone': customerPhone,
        'items': items.map((i) => i.toJson()).toList(),
        'subtotal': subtotal,
        'discountPercent': discountPercent,
        'discountAmount': discountAmount,
        'deliveryFee': deliveryFee,
        'deliveryPartner': deliveryPartner,
        'totalAmount': totalAmount,
        'paymentMethod': paymentMethod,
        'paymentStatus': paymentStatus,
        'note': note,
        'createdAt': createdAt.toIso8601String(),
        'occupiedAt': occupiedAt?.toIso8601String(),
        'paidAt': paidAt?.toIso8601String(),
        'createdBy': createdBy,
        'isSynced': isSynced,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] ?? '',
        orderCode: json['orderCode'] ?? '',
        type: OrderType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => OrderType.atTable,
        ),
        status: json['status'] ?? 'DRAFT',
        tableId: json['tableId'],
        tableName: json['tableName'],
        areaName: json['areaName'],
        customerId: json['customerId'],
        customerName: json['customerName'],
        customerPhone: json['customerPhone'],
        items: (json['items'] as List? ?? [])
            .map((e) => OrderItemModel.fromJson(e))
            .toList(),
        subtotal: (json['subtotal'] ?? 0.0).toDouble(),
        discountPercent: (json['discountPercent'] ?? 0.0).toDouble(),
        discountAmount: (json['discountAmount'] ?? 0.0).toDouble(),
        deliveryFee: (json['deliveryFee'] ?? 0.0).toDouble(),
        deliveryPartner: json['deliveryPartner'],
        totalAmount: (json['totalAmount'] ?? 0.0).toDouble(),
        paymentMethod: json['paymentMethod'] ?? 'CASH',
        paymentStatus: json['paymentStatus'] ?? 'UNPAID',
        note: json['note'] ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
        occupiedAt: json['occupiedAt'] != null ? DateTime.parse(json['occupiedAt']) : null,
        paidAt: json['paidAt'] != null ? DateTime.parse(json['paidAt']) : null,
        createdBy: json['createdBy'] ?? 'Thu ngân',
        isSynced: json['isSynced'] ?? false,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : DateTime.now(),
      );
}

/// Expense Model (Thu / Chi)
class ExpenseModel {
  final String id;
  final String title;
  final String categoryName;
  final String type; // INCOME hoặc EXPENSE
  final double amount;
  final String paymentMethod;
  final String note;
  final DateTime createdAt;
  final String createdBy;
  final String? supplierOrCustomerName;
  final bool isSynced;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.categoryName,
    required this.type,
    required this.amount,
    this.paymentMethod = 'CASH',
    this.note = '',
    DateTime? createdAt,
    this.createdBy = 'Admin',
    this.supplierOrCustomerName,
    this.isSynced = false,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'categoryName': categoryName,
        'type': type,
        'amount': amount,
        'paymentMethod': paymentMethod,
        'note': note,
        'createdAt': createdAt.toIso8601String(),
        'createdBy': createdBy,
        'supplierOrCustomerName': supplierOrCustomerName,
        'isSynced': isSynced,
      };

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        categoryName: json['categoryName'] ?? '',
        type: json['type'] ?? 'EXPENSE',
        amount: (json['amount'] ?? 0.0).toDouble(),
        paymentMethod: json['paymentMethod'] ?? 'CASH',
        note: json['note'] ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
        createdBy: json['createdBy'] ?? 'Admin',
        supplierOrCustomerName: json['supplierOrCustomerName'],
        isSynced: json['isSynced'] ?? false,
      );
}

/// Debt Model
class DebtModel {
  final String id;
  final String partyType; // CUSTOMER hoặc SUPPLIER
  final String partyId;
  final String partyName;
  final double amount;
  final String note;
  final DateTime createdAt;
  final bool isPaid;
  final bool isSynced;

  DebtModel({
    required this.id,
    required this.partyType,
    required this.partyId,
    required this.partyName,
    required this.amount,
    this.note = '',
    DateTime? createdAt,
    this.isPaid = false,
    this.isSynced = false,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'partyType': partyType,
        'partyId': partyId,
        'partyName': partyName,
        'amount': amount,
        'note': note,
        'createdAt': createdAt.toIso8601String(),
        'isPaid': isPaid,
        'isSynced': isSynced,
      };

  factory DebtModel.fromJson(Map<String, dynamic> json) => DebtModel(
        id: json['id'] ?? '',
        partyType: json['partyType'] ?? 'CUSTOMER',
        partyId: json['partyId'] ?? '',
        partyName: json['partyName'] ?? '',
        amount: (json['amount'] ?? 0.0).toDouble(),
        note: json['note'] ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
        isPaid: json['isPaid'] ?? false,
        isSynced: json['isSynced'] ?? false,
      );
}

/// Sync Queue Model for Vercel Cloud
class SyncQueueModel {
  final String id;
  final String tableName;
  final String recordId;
  final String action; // CREATE, UPDATE, DELETE
  final Map<String, dynamic> payload;
  final String status; // PENDING, SYNCED, FAILED
  final DateTime createdAt;
  final int retryCount;
  final String? errorMessage;

  SyncQueueModel({
    required this.id,
    required this.tableName,
    required this.recordId,
    required this.action,
    required this.payload,
    this.status = 'PENDING',
    DateTime? createdAt,
    this.retryCount = 0,
    this.errorMessage,
  }) : createdAt = createdAt ?? DateTime.now();

  SyncQueueModel copyWith({
    String? status,
    int? retryCount,
    String? errorMessage,
  }) {
    return SyncQueueModel(
      id: id,
      tableName: tableName,
      recordId: recordId,
      action: action,
      payload: payload,
      status: status ?? this.status,
      createdAt: createdAt,
      retryCount: retryCount ?? this.retryCount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'tableName': tableName,
        'recordId': recordId,
        'action': action,
        'payload': payload,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
        'retryCount': retryCount,
        'errorMessage': errorMessage,
      };

  factory SyncQueueModel.fromJson(Map<String, dynamic> json) => SyncQueueModel(
        id: json['id'] ?? '',
        tableName: json['tableName'] ?? '',
        recordId: json['recordId'] ?? '',
        action: json['action'] ?? 'CREATE',
        payload: json['payload'] is Map<String, dynamic>
            ? json['payload']
            : (json['payload'] != null
                ? jsonDecode(json['payload'].toString())
                : {}),
        status: json['status'] ?? 'PENDING',
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
        retryCount: json['retryCount'] ?? 0,
        errorMessage: json['errorMessage'],
      );
}

/// App Settings Model
class AppSettingsModel {
  final String vercelApiUrl;
  final String vercelApiKey;
  final bool isAutoSync;
  final String printerPaperSize; // 58mm hoặc 80mm
  final DateTime? lastSyncedAt;

  AppSettingsModel({
    this.vercelApiUrl = 'https://admin-web-three-tau.vercel.app/api',
    this.vercelApiKey = 'kan-cafe-pos-key',
    this.isAutoSync = true,
    this.printerPaperSize = '80mm',
    this.lastSyncedAt,
  });

  AppSettingsModel copyWith({
    String? vercelApiUrl,
    String? vercelApiKey,
    bool? isAutoSync,
    String? printerPaperSize,
    DateTime? lastSyncedAt,
  }) {
    return AppSettingsModel(
      vercelApiUrl: vercelApiUrl ?? this.vercelApiUrl,
      vercelApiKey: vercelApiKey ?? this.vercelApiKey,
      isAutoSync: isAutoSync ?? this.isAutoSync,
      printerPaperSize: printerPaperSize ?? this.printerPaperSize,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }
}
