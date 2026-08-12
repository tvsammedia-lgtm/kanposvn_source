import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/vlxd_product.dart';
import '../providers/vlxd_providers.dart';

String _fmtMoney(double value) {
  final isNegative = value < 0;
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) {
      buf.write('.');
    }
    buf.write(abs[i]);
  }
  return '${isNegative ? '-' : ''}${buf.toString()} đ';
}

double _parseDouble(String value) {
  final normalized = value.trim().replaceAll('.', '').replaceAll(',', '.');
  return double.tryParse(normalized) ?? 0;
}

class VlxdMaterialsScreen extends ConsumerStatefulWidget {
  const VlxdMaterialsScreen({super.key});

  @override
  ConsumerState<VlxdMaterialsScreen> createState() => _VlxdMaterialsScreenState();
}

class _VlxdMaterialsScreenState extends ConsumerState<VlxdMaterialsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedCategoryId;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _showProductDialog({
    VlxdProduct? product,
    required List<VlxdProductCategory> categories,
  }) async {
    final formKey = GlobalKey<FormState>();
    final codeController = TextEditingController(text: product?.productCode ?? '');
    final barcodeController = TextEditingController(text: product?.barcode ?? '');
    final nameController = TextEditingController(text: product?.productName ?? '');
    final unitController = TextEditingController(text: product?.unit ?? 'Tấn');
    final specController = TextEditingController(text: product?.specification ?? '');
    final purchaseController = TextEditingController(text: (product?.purchasePrice ?? 0).toStringAsFixed(0));
    final retailController = TextEditingController(text: (product?.retailPrice ?? 0).toStringAsFixed(0));
    final wholesaleController = TextEditingController(text: (product?.wholesalePrice ?? 0).toStringAsFixed(0));
    final dealerController = TextEditingController(text: (product?.dealerPrice ?? 0).toStringAsFixed(0));
    final vatController = TextEditingController(text: (product?.vatRate ?? 0).toStringAsFixed(0));
    final weightController = TextEditingController(text: (product?.weightPerUnit ?? 0).toStringAsFixed(0));
    final dimensionController = TextEditingController(text: product?.dimensions ?? '');
    final imageController = TextEditingController(text: product?.imageUrl ?? '');
    String? selectedCategoryId = product?.category.value?.categoryId;
    bool isSaving = false;

    if (selectedCategoryId == null && categories.isNotEmpty) {
      selectedCategoryId = categories.first.categoryId;
    }

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            Future<void> saveProduct() async {
              if (!(formKey.currentState?.validate() ?? false)) return;
              if (selectedCategoryId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chọn nhóm vật tư trước khi lưu.')),
                );
                return;
              }

              setState(() => isSaving = true);
              try {
                final db = await ref.read(vlxdIsarServiceProvider).db;
                final category = categories.where((item) => item.categoryId == selectedCategoryId).toList().first;
                final item = product ?? VlxdProduct();
                item.productId = product?.productId ?? const Uuid().v4();
                item.productCode = codeController.text.trim();
                item.barcode = barcodeController.text.trim();
                item.productName = nameController.text.trim();
                item.unit = unitController.text.trim();
                item.specification = specController.text.trim();
                item.purchasePrice = _parseDouble(purchaseController.text);
                item.retailPrice = _parseDouble(retailController.text);
                item.wholesalePrice = _parseDouble(wholesaleController.text);
                item.dealerPrice = _parseDouble(dealerController.text);
                item.vatRate = _parseDouble(vatController.text);
                item.weightPerUnit = _parseDouble(weightController.text);
                item.dimensions = dimensionController.text.trim();
                item.imageUrl = imageController.text.trim();
                item.deletedAt = null;
                item.updatedAt = DateTime.now();
                item.createdAt = product?.createdAt ?? DateTime.now();
                item.category.value = category;

                await db.writeTxn(() async {
                  await db.vlxdProducts.put(item);
                  await item.category.save();
                });

                if (dialogContext.mounted) Navigator.pop(dialogContext);
                await ref.read(vlxdProductsProvider.notifier).loadProducts();
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(product == null ? 'Đã thêm vật tư.' : 'Đã cập nhật vật tư.'),
                    ),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Không thể lưu vật tư: $e')),
                  );
                }
              } finally {
                if (dialogContext.mounted) {
                  setState(() => isSaving = false);
                }
              }
            }

            return AlertDialog(
              title: Text(product == null ? 'Thêm vật tư' : 'Sửa vật tư'),
              content: SizedBox(
                width: 760,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        SizedBox(
                          width: 220,
                          child: TextFormField(
                            controller: codeController,
                            decoration: const InputDecoration(labelText: 'Mã hàng'),
                            validator: (value) {
                              if ((value ?? '').trim().isEmpty) return 'Nhập mã hàng';
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 220,
                          child: TextFormField(
                            controller: barcodeController,
                            decoration: const InputDecoration(labelText: 'Barcode'),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(labelText: 'Tên vật tư'),
                            validator: (value) {
                              if ((value ?? '').trim().isEmpty) return 'Nhập tên vật tư';
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 260,
                          child: DropdownButtonFormField<String>(
                            value: selectedCategoryId,
                            decoration: const InputDecoration(labelText: 'Nhóm vật tư'),
                            items: [
                              for (final category in categories)
                                DropdownMenuItem(
                                  value: category.categoryId,
                                  child: Text(category.name),
                                ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedCategoryId = value;
                              });
                            },
                            validator: (value) {
                              if (value == null) return 'Chọn nhóm vật tư';
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: unitController,
                            decoration: const InputDecoration(labelText: 'Đơn vị'),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: specController,
                            decoration: const InputDecoration(labelText: 'Quy cách'),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: purchaseController,
                            decoration: const InputDecoration(labelText: 'Giá nhập'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: retailController,
                            decoration: const InputDecoration(labelText: 'Giá bán lẻ'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: wholesaleController,
                            decoration: const InputDecoration(labelText: 'Giá bán sỉ'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: dealerController,
                            decoration: const InputDecoration(labelText: 'Giá đại lý'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: vatController,
                            decoration: const InputDecoration(labelText: 'VAT (%)'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: weightController,
                            decoration: const InputDecoration(labelText: 'Trọng lượng'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 260,
                          child: TextFormField(
                            controller: dimensionController,
                            decoration: const InputDecoration(labelText: 'Kích thước'),
                          ),
                        ),
                        SizedBox(
                          width: 520,
                          child: TextFormField(
                            controller: imageController,
                            decoration: const InputDecoration(labelText: 'Ảnh / URL'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSaving ? null : () => Navigator.pop(dialogContext),
                  child: const Text('Hủy'),
                ),
                FilledButton(
                  onPressed: isSaving ? null : saveProduct,
                  child: Text(isSaving ? 'Đang lưu...' : 'Lưu vật tư'),
                ),
              ],
            );
          },
        );
      },
    );

    codeController.dispose();
    barcodeController.dispose();
    nameController.dispose();
    unitController.dispose();
    specController.dispose();
    purchaseController.dispose();
    retailController.dispose();
    wholesaleController.dispose();
    dealerController.dispose();
    vatController.dispose();
    weightController.dispose();
    dimensionController.dispose();
    imageController.dispose();
  }

  Future<void> _softDeleteProduct(VlxdProduct product) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xóa vật tư'),
        content: Text('Xóa mềm "${product.productName}" khỏi danh mục?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final db = await ref.read(vlxdIsarServiceProvider).db;
      product.deletedAt = DateTime.now();
      product.updatedAt = DateTime.now();
      await db.writeTxn(() async {
        await db.vlxdProducts.put(product);
      });
      await ref.read(vlxdProductsProvider.notifier).loadProducts();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã xóa mềm vật tư.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không thể xóa vật tư: $e')),
        );
      }
    }
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.16),
              foregroundColor: color,
              child: Icon(icon),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(vlxdProductsProvider);
    final categoriesAsync = ref.watch(vlxdProductCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý vật tư'),
        actions: [
          TextButton.icon(
            onPressed: () async {
              final categories = categoriesAsync.valueOrNull ?? const <VlxdProductCategory>[];
              await _showProductDialog(categories: categories);
            },
            icon: const Icon(Icons.add),
            label: const Text('Thêm vật tư'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: productsAsync.when(
        data: (products) {
          return categoriesAsync.when(
            data: (categories) {
              final filteredProducts = products.where((product) {
                final query = _searchQuery.trim().toLowerCase();
                final matchesQuery = query.isEmpty ||
                    product.productName.toLowerCase().contains(query) ||
                    product.productCode.toLowerCase().contains(query) ||
                    product.barcode.toLowerCase().contains(query);
                final categoryId = product.category.value?.categoryId;
                final matchesCategory = _selectedCategoryId == null || categoryId == _selectedCategoryId;
                return matchesQuery && matchesCategory;
              }).toList();

              final categoryCount = categories.length;
              final barcodeCount = products.where((p) => p.barcode.trim().isNotEmpty).length;
              final noCategoryCount = products.where((p) => p.category.value == null).length;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildSummaryCard(
                            'Vật tư đang dùng',
                            '${products.length}',
                            Icons.widgets,
                            Colors.indigo,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSummaryCard(
                            'Có barcode',
                            '$barcodeCount',
                            Icons.qr_code,
                            Colors.teal,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSummaryCard(
                            'Nhóm vật tư',
                            '$categoryCount',
                            Icons.category,
                            Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSummaryCard(
                            'Chưa gán nhóm',
                            '$noCategoryCount',
                            Icons.link_off,
                            Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Tìm theo mã, barcode hoặc tên vật tư',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchQuery.isEmpty
                            ? null
                            : IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                    _searchQuery = '';
                                  });
                                },
                              ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 44,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: const Text('Tất cả'),
                            selected: _selectedCategoryId == null,
                            onSelected: (_) {
                              setState(() {
                                _selectedCategoryId = null;
                              });
                            },
                          ),
                        ),
                        for (final category in categories)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(category.name),
                              selected: _selectedCategoryId == category.categoryId,
                              onSelected: (_) {
                                setState(() {
                                  _selectedCategoryId = category.categoryId;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: filteredProducts.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.widgets_outlined, size: 56, color: Colors.grey),
                                const SizedBox(height: 8),
                                Text(
                                  products.isEmpty
                                      ? 'Chưa có vật tư nào.'
                                      : 'Không tìm thấy vật tư phù hợp.',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            itemCount: filteredProducts.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final item = filteredProducts[index];
                              final categoryName = item.category.value?.name.isNotEmpty == true
                                  ? item.category.value!.name
                                  : 'Chưa nhóm';

                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundColor: Colors.indigo.withOpacity(0.12),
                                        foregroundColor: Colors.indigo,
                                        child: const Icon(Icons.construction),
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
                                                    item.productName,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuButton<String>(
                                                  onSelected: (value) async {
                                                    if (value == 'edit') {
                                                      await _showProductDialog(
                                                        product: item,
                                                        categories: categories,
                                                      );
                                                    } else if (value == 'delete') {
                                                      await _softDeleteProduct(item);
                                                    }
                                                  },
                                                  itemBuilder: (context) => const [
                                                    PopupMenuItem(
                                                      value: 'edit',
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.edit, size: 18),
                                                          SizedBox(width: 8),
                                                          Text('Sửa'),
                                                        ],
                                                      ),
                                                    ),
                                                    PopupMenuItem(
                                                      value: 'delete',
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.delete_outline, size: 18),
                                                          SizedBox(width: 8),
                                                          Text('Xóa mềm'),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: [
                                                Chip(label: Text('Mã: ${item.productCode.isEmpty ? "N/A" : item.productCode}')),
                                                Chip(label: Text('Nhóm: $categoryName')),
                                                Chip(label: Text('Đơn vị: ${item.unit.isEmpty ? "N/A" : item.unit}')),
                                                if (item.barcode.trim().isNotEmpty)
                                                  Chip(label: Text('Barcode: ${item.barcode}')),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              item.specification.isEmpty
                                                  ? 'Chưa nhập quy cách.'
                                                  : item.specification,
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                            const SizedBox(height: 8),
                                            Wrap(
                                              spacing: 16,
                                              runSpacing: 8,
                                              children: [
                                                Text('Giá nhập: ${_fmtMoney(item.purchasePrice)}'),
                                                Text('Giá sỉ: ${_fmtMoney(item.wholesalePrice)}'),
                                                Text('Giá lẻ: ${_fmtMoney(item.retailPrice)}'),
                                                Text('VAT: ${item.vatRate.toStringAsFixed(0)}%'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => Center(child: Text('Lỗi nhóm vật tư: $err')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi vật tư: $err')),
      ),
    );
  }
}
