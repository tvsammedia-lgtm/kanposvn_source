class MenuItemSize {
  final String name; // S, M, L
  final double extraPrice;

  MenuItemSize({required this.name, this.extraPrice = 0});

  Map<String, dynamic> toJson() => {'name': name, 'extraPrice': extraPrice};

  factory MenuItemSize.fromJson(Map<String, dynamic> json) => MenuItemSize(
    name: json['name'] ?? 'M',
    extraPrice: (json['extraPrice'] as num?)?.toDouble() ?? 0,
  );
}

class MenuItemTopping {
  final String id;
  final String name; // Trân châu, Pudding, Kem Cheese...
  final double price;

  MenuItemTopping({required this.id, required this.name, required this.price});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'price': price};

  factory MenuItemTopping.fromJson(Map<String, dynamic> json) =>
      MenuItemTopping(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        price: (json['price'] as num?)?.toDouble() ?? 0,
      );
}

class CafeCategory {
  final String id;
  final String
  name; // Cafe, Trà sữa, Sinh tố, Nước ép, Đá xay, Bánh ngọt, Snack
  final String iconName;
  final int sortOrder;

  CafeCategory({
    required this.id,
    required this.name,
    this.iconName = 'coffee',
    this.sortOrder = 0,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'iconName': iconName,
    'sortOrder': sortOrder,
  };

  factory CafeCategory.fromJson(Map<String, dynamic> json) => CafeCategory(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    iconName: json['iconName'] ?? 'coffee',
    sortOrder: json['sortOrder'] ?? 0,
  );
}

class CafeMenuItem {
  final String id;
  final String code;
  final String name;
  final String categoryId;
  final String categoryName;
  final double basePrice;
  final String description;
  final String imageUrl;
  final bool isAvailable;
  final List<MenuItemSize> sizes;
  final List<MenuItemTopping> availableToppings;
  final DateTime updatedAt;

  CafeMenuItem({
    required this.id,
    required this.code,
    required this.name,
    required this.categoryId,
    required this.categoryName,
    required this.basePrice,
    this.description = '',
    this.imageUrl = '',
    this.isAvailable = true,
    this.sizes = const [],
    this.availableToppings = const [],
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'categoryId': categoryId,
    'categoryName': categoryName,
    'basePrice': basePrice,
    'description': description,
    'imageUrl': imageUrl,
    'isAvailable': isAvailable,
    'sizes': sizes.map((s) => s.toJson()).toList(),
    'availableToppings': availableToppings.map((t) => t.toJson()).toList(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory CafeMenuItem.fromJson(Map<String, dynamic> json) => CafeMenuItem(
    id: json['id'] ?? '',
    code: json['code'] ?? '',
    name: json['name'] ?? '',
    categoryId: json['categoryId'] ?? '',
    categoryName: json['categoryName'] ?? '',
    basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0,
    description: json['description'] ?? '',
    imageUrl: json['imageUrl'] ?? '',
    isAvailable: json['isAvailable'] ?? true,
    sizes:
        (json['sizes'] as List?)
            ?.map((s) => MenuItemSize.fromJson(Map<String, dynamic>.from(s)))
            .toList() ??
        [
          MenuItemSize(name: 'S', extraPrice: 0),
          MenuItemSize(name: 'M', extraPrice: 5000),
          MenuItemSize(name: 'L', extraPrice: 10000),
        ],
    availableToppings:
        (json['availableToppings'] as List?)
            ?.map((t) => MenuItemTopping.fromJson(Map<String, dynamic>.from(t)))
            .toList() ??
        [],
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now(),
  );
}
