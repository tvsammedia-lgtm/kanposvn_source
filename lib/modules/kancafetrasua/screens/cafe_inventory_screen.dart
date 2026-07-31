import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/db/database_service.dart';
import '../../../core/widgets/common_widgets.dart';

class CafeInventoryScreen extends ConsumerStatefulWidget {
  const CafeInventoryScreen({super.key});

  @override
  ConsumerState<CafeInventoryScreen> createState() =>
      _CafeInventoryScreenState();
}

class _CafeInventoryScreenState extends ConsumerState<CafeInventoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(databaseServiceProvider);
    final db = DatabaseService.instance;
    final inventory = db.getCollection('inventory');
    final recipes = db.getCollection('recipes');
    final products = db.getCollection('products');

    final filteredInventory = inventory.where((item) {
      return _searchQuery.isEmpty ||
          (item['name'] as String? ?? '')
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
    }).toList();

    final lowStockCount =
        inventory.where((i) => (i['currentQuantity'] ?? 0) <= (i['minQuantity'] ?? 0)).length;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'inventory_recipe'.tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  if (lowStockCount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.danger.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.warning_amber_rounded,
                              color: AppColors.danger, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            '$lowStockCount sắp hết',
                            style: const TextStyle(
                              color: AppColors.danger,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 300,
                      child: AppSearchBar(
                        hint: 'search_hint'.tr,
                        controller: _searchController,
                        onChanged: (v) => setState(() => _searchQuery = v),
                      ),
                    ),
                  ),
                  const Spacer(),
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                      Tab(text: 'ingredients'.tr),
                      Tab(text: 'recipe'.tr),
                    ],
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, size: 20),
                    onPressed: () {
                      if (_tabController.index == 0) {
                        _showAddInventoryDialog(context);
                      } else {
                        _showAddRecipeDialog(context);
                      }
                    },
                    tooltip: 'add'.tr,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildInventoryList(filteredInventory),
              _buildRecipeList(recipes, products),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInventoryList(List<Map<String, dynamic>> items) {
    if (items.isEmpty) {
      return EmptyState(
        icon: Icons.inventory_2_rounded,
        title: 'no_ingredients'.tr,
        subtitle: 'add_ingredients_to_manage'.tr,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final currentQty = (item['currentQuantity'] ?? 0).toDouble();
        final minQty = (item['minQuantity'] ?? 0).toDouble();
        final isLow = currentQty <= minQty;

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isLow
                ? AppColors.danger.withOpacity(0.03)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isLow ? AppColors.danger.withOpacity(0.3) : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isLow
                      ? AppColors.danger.withOpacity(0.1)
                      : AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isLow ? Icons.warning_amber_rounded : Icons.inventory_2_rounded,
                  color: isLow ? AppColors.danger : AppColors.success,
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'unit'.trParams({'unit': item['unit'] ?? ''}),
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${currentQty.toStringAsFixed(currentQty == currentQty.roundToDouble() ? 0 : 1)} ${item['unit'] ?? ''}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isLow ? AppColors.danger : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'min_quantity'.trParams({'qty': minQty.toStringAsFixed(minQty == minQty.roundToDouble() ? 0 : 1)}),
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert,
                    size: 18, color: AppColors.textMuted),
                onSelected: (value) {
                  if (value == 'edit') {
                    _showEditInventoryDialog(context, item);
                  } else if (value == 'restock') {
                    _showRestockDialog(context, item);
                  } else if (value == 'delete') {
                    DatabaseService.instance
                        .deleteItem('inventory', item['id']);
                  }
                },
                itemBuilder: (_) => [
                  PopupMenuItem(value: 'edit', child: Text('edit_ingredient'.tr)),
                  PopupMenuItem(
                      value: 'restock', child: Text('restock'.tr)),
                  PopupMenuItem(value: 'delete', child: Text('delete'.tr)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecipeList(
      List<Map<String, dynamic>> recipes, List<Map<String, dynamic>> products) {
    if (recipes.isEmpty) {
      return EmptyState(
        icon: Icons.menu_book_rounded,
        title: 'no_recipes'.tr,
        subtitle: 'add_recipes_to_manage'.tr,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        final productId = recipe['productId'] ?? '';
        final product = products.firstWhere(
          (p) => p['id'] == productId,
          orElse: () => {'name': 'Không rõ'},
        );
        final ingredients = (recipe['ingredients'] as List<dynamic>?) ?? [];

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.menu_book_rounded,
                        color: AppColors.primary, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'ingredients_count'.trParams({'count': ingredients.length.toString()}),
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert,
                        size: 18, color: AppColors.textMuted),
                    onSelected: (value) {
                      if (value == 'edit') {
                        _showEditRecipeDialog(context, recipe);
                      } else if (value == 'delete') {
                        DatabaseService.instance
                            .deleteItem('recipes', recipe['id']);
                      }
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                          value: 'edit', child: Text('edit_ingredient'.tr)),
                      PopupMenuItem(
                          value: 'delete', child: Text('delete'.tr)),
                    ],
                  ),
                ],
              ),
              if (ingredients.isNotEmpty) ...[
                const SizedBox(height: 12),
                ...ingredients.map((ing) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.circle,
                            size: 6, color: AppColors.textMuted),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            ing['inventoryItemName'] ?? '',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        Text(
                          '${ing['quantityPerUnit']}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ],
          ),
        );
      },
    );
  }

  void _showAddInventoryDialog(BuildContext context) {
    final nameController = TextEditingController();
    final unitController = TextEditingController();
    final qtyController = TextEditingController(text: '0');
    final minQtyController = TextEditingController(text: '0');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('add_ingredient'.tr),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration:
                    InputDecoration(hintText: 'ingredient_name'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: unitController,
                decoration: InputDecoration(hintText: 'unit_hint'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: qtyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'current_quantity'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: minQtyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'min_quantity_hint'.tr),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty || unitController.text.isEmpty) return;
              final item = {
                'id': IdGenerator.generateId('INV'),
                'name': nameController.text,
                'unit': unitController.text,
                'currentQuantity':
                    double.tryParse(qtyController.text) ?? 0,
                'minQuantity':
                    double.tryParse(minQtyController.text) ?? 0,
              };
               DatabaseService.instance
                  .saveItem('inventory', item['id'] as String, item);
              Navigator.pop(ctx);
            },
            child: Text('add'.tr),
          ),
        ],
      ),
    );
  }

  void _showEditInventoryDialog(
      BuildContext context, Map<String, dynamic> item) {
    final nameController = TextEditingController(text: item['name'] ?? '');
    final unitController = TextEditingController(text: item['unit'] ?? '');
    final qtyController =
        TextEditingController(text: '${item['currentQuantity'] ?? 0}');
    final minQtyController =
        TextEditingController(text: '${item['minQuantity'] ?? 0}');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('edit_ingredient'.tr),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration:
                    InputDecoration(hintText: 'ingredient_name'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: unitController,
                decoration: InputDecoration(hintText: 'unit_hint'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: qtyController,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: 'current_quantity'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: minQtyController,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: 'min_quantity_hint'.tr),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              DatabaseService.instance.saveItem('inventory', item['id'], {
                ...item,
                'name': nameController.text,
                'unit': unitController.text,
                'currentQuantity':
                    double.tryParse(qtyController.text) ?? 0,
                'minQuantity':
                    double.tryParse(minQtyController.text) ?? 0,
              });
              Navigator.pop(ctx);
            },
            child: Text('save'.tr),
          ),
        ],
      ),
    );
  }

  void _showRestockDialog(BuildContext context, Map<String, dynamic> item) {
    final qtyController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('restock_title'.trParams({'name': item['name']})),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'current_stock'.trParams({
                'qty': (item['currentQuantity'] ?? 0).toString(),
                'unit': item['unit'] ?? '',
              }),
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'quantity_to_add'.tr),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              final addQty = double.tryParse(qtyController.text) ?? 0;
              if (addQty <= 0) return;
              final currentQty =
                  (item['currentQuantity'] ?? 0).toDouble();
              DatabaseService.instance.saveItem('inventory', item['id'], {
                ...item,
                'currentQuantity': currentQty + addQty,
              });
              Navigator.pop(ctx);
            },
            child: Text('restock'.tr),
          ),
        ],
      ),
    );
  }

  void _showAddRecipeDialog(BuildContext context) {
    final db = DatabaseService.instance;
    final products = db.getCollection('products');
    final inventory = db.getCollection('inventory');
    String? selectedProductId;
    final ingredients = <Map<String, dynamic>>[];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text('add_recipe'.tr),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedProductId,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: 'product'.tr),
                  items: products
                      .map((p) => DropdownMenuItem<String>(
                            value: p['id'] as String?,
                            child: Text(p['name'] ?? ''),
                          ))
                      .toList(),
                  onChanged: (v) =>
                      setDialogState(() => selectedProductId = v),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('ingredients'.tr,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton.icon(
                      icon: const Icon(Icons.add, size: 16),
                      label: Text('add'.tr),
                      onPressed: () {
                        _showAddIngredientDialog(ctx, inventory, (ing) {
                          setDialogState(() => ingredients.add(ing));
                        });
                      },
                    ),
                  ],
                ),
                ...ingredients.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final ing = entry.value;
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(ing['inventoryItemName'] ?? ''),
                    subtitle: Text('${ing['quantityPerUnit']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.close,
                          size: 16, color: AppColors.danger),
                      onPressed: () =>
                          setDialogState(() => ingredients.removeAt(idx)),
                    ),
                  );
                }),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('cancel'.tr),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedProductId == null) return;
                final recipe = {
                  'id': IdGenerator.generateId('RCP'),
                  'productId': selectedProductId,
                  'ingredients': ingredients,
                };
                db.saveItem('recipes', recipe['id'] as String, recipe);
                Navigator.pop(ctx);
              },
              child: Text('create_recipe'.tr),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditRecipeDialog(
      BuildContext context, Map<String, dynamic> recipe) {
    final db = DatabaseService.instance;
    final products = db.getCollection('products');
    final inventory = db.getCollection('inventory');
    String selectedProductId = recipe['productId'] ?? '';
    final ingredients = List<Map<String, dynamic>>.from(
        (recipe['ingredients'] as List<dynamic>?)
                ?.map((i) => Map<String, dynamic>.from(i))
                .toList() ??
            []);

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text('edit_recipe'.tr),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedProductId,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: 'product'.tr),
                  items: products
                      .map((p) => DropdownMenuItem<String>(
                            value: p['id'] as String?,
                            child: Text(p['name'] ?? ''),
                          ))
                      .toList(),
                  onChanged: (v) =>
                      setDialogState(() => selectedProductId = v!),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('ingredients'.tr,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton.icon(
                      icon: const Icon(Icons.add, size: 16),
                      label: Text('add'.tr),
                      onPressed: () {
                        _showAddIngredientDialog(ctx, inventory, (ing) {
                          setDialogState(() => ingredients.add(ing));
                        });
                      },
                    ),
                  ],
                ),
                ...ingredients.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final ing = entry.value;
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(ing['inventoryItemName'] ?? ''),
                    subtitle: Text('${ing['quantityPerUnit']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.close,
                          size: 16, color: AppColors.danger),
                      onPressed: () =>
                          setDialogState(() => ingredients.removeAt(idx)),
                    ),
                  );
                }),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('cancel'.tr),
            ),
            ElevatedButton(
              onPressed: () {
                db.saveItem('recipes', recipe['id'], {
                  ...recipe,
                  'productId': selectedProductId,
                  'ingredients': ingredients,
                });
                Navigator.pop(ctx);
              },
              child: Text('save'.tr),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddIngredientDialog(
    BuildContext context,
    List<Map<String, dynamic>> inventory,
    ValueChanged<Map<String, dynamic>> onAdded,
  ) {
    String? selectedInventoryId;
    final qtyController = TextEditingController(text: '1');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('add_ingredient'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: selectedInventoryId,
              isExpanded: true,
              decoration:
                  InputDecoration(labelText: 'ingredients'.tr),
              items: inventory
                  .map((i) => DropdownMenuItem<String>(
                        value: i['id'] as String?,
                        child: Text(i['name'] ?? ''),
                      ))
                  .toList(),
              onChanged: (v) => selectedInventoryId = v,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'quantity_per_serving'.tr),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedInventoryId == null) return;
              final inv = inventory.firstWhere(
                (i) => i['id'] == selectedInventoryId,
                orElse: () => {'name': ''},
              );
              onAdded({
                'inventoryItemId': selectedInventoryId,
                'inventoryItemName': inv['name'],
                'quantityPerUnit':
                    double.tryParse(qtyController.text) ?? 1,
              });
              Navigator.pop(ctx);
            },
            child: Text('add'.tr),
          ),
        ],
      ),
    );
  }
}
