class InventoryItemModel {
  final String id;
  final String name;
  final String unit;
  final double currentQuantity;
  final double minQuantity;

  const InventoryItemModel({
    required this.id,
    required this.name,
    required this.unit,
    this.currentQuantity = 0,
    this.minQuantity = 0,
  });

  bool get isLowStock => currentQuantity <= minQuantity;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'unit': unit,
        'currentQuantity': currentQuantity,
        'minQuantity': minQuantity,
      };

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      InventoryItemModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        unit: json['unit'] ?? '',
        currentQuantity: (json['currentQuantity'] ?? 0).toDouble(),
        minQuantity: (json['minQuantity'] ?? 0).toDouble(),
      );

  InventoryItemModel copyWith({
    String? id,
    String? name,
    String? unit,
    double? currentQuantity,
    double? minQuantity,
  }) =>
      InventoryItemModel(
        id: id ?? this.id,
        name: name ?? this.name,
        unit: unit ?? this.unit,
        currentQuantity: currentQuantity ?? this.currentQuantity,
        minQuantity: minQuantity ?? this.minQuantity,
      );
}

class RecipeIngredient {
  final String inventoryItemId;
  final String inventoryItemName;
  final double quantityPerUnit;

  const RecipeIngredient({
    required this.inventoryItemId,
    required this.inventoryItemName,
    required this.quantityPerUnit,
  });

  Map<String, dynamic> toJson() => {
        'inventoryItemId': inventoryItemId,
        'inventoryItemName': inventoryItemName,
        'quantityPerUnit': quantityPerUnit,
      };

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      RecipeIngredient(
        inventoryItemId: json['inventoryItemId'] ?? '',
        inventoryItemName: json['inventoryItemName'] ?? '',
        quantityPerUnit: (json['quantityPerUnit'] ?? 0).toDouble(),
      );

  RecipeIngredient copyWith({
    String? inventoryItemId,
    String? inventoryItemName,
    double? quantityPerUnit,
  }) =>
      RecipeIngredient(
        inventoryItemId: inventoryItemId ?? this.inventoryItemId,
        inventoryItemName: inventoryItemName ?? this.inventoryItemName,
        quantityPerUnit: quantityPerUnit ?? this.quantityPerUnit,
      );
}

class RecipeModel {
  final String id;
  final String productId;
  final List<RecipeIngredient> ingredients;

  const RecipeModel({
    required this.id,
    required this.productId,
    this.ingredients = const [],
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'ingredients': ingredients.map((i) => i.toJson()).toList(),
      };

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json['id'] ?? '',
        productId: json['productId'] ?? '',
        ingredients: (json['ingredients'] as List<dynamic>?)
                ?.map((i) => RecipeIngredient.fromJson(i))
                .toList() ??
            [],
      );

  RecipeModel copyWith({
    String? id,
    String? productId,
    List<RecipeIngredient>? ingredients,
  }) =>
      RecipeModel(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        ingredients: ingredients ?? this.ingredients,
      );
}
