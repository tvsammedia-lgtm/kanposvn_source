import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/db/database_service.dart';
import '../../../core/widgets/common_widgets.dart';
import '../models/cafe_product_model.dart';

class CafeProductsScreen extends ConsumerStatefulWidget {
  const CafeProductsScreen({super.key});

  @override
  ConsumerState<CafeProductsScreen> createState() => _CafeProductsScreenState();
}

class _CafeProductsScreenState extends ConsumerState<CafeProductsScreen> {
  String _searchQuery = '';
  String _selectedCategory = '';
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(databaseServiceProvider);
    final db = DatabaseService.instance;
    final products = db.getCollection('products');

    final categories = <String>{};
    for (final p in products) {
      final cat = p['categoryId'] as String? ?? '';
      if (cat.isNotEmpty) categories.add(cat);
    }

    final filtered = products.where((p) {
      final matchSearch = _searchQuery.isEmpty ||
          (p['name'] as String? ?? '').toLowerCase().contains(_searchQuery.toLowerCase());
      final matchCat = _selectedCategory.isEmpty || p['categoryId'] == _selectedCategory;
      return matchSearch && matchCat;
    }).toList();

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
                    'Sản phẩm',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${products.length}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 280,
                    child: AppSearchBar(
                      hint: 'Tìm sản phẩm...',
                      controller: _searchController,
                      onChanged: (v) => setState(() => _searchQuery = v),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => _showProductDialog(context),
                    icon: const Icon(Icons.add, size: 18),
                    label: Text('Thêm sản phẩm'),
                  ),
                ],
              ),
              if (categories.isNotEmpty) ...[
                const SizedBox(height: 12),
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryChip('', 'Tất cả'),
                      ...categories.map((c) => _buildCategoryChip(c, c)),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? EmptyState(
                  icon: Icons.coffee_outlined,
                  title: 'Chưa có sản phẩm',
                  subtitle: 'Nhấn "Thêm sản phẩm" để bắt đầu',
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) => _buildProductCard(filtered[index]),
                ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String id, String label) {
    final isActive = _selectedCategory == id;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => setState(() => _selectedCategory = id),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    final name = product['name'] ?? '';
    final basePrice = (product['basePrice'] ?? 0).toDouble();
    final isAvailable = product['isAvailable'] ?? true;
    final sizes = (product['sizes'] as List<dynamic>?) ?? [];
    final toppings = (product['toppings'] as List<dynamic>?) ?? [];
    final categoryId = product['categoryId'] ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.coffee_rounded,
              color: isAvailable ? AppColors.primary : AppColors.textMuted,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: isAvailable ? AppColors.textPrimary : AppColors.textMuted,
                        ),
                      ),
                    ),
                    if (!isAvailable)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.danger.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Ẩn',
                          style: TextStyle(color: AppColors.danger, fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (categoryId.isNotEmpty) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceAlt,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          categoryId,
                          style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      '${sizes.length} size',
                      style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${toppings.length} topping',
                      style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            AppFormatters.formatCurrency(basePrice),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, size: 18, color: AppColors.textMuted),
            onSelected: (value) {
              if (value == 'edit') {
                _showProductDialog(context, product: product);
              } else if (value == 'toggle') {
                _toggleAvailability(product);
              } else if (value == 'delete') {
                _deleteProduct(product);
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'edit', child: Text('Chỉnh sửa')),
              PopupMenuItem(
                value: 'toggle',
                child: Text(isAvailable ? 'Ẩn sản phẩm' : 'Hiện sản phẩm'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Xóa', style: TextStyle(color: AppColors.danger)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleAvailability(Map<String, dynamic> product) {
    DatabaseService.instance.saveItem('products', product['id'], {
      ...product,
      'isAvailable': !(product['isAvailable'] ?? true),
    });
  }

  void _deleteProduct(Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa sản phẩm'),
        content: Text('Xóa "${product['name']}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              DatabaseService.instance.deleteItem('products', product['id']);
              Navigator.pop(ctx);
            },
            child: const Text('Xóa', style: TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }

  void _showProductDialog(BuildContext context, {Map<String, dynamic>? product}) {
    final isEdit = product != null;
    final nameController = TextEditingController(text: product?['name'] ?? '');
    final priceController = TextEditingController(text: '${product?['basePrice'] ?? ''}');
    final categoryController = TextEditingController(text: product?['categoryId'] ?? '');
    List<Map<String, dynamic>> sizes = List<Map<String, dynamic>>.from(
        (product?['sizes'] as List<dynamic>?)?.map((s) => Map<String, dynamic>.from(s)).toList() ?? []);
    List<Map<String, dynamic>> toppings = List<Map<String, dynamic>>.from(
        (product?['toppings'] as List<dynamic>?)?.map((t) => Map<String, dynamic>.from(t)).toList() ?? []);

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(isEdit ? 'Sửa sản phẩm' : 'Thêm sản phẩm'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Giá cơ bản (VNĐ)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(labelText: 'Danh mục (vd: cf, ts, an)'),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton.icon(
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Thêm'),
                      onPressed: () => _showAddSizeDialog(ctx, setDialogState, sizes),
                    ),
                  ],
                ),
                ...sizes.asMap().entries.map((entry) {
                  final i = entry.key;
                  final s = entry.value;
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(s['name'] ?? ''),
                    subtitle: Text('+${AppFormatters.formatCurrency((s['extraPrice'] ?? 0).toDouble())}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, size: 16, color: AppColors.danger),
                      onPressed: () => setDialogState(() => sizes.removeAt(i)),
                    ),
                  );
                }),
                const Divider(),
                Row(
                  children: [
                    const Text('Topping', style: TextStyle(fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton.icon(
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Thêm'),
                      onPressed: () => _showAddToppingDialog(ctx, setDialogState, toppings),
                    ),
                  ],
                ),
                ...toppings.asMap().entries.map((entry) {
                  final i = entry.key;
                  final t = entry.value;
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(t['name'] ?? ''),
                    subtitle: Text('+${AppFormatters.formatCurrency((t['price'] ?? 0).toDouble())}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, size: 16, color: AppColors.danger),
                      onPressed: () => setDialogState(() => toppings.removeAt(i)),
                    ),
                  );
                }),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty || priceController.text.isEmpty) return;
                final p = CafeProductModel(
                  id: product?['id'] ?? IdGenerator.generateId('PRD'),
                  name: nameController.text,
                  categoryId: categoryController.text,
                  basePrice: double.tryParse(priceController.text) ?? 0,
                  sizes: sizes.map((s) => ProductSize.fromJson(s)).toList(),
                  toppings: toppings.map((t) => ProductTopping.fromJson(t)).toList(),
                  isAvailable: product?['isAvailable'] ?? true,
                );
                DatabaseService.instance.saveItem('products', p.id, p.toJson());
                Navigator.pop(ctx);
              },
              child: Text(isEdit ? 'Lưu' : 'Thêm'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddSizeDialog(BuildContext context, StateSetter setDialogState, List<Map<String, dynamic>> sizes) {
    final nameController = TextEditingController();
    final priceController = TextEditingController(text: '0');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm size'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Tên size')),
            const SizedBox(height: 12),
            TextField(controller: priceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Giá thêm (VNĐ)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty) return;
              setDialogState(() => sizes.add({
                'name': nameController.text,
                'extraPrice': double.tryParse(priceController.text) ?? 0,
              }));
              Navigator.pop(ctx);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _showAddToppingDialog(BuildContext context, StateSetter setDialogState, List<Map<String, dynamic>> toppings) {
    final nameController = TextEditingController();
    final priceController = TextEditingController(text: '0');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm topping'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Tên topping')),
            const SizedBox(height: 12),
            TextField(controller: priceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Giá (VNĐ)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty) return;
              setDialogState(() => toppings.add({
                'name': nameController.text,
                'price': double.tryParse(priceController.text) ?? 0,
              }));
              Navigator.pop(ctx);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }
}
