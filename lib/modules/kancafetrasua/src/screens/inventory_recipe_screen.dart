import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class InventoryRecipeScreen extends ConsumerStatefulWidget {
  const InventoryRecipeScreen({super.key});

  @override
  ConsumerState<InventoryRecipeScreen> createState() => _InventoryRecipeScreenState();
}

class _InventoryRecipeScreenState extends ConsumerState<InventoryRecipeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);

    final filteredInventory = db.inventory.where((item) {
      return _searchQuery.isEmpty ||
          item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.sku.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    final lowStockCount = db.inventory.where((i) => i.isLowStock).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: Column(
        children: [
          // Header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Kho & Công Thức', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    const Spacer(),
                    if (lowStockCount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                        child: Text('$lowStockCount sắp hết', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Color(0xFF4A2C2A)),
                      onPressed: () {
                        if (_tabCtrl.index == 0) {
                          _showAddInventoryDialog(context, ref);
                        } else {
                          _showAddRecipeDialog(context, ref);
                        }
                      },
                    ),
                  ],
                ),
                // Search
                TextField(
                  onChanged: (v) => setState(() => _searchQuery = v),
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm...',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    isDense: true,
                    filled: true,
                    fillColor: const Color(0xFFF9F6F0),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 8),
                // Tabs
                TabBar(
                  controller: _tabCtrl,
                  labelColor: const Color(0xFF4A2C2A),
                  indicatorColor: const Color(0xFF4A2C2A),
                  tabs: [
                    Tab(text: 'Tồn kho (${db.inventory.length})'),
                    Tab(text: 'Công thức (${db.recipes.length})'),
                  ],
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: TabBarView(
              controller: _tabCtrl,
              children: [
                _buildInventoryTab(currency, filteredInventory, ref),
                _buildRecipeTab(currency, db, ref),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===== INVENTORY TAB =====
  Widget _buildInventoryTab(NumberFormat currency, List<InventoryItemModel> items, WidgetRef ref) {
    if (items.isEmpty) {
      return const Center(child: Text('Chưa có nguyên liệu kho', style: TextStyle(color: Colors.grey)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (ctx, i) {
        final item = items[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: item.isLowStock ? Colors.red.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: item.isLowStock ? Colors.red.shade200 : Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: item.isLowStock ? Colors.red.shade100 : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(item.isLowStock ? Icons.warning_amber_rounded : Icons.inventory_2_rounded,
                    color: item.isLowStock ? Colors.red : Colors.green, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
                        if (item.isLowStock)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                            child: const Text('HẾT KHO', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('SKU: ${item.sku} • ${currency.format(item.costPrice)}/${item.unit}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                    if (item.supplierName != null)
                      Text('NCC: ${item.supplierName}', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${item.currentStock}', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,
                      color: item.isLowStock ? Colors.red : const Color(0xFF4A2C2A))),
                  Text('${item.unit} (min: ${item.minStock})', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 4),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, size: 18, color: Colors.grey),
                onSelected: (v) {
                  if (v == 'edit') _showEditInventoryDialog(context, ref, item);
                  if (v == 'restock') _showRestockDialog(context, ref, item);
                  if (v == 'delete') _confirmDeleteInventory(context, ref, item);
                },
                itemBuilder: (_) => [
                  const PopupMenuItem(value: 'edit', child: Text('Chỉnh sửa')),
                  const PopupMenuItem(value: 'restock', child: Text('Nhập kho')),
                  const PopupMenuItem(value: 'delete', child: Text('Xóa', style: TextStyle(color: Colors.red))),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // ===== RECIPE TAB =====
  Widget _buildRecipeTab(NumberFormat currency, dynamic db, WidgetRef ref) {
    if (db.recipes.isEmpty) {
      return const Center(child: Text('Chưa có công thức pha chế', style: TextStyle(color: Colors.grey)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: db.recipes.length,
      itemBuilder: (ctx, i) {
        final recipe = db.recipes[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(color: const Color(0xFF4A2C2A).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.coffee_rounded, color: Color(0xFF4A2C2A), size: 18),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(recipe.productName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, size: 18, color: Colors.grey),
                    onSelected: (v) {
                      if (v == 'edit') _showEditRecipeDialog(context, ref, recipe);
                      if (v == 'delete') _confirmDeleteRecipe(context, ref, recipe);
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(value: 'edit', child: Text('Chỉnh sửa')),
                      const PopupMenuItem(value: 'delete', child: Text('Xóa', style: TextStyle(color: Colors.red))),
                    ],
                  ),
                ],
              ),
              const Divider(height: 12),
              if (recipe.ingredients.isEmpty)
                const Text('Chưa có nguyên liệu', style: TextStyle(color: Colors.grey, fontSize: 12))
              else
                ...recipe.ingredients.map((ing) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.circle, size: 6, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(child: Text(ing.ingredientName, style: const TextStyle(fontSize: 12))),
                      Text('${ing.quantityNeeded} ${ing.unit}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    ],
                  ),
                )),
            ],
          ),
        );
      },
    );
  }

  // ===== ADD INVENTORY =====
  void _showAddInventoryDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final skuCtrl = TextEditingController();
    final unitCtrl = TextEditingController();
    final stockCtrl = TextEditingController(text: '0');
    final minCtrl = TextEditingController(text: '0');
    final costCtrl = TextEditingController(text: '0');
    final supplierCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm nguyên liệu'),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên nguyên liệu *')),
            const SizedBox(height: 10),
            TextField(controller: skuCtrl, decoration: const InputDecoration(labelText: 'Mã SKU')),
            const SizedBox(height: 10),
            TextField(controller: unitCtrl, decoration: const InputDecoration(labelText: 'Đơn vị (kg, lít, lon...)')),
            const SizedBox(height: 10),
            TextField(controller: stockCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Tồn kho hiện tại')),
            const SizedBox(height: 10),
            TextField(controller: minCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Tồn kho tối thiểu')),
            const SizedBox(height: 10),
            TextField(controller: costCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Đơn giá nhập')),
            const SizedBox(height: 10),
            TextField(controller: supplierCtrl, decoration: const InputDecoration(labelText: 'Nhà cung cấp')),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty) return;
              final item = InventoryItemModel(
                id: 'inv_${DateTime.now().millisecondsSinceEpoch}',
                name: nameCtrl.text,
                sku: skuCtrl.text,
                unit: unitCtrl.text,
                currentStock: double.tryParse(stockCtrl.text) ?? 0,
                minStock: double.tryParse(minCtrl.text) ?? 0,
                costPrice: double.tryParse(costCtrl.text) ?? 0,
                supplierName: supplierCtrl.text.isNotEmpty ? supplierCtrl.text : null,
              );
              ref.read(dbProvider).addOrUpdateInventoryItem(item);
              Navigator.pop(ctx);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  // ===== EDIT INVENTORY =====
  void _showEditInventoryDialog(BuildContext context, WidgetRef ref, InventoryItemModel item) {
    final nameCtrl = TextEditingController(text: item.name);
    final skuCtrl = TextEditingController(text: item.sku);
    final unitCtrl = TextEditingController(text: item.unit);
    final stockCtrl = TextEditingController(text: '${item.currentStock}');
    final minCtrl = TextEditingController(text: '${item.minStock}');
    final costCtrl = TextEditingController(text: '${item.costPrice}');
    final supplierCtrl = TextEditingController(text: item.supplierName ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sửa nguyên liệu'),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên *')),
            const SizedBox(height: 10),
            TextField(controller: skuCtrl, decoration: const InputDecoration(labelText: 'SKU')),
            const SizedBox(height: 10),
            TextField(controller: unitCtrl, decoration: const InputDecoration(labelText: 'Đơn vị')),
            const SizedBox(height: 10),
            TextField(controller: stockCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Tồn kho')),
            const SizedBox(height: 10),
            TextField(controller: minCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Tối thiểu')),
            const SizedBox(height: 10),
            TextField(controller: costCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Giá nhập')),
            const SizedBox(height: 10),
            TextField(controller: supplierCtrl, decoration: const InputDecoration(labelText: 'NCC')),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              final updated = item.copyWith(
                name: nameCtrl.text,
                sku: skuCtrl.text,
                unit: unitCtrl.text,
                currentStock: double.tryParse(stockCtrl.text) ?? item.currentStock,
                minStock: double.tryParse(minCtrl.text) ?? item.minStock,
                costPrice: double.tryParse(costCtrl.text) ?? item.costPrice,
                supplierName: supplierCtrl.text.isNotEmpty ? supplierCtrl.text : null,
              );
              ref.read(dbProvider).addOrUpdateInventoryItem(updated);
              Navigator.pop(ctx);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  // ===== RESTOCK =====
  void _showRestockDialog(BuildContext context, WidgetRef ref, InventoryItemModel item) {
    final qtyCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Nhập kho: ${item.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Tồn hiện tại: ${item.currentStock} ${item.unit}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            TextField(controller: qtyCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Số lượng nhập')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              final addQty = double.tryParse(qtyCtrl.text) ?? 0;
              if (addQty <= 0) return;
              ref.read(dbProvider).addOrUpdateInventoryItem(
                item.copyWith(currentStock: item.currentStock + addQty),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Nhập kho'),
          ),
        ],
      ),
    );
  }

  // ===== DELETE INVENTORY =====
  void _confirmDeleteInventory(BuildContext context, WidgetRef ref, InventoryItemModel item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa nguyên liệu'),
        content: Text('Xóa "${item.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              // Remove from inventory list and recipes
              final db = ref.read(dbProvider);
              final updatedInventory = db.inventory.where((i) => i.id != item.id).toList();
              // Update all recipes that use this ingredient
              for (var recipe in db.recipes) {
                final updatedIngredients = recipe.ingredients.where((ing) => ing.inventoryItemId != item.id).toList();
                if (updatedIngredients.length != recipe.ingredients.length) {
                  // Recipe had this ingredient - remove it
                  final updatedRecipe = RecipeModel(
                    id: recipe.id,
                    productId: recipe.productId,
                    productName: recipe.productName,
                    ingredients: updatedIngredients,
                  );
                  db.addOrUpdateRecipe(updatedRecipe);
                }
              }
              // Delete inventory item (we need a delete method)
              db.deleteInventoryItem(item.id);
              Navigator.pop(ctx);
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // ===== ADD RECIPE =====
  void _showAddRecipeDialog(BuildContext context, WidgetRef ref) {
    final db = ref.read(dbProvider);
    String? selectedProductId;
    final ingredients = <RecipeIngredient>[];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, set) => AlertDialog(
          title: const Text('Thêm công thức'),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              DropdownButtonFormField<String>(
                value: selectedProductId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Sản phẩm *'),
                items: db.products.map((p) => DropdownMenuItem(value: p.id, child: Text('${p.code} - ${p.name}'))).toList(),
                onChanged: (v) => set(() => selectedProductId = v),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text('Nguyên liệu', style: TextStyle(fontWeight: FontWeight.w600)),
                  const Spacer(),
                  TextButton.icon(
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Thêm'),
                    onPressed: () => _showAddIngredientDialog(ctx, set, db.inventory, ingredients),
                  ),
                ],
              ),
              ...ingredients.asMap().entries.map((entry) {
                final idx = entry.key;
                final ing = entry.value;
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(ing.ingredientName, style: const TextStyle(fontSize: 13)),
                  subtitle: Text('${ing.quantityNeeded} ${ing.unit}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.close, size: 16, color: Colors.red),
                    onPressed: () => set(() => ingredients.removeAt(idx)),
                  ),
                );
              }),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                if (selectedProductId == null || ingredients.isEmpty) return;
                final product = db.products.firstWhere((p) => p.id == selectedProductId);
                final recipe = RecipeModel(
                  id: 'rec_${DateTime.now().millisecondsSinceEpoch}',
                  productId: selectedProductId!,
                  productName: product.name,
                  ingredients: ingredients,
                );
                db.addOrUpdateRecipe(recipe);
                Navigator.pop(ctx);
              },
              child: const Text('Tạo'),
            ),
          ],
        ),
      ),
    );
  }

  // ===== EDIT RECIPE =====
  void _showEditRecipeDialog(BuildContext context, WidgetRef ref, RecipeModel recipe) {
    final db = ref.read(dbProvider);
    final ingredients = List<RecipeIngredient>.from(recipe.ingredients);

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, set) => AlertDialog(
          title: Text('Sửa: ${recipe.productName}'),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(recipe.productName, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text('Nguyên liệu', style: TextStyle(fontWeight: FontWeight.w600)),
                  const Spacer(),
                  TextButton.icon(
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Thêm'),
                    onPressed: () => _showAddIngredientDialog(ctx, set, db.inventory, ingredients),
                  ),
                ],
              ),
              ...ingredients.asMap().entries.map((entry) {
                final idx = entry.key;
                final ing = entry.value;
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(ing.ingredientName, style: const TextStyle(fontSize: 13)),
                  subtitle: Text('${ing.quantityNeeded} ${ing.unit}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.close, size: 16, color: Colors.red),
                    onPressed: () => set(() => ingredients.removeAt(idx)),
                  ),
                );
              }),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                if (ingredients.isEmpty) return;
                db.addOrUpdateRecipe(RecipeModel(
                  id: recipe.id,
                  productId: recipe.productId,
                  productName: recipe.productName,
                  ingredients: ingredients,
                ));
                Navigator.pop(ctx);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  // ===== ADD INGREDIENT DIALOG =====
  void _showAddIngredientDialog(BuildContext context, StateSetter setModal, List<InventoryItemModel> inventory, List<RecipeIngredient> ingredients) {
    String? selectedId;
    final qtyCtrl = TextEditingController(text: '1');
    String selectedUnit = 'kg';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, set) => AlertDialog(
          title: const Text('Thêm nguyên liệu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Nguyên liệu'),
                items: inventory.map((i) => DropdownMenuItem(value: i.id, child: Text(i.name))).toList(),
                onChanged: (v) {
                  set(() => selectedId = v);
                  final item = inventory.firstWhere((i) => i.id == v);
                  selectedUnit = item.unit;
                },
              ),
              const SizedBox(height: 10),
              TextField(controller: qtyCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Số lượng')),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                if (selectedId == null) return;
                final item = inventory.firstWhere((i) => i.id == selectedId);
                setModal(() => ingredients.add(RecipeIngredient(
                  inventoryItemId: selectedId!,
                  ingredientName: item.name,
                  quantityNeeded: double.tryParse(qtyCtrl.text) ?? 1,
                  unit: item.unit,
                )));
                Navigator.pop(ctx);
              },
              child: const Text('Thêm'),
            ),
          ],
        ),
      ),
    );
  }

  // ===== DELETE RECIPE =====
  void _confirmDeleteRecipe(BuildContext context, WidgetRef ref, RecipeModel recipe) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa công thức'),
        content: Text('Xóa công thức "${recipe.productName}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              ref.read(dbProvider).deleteRecipe(recipe.id);
              Navigator.pop(ctx);
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
