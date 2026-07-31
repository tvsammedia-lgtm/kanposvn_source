import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../core/utils/formatters.dart';
import '../src/providers/app_providers.dart';
import '../src/models/isar_models.dart';

class CafeProductManageScreen extends ConsumerStatefulWidget {
  const CafeProductManageScreen({super.key});

  @override
  ConsumerState<CafeProductManageScreen> createState() => _CafeProductManageScreenState();
}

class _CafeProductManageScreenState extends ConsumerState<CafeProductManageScreen> {
  final _uuid = const Uuid();
  String _searchQuery = '';
  String _selectedCategoryId = '';
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(dbProvider);
    final products = db.products;
    final categories = db.categories;

    final filtered = products.where((p) {
      final matchSearch = _searchQuery.isEmpty ||
          p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.code.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchCat = _selectedCategoryId.isEmpty || p.categoryId == _selectedCategoryId;
      return matchSearch && matchCat;
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Quản lý món', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: const Color(0xFF4A2C2A).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                      child: Text('${products.length}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF4A2C2A))),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 220,
                      height: 34,
                      child: TextField(
                        controller: _searchCtrl,
                        onChanged: (v) => setState(() => _searchQuery = v),
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          hintText: 'Tìm món...',
                          prefixIcon: const Icon(Icons.search, size: 16),
                          isDense: true,
                          filled: true,
                          fillColor: const Color(0xFFF9F6F0),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Color(0xFF4A2C2A), size: 24),
                      onPressed: () => _showProductDialog(context, db),
                      tooltip: 'Thêm món',
                    ),
                    IconButton(
                      icon: const Icon(Icons.category, color: Color(0xFF4A2C2A), size: 22),
                      onPressed: () => _showCategoryDialog(context, db),
                      tooltip: 'Quản lý danh mục',
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 34,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ChoiceChip(
                        label: const Text('Tất cả', style: TextStyle(fontSize: 11)),
                        selected: _selectedCategoryId.isEmpty,
                        onSelected: (_) => setState(() => _selectedCategoryId = ''),
                        selectedColor: const Color(0xFF4A2C2A),
                        labelStyle: TextStyle(color: _selectedCategoryId.isEmpty ? Colors.white : Colors.black, fontSize: 11),
                        visualDensity: VisualDensity.compact,
                      ),
                      const SizedBox(width: 4),
                      ...categories.map((cat) {
                        final isSel = _selectedCategoryId == cat.id;
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: ChoiceChip(
                            label: Text(cat.name, style: const TextStyle(fontSize: 11)),
                            selected: isSel,
                            onSelected: (_) => setState(() => _selectedCategoryId = isSel ? '' : cat.id),
                            selectedColor: const Color(0xFF4A2C2A),
                            labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black, fontSize: 11),
                            visualDensity: VisualDensity.compact,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.coffee_outlined, size: 48, color: Colors.grey[300]),
                        const SizedBox(height: 12),
                        Text('Chưa có món nào', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: filtered.length,
                    itemBuilder: (_, i) => _buildProductCard(filtered[i], db),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(ProductModel p, dynamic db) {
    final color = p.isAvailable ? const Color(0xFF4A2C2A) : Colors.grey;
    final matched = db.categories.where((c) => c.id == p.categoryId).toList();
    final categoryName = matched.isNotEmpty ? matched.first.name : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () => _showProductDialog(context, db, product: p),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.coffee_rounded, color: color, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis)),
                        if (!p.isAvailable)
                          Container(
                            margin: const EdgeInsets.only(left: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(8)),
                            child: Text('Ẩn', style: TextStyle(fontSize: 9, color: Colors.orange[800], fontWeight: FontWeight.w600)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(p.code, style: TextStyle(fontSize: 10, color: Colors.grey[500])),
                        if (categoryName.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(color: Colors.brown[50], borderRadius: BorderRadius.circular(4)),
                            child: Text(categoryName, style: TextStyle(fontSize: 9, color: Colors.brown[700])),
                          ),
                        ],
                        if (p.sizes.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text('${p.sizes.length} size', style: TextStyle(fontSize: 9, color: Colors.grey[500])),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(AppFormatters.formatCurrency(p.basePrice),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF4A2C2A))),
              const SizedBox(width: 4),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, size: 18, color: Colors.grey[500]),
                onSelected: (v) {
                  if (v == 'edit') _showProductDialog(context, db, product: p);
                  if (v == 'toggle') {
                    final updated = ProductModel(
                      id: p.id, categoryId: p.categoryId, categoryName: p.categoryName,
                      code: p.code, name: p.name, basePrice: p.basePrice,
                      sizes: p.sizes, toppings: p.toppings, isAvailable: !p.isAvailable,
                    );
                    db.addOrUpdateProduct(updated);
                  }
                  if (v == 'delete') _confirmDelete(context, db, p);
                },
                itemBuilder: (_) => [
                  const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                  PopupMenuItem(value: 'toggle', child: Text(p.isAvailable ? 'Ẩn' : 'Hiện')),
                  const PopupMenuItem(value: 'delete', child: Text('Xóa', style: TextStyle(color: Colors.red))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, dynamic db, ProductModel p) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa món'),
        content: Text('Xóa "${p.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              db.deleteProduct(p.id);
              Navigator.pop(ctx);
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showProductDialog(BuildContext context, dynamic db, {ProductModel? product}) {
    final isEdit = product != null;
    final nameCtrl = TextEditingController(text: product?.name ?? '');
    final codeCtrl = TextEditingController(text: product?.code ?? '');
    final priceCtrl = TextEditingController(text: product != null ? '${product.basePrice.toInt()}' : '');
    final categories = db.categories;
    String categoryId = product?.categoryId ?? (categories.isNotEmpty ? categories.first.id : '');
    List<ProductSize> sizes = List<ProductSize>.from(product?.sizes ?? []);
    List<ProductTopping> toppings = List<ProductTopping>.from(product?.toppings ?? []);

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: Text(isEdit ? 'Sửa món' : 'Thêm món mới'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên món', hintText: 'VD: Cafe Sữa Đá')),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(controller: codeCtrl, decoration: const InputDecoration(labelText: 'Mã món', hintText: 'VD: CF01')),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(controller: priceCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Giá (VNĐ)')),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (categories.isNotEmpty)
                    DropdownButtonFormField<String>(
                      value: categoryId,
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Danh mục'),
                      items: categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
                      onChanged: (v) => setD(() => categoryId = v!),
                    ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text('Size', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const Spacer(),
                      TextButton.icon(
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Thêm size', style: TextStyle(fontSize: 12)),
                        onPressed: () => _addSizeDialog(context, setD, sizes),
                      ),
                    ],
                  ),
                  ...sizes.asMap().entries.map((e) => ListTile(
                    dense: true, contentPadding: EdgeInsets.zero,
                    title: Text(e.value.name, style: const TextStyle(fontSize: 13)),
                    subtitle: Text('+${AppFormatters.formatCurrency(e.value.extraPrice)}', style: const TextStyle(fontSize: 11)),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, size: 16, color: Colors.red),
                      onPressed: () => setD(() => sizes.removeAt(e.key)),
                    ),
                  )),
                  const Divider(height: 8),
                  Row(
                    children: [
                      const Text('Topping', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const Spacer(),
                      TextButton.icon(
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Thêm topping', style: TextStyle(fontSize: 12)),
                        onPressed: () => _addToppingDialog(context, setD, toppings),
                      ),
                    ],
                  ),
                  ...toppings.asMap().entries.map((e) => ListTile(
                    dense: true, contentPadding: EdgeInsets.zero,
                    title: Text(e.value.name, style: const TextStyle(fontSize: 13)),
                    subtitle: Text('+${AppFormatters.formatCurrency(e.value.price)}', style: const TextStyle(fontSize: 11)),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, size: 16, color: Colors.red),
                      onPressed: () => setD(() => toppings.removeAt(e.key)),
                    ),
                  )),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isEmpty || priceCtrl.text.isEmpty) return;
                final matched = categories.where((c) => c.id == categoryId).toList();
                final newP = ProductModel(
                  id: product?.id ?? 'prd_${DateTime.now().millisecondsSinceEpoch}',
                  categoryId: categoryId,
                  categoryName: matched.isNotEmpty ? matched.first.name : '',
                  code: codeCtrl.text.isNotEmpty ? codeCtrl.text : 'PRD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
                  name: nameCtrl.text,
                  basePrice: double.tryParse(priceCtrl.text) ?? 0,
                  sizes: sizes,
                  toppings: toppings,
                  isAvailable: product?.isAvailable ?? true,
                );
                db.addOrUpdateProduct(newP);
                Navigator.pop(ctx);
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A2C2A), foregroundColor: Colors.white),
              child: Text(isEdit ? 'Lưu' : 'Thêm'),
            ),
          ],
        ),
      ),
    );
  }

  void _addSizeDialog(BuildContext context, StateSetter setD, List<ProductSize> sizes) {
    final nameCtrl = TextEditingController();
    final priceCtrl = TextEditingController(text: '0');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm size'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên size', hintText: 'VD: M, L')),
          const SizedBox(height: 12),
          TextField(controller: priceCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Giá thêm (VNĐ)')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty) return;
              setD(() => sizes.add(ProductSize(name: nameCtrl.text, extraPrice: double.tryParse(priceCtrl.text) ?? 0)));
              Navigator.pop(ctx);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _addToppingDialog(BuildContext context, StateSetter setD, List<ProductTopping> toppings) {
    final nameCtrl = TextEditingController();
    final priceCtrl = TextEditingController(text: '0');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm topping'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên topping', hintText: 'VD: Trân Châu')),
          const SizedBox(height: 12),
          TextField(controller: priceCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Giá (VNĐ)')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty) return;
              setD(() => toppings.add(ProductTopping(id: _uuid.v4(), name: nameCtrl.text, price: double.tryParse(priceCtrl.text) ?? 0)));
              Navigator.pop(ctx);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _showCategoryDialog(BuildContext context, dynamic db) {
    final categories = db.categories;
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: const Text('Quản lý danh mục'),
          content: SizedBox(
            width: 300,
            child: categories.isEmpty
                ? const Center(child: Text('Chưa có danh mục'))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (_, i) {
                      final c = categories[i];
                      return ListTile(
                        dense: true,
                        title: Text('${c.displayOrder}. ${c.name}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                          onPressed: () {
                            final cnt = db.products.where((p) => p.categoryId == c.id).length;
                            if (cnt > 0) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Còn $cnt món thuộc danh mục này, không thể xóa')));
                              return;
                            }
                            db.deleteCategory(c.id);
                            setD(() {});
                          },
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Đóng')),
            ElevatedButton.icon(
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Thêm danh mục'),
              onPressed: () {
                Navigator.pop(ctx);
                _showAddCategoryDialog(context, db);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context, dynamic db) {
    final nameCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm danh mục'),
        content: TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên danh mục', hintText: 'VD: Cafe, Trà Sữa')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty) return;
              final id = 'cat_${DateTime.now().millisecondsSinceEpoch}';
              db.addOrUpdateCategory(CategoryModel(
                id: id,
                name: nameCtrl.text,
                displayOrder: db.categories.length + 1,
              ));
              Navigator.pop(ctx);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }
}
