import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/warehouse_model.dart';

final _searchProvider = StateProvider<String>((ref) => '');
final _selectedWarehouseProvider = StateProvider<String?>((ref) => null);

class VlxdInventoryScreen extends ConsumerWidget {
  const VlxdInventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final search = ref.watch(_searchProvider);
    final products = db.getCollection('products');
    final warehouses = db.getCollection('warehouses');

    final filtered = search.isEmpty
        ? products
        : products.where((p) {
            final name = (p['name'] as String? ?? '').toLowerCase();
            final code = (p['code'] as String? ?? '').toLowerCase();
            final q = search.toLowerCase();
            return name.contains(q) || code.contains(q);
          }).toList();

    final totalProducts = products.length;
    final lowStock = products.where((p) => ((p['stockQuantity'] as num?) ?? 0).toInt() <= 10).length;
    final totalValue = products.fold<double>(0, (sum, p) =>
        sum + (((p['retailPrice'] as num?) ?? 0).toDouble() * ((p['stockQuantity'] as num?) ?? 0).toInt()));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            color: AppColors.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppSearchBar(
                        hint: 'search_in_warehouse'.tr,
                        onChanged: (v) => ref.read(_searchProvider.notifier).state = v,
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () => _showWarehouseDialog(context, ref, null),
                      icon: const Icon(Icons.add, size: 18),
                      label: Text('new_warehouse'.tr),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _SummaryChip(label: 'total_products'.tr, value: '$totalProducts', color: AppColors.primary),
                    const SizedBox(width: 10),
                    _SummaryChip(label: 'low_stock_label'.tr, value: '$lowStock', color: AppColors.danger),
                    const SizedBox(width: 10),
                    _SummaryChip(
                        label: 'stock_value'.tr,
                        value: AppFormatters.formatCurrencyShort(totalValue),
                        color: AppColors.success),
                  ],
                ),
              ],
            ),
          ),
          if (warehouses.isNotEmpty)
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              color: AppColors.surface,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: warehouses.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final wh = warehouses[index];
                  final whName = (wh['name'] as String?) ?? '';
                  final selectedId = ref.watch(_selectedWarehouseProvider);
                  final isSelected = selectedId == wh['id'];
                  return FilterChip(
                    label: Text(whName, style: TextStyle(fontSize: 12)),
                    selected: isSelected,
                    onSelected: (selected) {
                      ref.read(_selectedWarehouseProvider.notifier).state =
                          selected ? wh['id'] as String : null;
                    },
                    backgroundColor: AppColors.surfaceAlt,
                    selectedColor: AppColors.primary.withOpacity(0.15),
                    checkmarkColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  );
                },
              ),
            ),
          Expanded(
            child: filtered.isEmpty
                ? EmptyState(
                    icon: Icons.warehouse_outlined,
                    title: 'warehouse_empty'.tr,
                    subtitle: 'add_products_manage_stock'.tr,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final p = filtered[index];
                      final name = (p['name'] as String?) ?? '';
                      final code = (p['code'] as String?) ?? '';
                      final stock = (p['stockQuantity'] as int?) ?? 0;
                      final retail = ((p['retailPrice'] as num?) ?? 0).toDouble();
                      final unit = (p['unit'] as String?) ?? 'Cái';

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
                                color: stock <= 10
                                    ? AppColors.danger.withOpacity(0.1)
                                    : AppColors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.warehouse_rounded,
                                color: stock <= 10 ? AppColors.danger : AppColors.success,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                                  Text(code, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '$stock $unit',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: stock <= 10 ? AppColors.danger : AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  'price_label'.trParams({'price': AppFormatters.formatCurrency(retail)}),
                                  style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.edit_rounded, size: 18, color: AppColors.textMuted),
                              onPressed: () => _showStockAdjustDialog(context, ref, p),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showWarehouseDialog(BuildContext context, WidgetRef ref, Map<String, dynamic>? existing) {
    final isEdit = existing != null;
    final codeCtrl = TextEditingController(text: existing?['code'] as String? ?? '');
    final nameCtrl = TextEditingController(text: existing?['name'] as String? ?? '');
    final locationCtrl = TextEditingController(text: existing?['location'] as String? ?? '');

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
                isEdit ? 'edit_warehouse'.tr : 'add_warehouse_new'.tr,
                style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: codeCtrl,
                decoration: InputDecoration(labelText: 'warehouse_code'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'warehouse_name'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: locationCtrl,
                decoration: InputDecoration(labelText: 'warehouse_address'.tr),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameCtrl.text.trim().isEmpty) return;
                    final model = WarehouseModel(
                      id: existing?['id'] as String? ?? IdGenerator.generateId('WH'),
                      code: codeCtrl.text.trim().isEmpty
                          ? 'WH-${DateTime.now().millisecondsSinceEpoch}'
                          : codeCtrl.text.trim(),
                      name: nameCtrl.text.trim(),
                      location: locationCtrl.text.trim(),
                    );
                    DatabaseService.instance.saveItem('warehouses', model.id, model.toJson());
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

  void _showStockAdjustDialog(BuildContext context, WidgetRef ref, Map<String, dynamic> product) {
    final currentStock = (product['stockQuantity'] as int?) ?? 0;
    final adjustCtrl = TextEditingController(text: '0');
    String adjustType = 'import';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'adjust_stock'.trParams({'name': '${product['name']}'}),
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('current_stock_label'.trParams({'count': '$currentStock'}),
                    style: const TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 16),
                SegmentedButton<String>(
                  segments: [
                    ButtonSegment(value: 'import', label: Text('import_stock'.tr), icon: const Icon(Icons.add_rounded, size: 16)),
                    ButtonSegment(value: 'export', label: Text('export_stock'.tr), icon: const Icon(Icons.remove_rounded, size: 16)),
                  ],
                  selected: {adjustType},
                  onSelectionChanged: (s) => setModalState(() => adjustType = s.first),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: adjustCtrl,
                  decoration: InputDecoration(labelText: 'quantity'.tr),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final qty = int.tryParse(adjustCtrl.text) ?? 0;
                      if (qty <= 0) return;
                      final newStock = adjustType == 'import' ? currentStock + qty : currentStock - qty;
                      final updated = Map<String, dynamic>.from(product);
                      updated['stockQuantity'] = newStock < 0 ? 0 : newStock;
                      DatabaseService.instance.saveItem('products', product['id'] as String, updated);
                      Navigator.of(ctx).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: adjustType == 'import' ? AppColors.success : AppColors.warning,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(adjustType == 'import' ? 'import_stock'.tr : 'export_stock'.tr),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryChip({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(width: 6),
          Text(value, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
