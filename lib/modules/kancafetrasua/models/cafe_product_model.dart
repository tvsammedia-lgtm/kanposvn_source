class ProductSize {
  final String name;
  final double extraPrice;

  const ProductSize({required this.name, this.extraPrice = 0});

  Map<String, dynamic> toJson() => {
        'name': name,
        'extraPrice': extraPrice,
      };

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
        name: json['name'] ?? '',
        extraPrice: (json['extraPrice'] ?? 0).toDouble(),
      );
}

class ProductTopping {
  final String name;
  final double price;

  const ProductTopping({required this.name, this.price = 0});

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };

  factory ProductTopping.fromJson(Map<String, dynamic> json) =>
      ProductTopping(
        name: json['name'] ?? '',
        price: (json['price'] ?? 0).toDouble(),
      );
}

class CafeProductModel {
  final String id;
  final String name;
  final String categoryId;
  final double basePrice;
  final List<ProductSize> sizes;
  final List<ProductTopping> toppings;
  final String imageUrl;
  final bool isAvailable;

  const CafeProductModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.basePrice,
    this.sizes = const [],
    this.toppings = const [],
    this.imageUrl = '',
    this.isAvailable = true,
  });

  double get priceWithLargestSize {
    if (sizes.isEmpty) return basePrice;
    final maxExtra =
        sizes.map((s) => s.extraPrice).reduce((a, b) => a > b ? a : b);
    return basePrice + maxExtra;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'categoryId': categoryId,
        'basePrice': basePrice,
        'sizes': sizes.map((s) => s.toJson()).toList(),
        'toppings': toppings.map((t) => t.toJson()).toList(),
        'imageUrl': imageUrl,
        'isAvailable': isAvailable,
      };

  factory CafeProductModel.fromJson(Map<String, dynamic> json) =>
      CafeProductModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        categoryId: json['categoryId'] ?? '',
        basePrice: (json['basePrice'] ?? 0).toDouble(),
        sizes: (json['sizes'] as List<dynamic>?)
                ?.map((s) => ProductSize.fromJson(s))
                .toList() ??
            [],
        toppings: (json['toppings'] as List<dynamic>?)
                ?.map((t) => ProductTopping.fromJson(t))
                .toList() ??
            [],
        imageUrl: json['imageUrl'] ?? '',
        isAvailable: json['isAvailable'] ?? true,
      );

  CafeProductModel copyWith({
    String? id,
    String? name,
    String? categoryId,
    double? basePrice,
    List<ProductSize>? sizes,
    List<ProductTopping>? toppings,
    String? imageUrl,
    bool? isAvailable,
  }) =>
      CafeProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        basePrice: basePrice ?? this.basePrice,
        sizes: sizes ?? this.sizes,
        toppings: toppings ?? this.toppings,
        imageUrl: imageUrl ?? this.imageUrl,
        isAvailable: isAvailable ?? this.isAvailable,
      );
}
