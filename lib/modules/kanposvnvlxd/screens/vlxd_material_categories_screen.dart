import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/vlxd_product.dart';
import '../providers/vlxd_providers.dart';

class VlxdMaterialCategoriesScreen extends ConsumerStatefulWidget {
  const VlxdMaterialCategoriesScreen({super.key});

  @override
  ConsumerState<VlxdMaterialCategoriesScreen> createState() => _VlxdMaterialCategoriesScreenState();
}

class _VlxdMaterialCategoriesScreenState extends ConsumerState<VlxdMaterialCategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _reload() async {
    ref.invalidate(vlxdProductCategoriesProvider);
    await ref.read(vlxdProductsProvider.notifier).loadProducts();
  }

  Future<void> _showCategoryDialog({VlxdProductCategory? category}) async {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: category?.name ?? '');
    final descriptionController = TextEditingController(text: category?.description ?? '');
    bool isSaving = false;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            Future<void> saveCategory() async {
              if (!(formKey.currentState?.validate() ?? false)) return;
              setState(() => isSaving = true);
              try {
                final db = await ref.read(vlxdIsarServiceProvider).db;
                final item = category ?? VlxdProductCategory();
                item.categoryId = category?.categoryId ?? const Uuid().v4();
                item.name = nameController.text.trim();
                item.description = descriptionController.text.trim();
                item.deletedAt = null;
                item.updatedAt = DateTime.now();
                await db.writeTxn(() async {
                  await db.vlxdProductCategorys.put(item);
                });

                if (dialogContext.mounted) Navigator.pop(dialogContext);
                await _reload();
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(category == null ? 'Đã thêm nhóm vật tư.' : 'Đã cập nhật nhóm vật tư.'),
                    ),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Không thể lưu nhóm vật tư: $e')),
                  );
                }
              } finally {
                if (dialogContext.mounted) {
                  setState(() => isSaving = false);
                }
              }
            }

            return AlertDialog(
              title: Text(category == null ? 'Thêm nhóm vật tư' : 'Sửa nhóm vật tư'),
              content: SizedBox(
                width: 480,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(labelText: 'Tên nhóm'),
                          validator: (value) {
                            if ((value ?? '').trim().isEmpty) {
                              return 'Nhập tên nhóm';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(labelText: 'Mô tả'),
                          maxLines: 3,
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
                  onPressed: isSaving ? null : saveCategory,
                  child: Text(isSaving ? 'Đang lưu...' : 'Lưu'),
                ),
              ],
            );
          },
        );
      },
    );

    nameController.dispose();
    descriptionController.dispose();
  }

  Future<void> _softDeleteCategory(VlxdProductCategory category) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xóa nhóm vật tư'),
        content: Text('Xóa mềm nhóm "${category.name}"?'),
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
      category.deletedAt = DateTime.now();
      category.updatedAt = DateTime.now();
      await db.writeTxn(() async {
        await db.vlxdProductCategorys.put(category);
      });
      await _reload();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã xóa mềm nhóm vật tư.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không thể xóa nhóm vật tư: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(vlxdProductCategoriesProvider);
    final productsAsync = ref.watch(vlxdProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhóm vật tư'),
        actions: [
          TextButton.icon(
            onPressed: () => _showCategoryDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Thêm nhóm'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: categoriesAsync.when(
        data: (categories) {
          final filteredCategories = categories.where((category) {
            final query = _searchQuery.trim().toLowerCase();
            if (query.isEmpty) return true;
            return category.name.toLowerCase().contains(query) ||
                category.description.toLowerCase().contains(query);
          }).toList();

          return productsAsync.when(
            data: (products) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Tìm nhóm theo tên hoặc mô tả',
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: const Icon(Icons.category),
                              title: const Text('Tổng nhóm'),
                              subtitle: Text('${categories.length} nhóm đang dùng'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: const Icon(Icons.inventory_2_outlined),
                              title: const Text('Tổng vật tư'),
                              subtitle: Text('${products.length} vật tư'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: filteredCategories.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.category_outlined, size: 56, color: Colors.grey),
                                const SizedBox(height: 8),
                                Text(
                                  categories.isEmpty ? 'Chưa có nhóm vật tư nào.' : 'Không tìm thấy nhóm phù hợp.',
                                ),
                                const SizedBox(height: 12),
                                FilledButton.icon(
                                  onPressed: () => _showCategoryDialog(),
                                  icon: const Icon(Icons.add),
                                  label: const Text('Thêm nhóm'),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            itemCount: filteredCategories.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final category = filteredCategories[index];
                              final productCount = products.where((product) {
                                return product.category.value?.categoryId == category.categoryId;
                              }).length;

                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.orange.withOpacity(0.14),
                                    foregroundColor: Colors.orange,
                                    child: const Icon(Icons.category),
                                  ),
                                  title: Text(category.name),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 4),
                                      Text(category.description.isEmpty ? 'Chưa có mô tả.' : category.description),
                                      const SizedBox(height: 4),
                                      Text('$productCount vật tư thuộc nhóm này'),
                                    ],
                                  ),
                                  isThreeLine: true,
                                  trailing: PopupMenuButton<String>(
                                    onSelected: (value) async {
                                      if (value == 'edit') {
                                        await _showCategoryDialog(category: category);
                                      } else if (value == 'delete') {
                                        await _softDeleteCategory(category);
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
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => Center(child: Text('Lỗi vật tư: $err')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi nhóm vật tư: $err')),
      ),
    );
  }
}
