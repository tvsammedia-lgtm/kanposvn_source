class RecipeIngredient {
  final String inventoryItemId;
  final String ingredientName;
  final double quantity; // e.g. 25g, 20ml
  final String unit; // g, ml, cái, quả...

  RecipeIngredient({
    required this.inventoryItemId,
    required this.ingredientName,
    required this.quantity,
    required this.unit,
  });

  Map<String, dynamic> toJson() => {
    'inventoryItemId': inventoryItemId,
    'ingredientName': ingredientName,
    'quantity': quantity,
    'unit': unit,
  };

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      RecipeIngredient(
        inventoryItemId: json['inventoryItemId'] ?? '',
        ingredientName: json['ingredientName'] ?? '',
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        unit: json['unit'] ?? 'g',
      );
}

class CafeRecipe {
  final String id;
  final String menuItemId;
  final String menuItemName;
  final List<RecipeIngredient> ingredients;
  final String note;

  CafeRecipe({
    required this.id,
    required this.menuItemId,
    required this.menuItemName,
    required this.ingredients,
    this.note = '',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'menuItemId': menuItemId,
    'menuItemName': menuItemName,
    'ingredients': ingredients.map((i) => i.toJson()).toList(),
    'note': note,
  };

  factory CafeRecipe.fromJson(Map<String, dynamic> json) => CafeRecipe(
    id: json['id'] ?? '',
    menuItemId: json['menuItemId'] ?? '',
    menuItemName: json['menuItemName'] ?? '',
    ingredients:
        (json['ingredients'] as List?)
            ?.map(
              (i) => RecipeIngredient.fromJson(Map<String, dynamic>.from(i)),
            )
            .toList() ??
        [],
    note: json['note'] ?? '',
  );
}
