import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/vlxd_product_model.dart';

final _searchProvider = StateProvider<String>((ref) => '');

class VlxdProductsScreen extends ConsumerWidget {
  const VlxdProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final search = ref.watch(_searchProvider);
    final allProducts = db.getCollection('products');
    final filtered = search.isEmpty
        ? allProducts
        : allProducts.where((p) {
            final name = (p['name'] as String? ?? '').toLowerCase();
            final code = (p['code'] as String? ?? '').toLowerCase();
            final cat = (p['category'] as String? ?? '').toLowerCase();
            final q = search.toLowerCase();
            return name.contains(q) || code.contains(q) || cat.contains(q);
          }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            color: AppColors.surface,
            child: Row(
              children: [
                Expanded(
                  child: AppSearchBar(
                    hint: 'search_product_hint'.tr,
                    onChanged: (v) => ref.read(_searchProvider.notifier).state = v,
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () => _showProductDialog(context, ref, null),
                  icon: const Icon(Icons.add, size: 18),
                  label: Text('add_product'.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? EmptyState(
                    icon: Icons.inventory_2_outlined,
                    title: 'no_product_found'.tr,
                    subtitle: 'try_different_or_add'.tr,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final product = filtered[index];
                      return _ProductCard(
                        data: product,
                        onEdit: () => _showProductDialog(context, ref, product),
                        onDelete: () => _confirmDelete(context, ref, product['id'] as String),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showProductDialog(BuildContext context, WidgetRef ref, Map<String, dynamic>? existing) {
    final isEdit = existing != null;
    final codeCtrl = TextEditingController(text: existing?['code'] as String? ?? '');
    final nameCtrl = TextEditingController(text: existing?['name'] as String? ?? '');
    final catCtrl = TextEditingController(text: existing?['category'] as String? ?? '');
    final unitCtrl = TextEditingController(text: existing?['unit'] as String? ?? 'Cái');
    final wholesaleCtrl = TextEditingController(
      text: existing != null ? '${((existing['wholesalePrice'] as num?) ?? 0).toDouble()}' : '',
    );
    final retailCtrl = TextEditingController(
      text: existing != null ? '${((existing['retailPrice'] as num?) ?? 0).toDouble()}' : '',
    );
    final stockCtrl = TextEditingController(
      text: existing != null ? '${(existing['stockQuantity'] as int?) ?? 0}' : '0',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEdit ? 'edit_product'.tr : 'add_product_new'.tr,
                style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: codeCtrl,
                decoration: InputDecoration(labelText: 'product_code'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'product_name'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: catCtrl,
                decoration: InputDecoration(labelText: 'category_label'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: unitCtrl,
                decoration: InputDecoration(labelText: 'unit_label'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: wholesaleCtrl,
                decoration: InputDecoration(labelText: 'wholesale_price'.tr),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: retailCtrl,
                decoration: InputDecoration(labelText: 'retail_price'.tr),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: stockCtrl,
                decoration: InputDecoration(labelText: 'stock_quantity'.tr),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameCtrl.text.trim().isEmpty) return;
                    final model = VlxdProductModel(
                      id: existing?['id'] as String? ?? IdGenerator.generateId('SP'),
                      code: codeCtrl.text.trim().isEmpty
                          ? 'SP-${DateTime.now().millisecondsSinceEpoch}'
                          : codeCtrl.text.trim(),
                      name: nameCtrl.text.trim(),
                      category: catCtrl.text.trim(),
                      unit: unitCtrl.text.trim().isEmpty ? 'Cái' : unitCtrl.text.trim(),
                      wholesalePrice: double.tryParse(wholesaleCtrl.text) ?? 0,
                      retailPrice: double.tryParse(retailCtrl.text) ?? 0,
                      stockQuantity: int.tryParse(stockCtrl.text) ?? 0,
                    );
                    DatabaseService.instance.saveItem('products', model.id, model.toJson());
                    Navigator.of(ctx).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(isEdit ? 'update'.tr : 'add_new'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('delete_product'.tr),
        content: Text('confirm_delete_product'.tr),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              DatabaseService.instance.deleteItem('products', id);
              Navigator.pop(ctx);
            },
            child: Text('delete'.tr, style: const TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ProductCard({required this.data, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final name = (data['name'] as String?) ?? '';
    final code = (data['code'] as String?) ?? '';
    final category = (data['category'] as String?) ?? '';
    final wholesale = ((data['wholesalePrice'] as num?) ?? 0).toDouble();
    final retail = ((data['retailPrice'] as num?) ?? 0).toDouble();
    final stock = (data['stockQuantity'] as int?) ?? 0;
    final unit = (data['unit'] as String?) ?? 'Cái';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.inventory_2_rounded, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  '$code | $category',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'wholesale'.trParams({'amount': AppFormatters.formatCurrency(wholesale)}),
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'retail_label'.trParams({'amount': AppFormatters.formatCurrency(retail)}),
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: stock <= 10
                      ? AppColors.danger.withOpacity(0.1)
                      : AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$stock $unit',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: stock <= 10 ? AppColors.danger : AppColors.success,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              PopupMenuButton<String>(
                itemBuilder: (_) => [
                  PopupMenuItem(value: 'edit', child: Text('edit'.tr)),
                  PopupMenuItem(
                      value: 'delete', child: Text('delete'.tr, style: const TextStyle(color: AppColors.danger))),
                ],
                onSelected: (v) {
                  if (v == 'edit') onEdit();
                  if (v == 'delete') onDelete();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
