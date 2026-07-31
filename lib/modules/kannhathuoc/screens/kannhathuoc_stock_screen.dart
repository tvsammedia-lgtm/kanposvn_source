import 'package:flutter/material.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';

class _StockItem {
  final String id;
  final String code;
  final String name;
  final String unit;
  final double costPrice;
  final double sellingPrice;
  final int stock;
  final int minStock;
  final DateTime? expiryDate;

  _StockItem({
    required this.id,
    required this.code,
    required this.name,
    this.unit = 'Hộp',
    this.costPrice = 0,
    this.sellingPrice = 0,
    this.stock = 0,
    this.minStock = 10,
    this.expiryDate,
  });
}

class NhaThuocStockScreen extends StatefulWidget {
  const NhaThuocStockScreen({super.key});

  @override
  State<NhaThuocStockScreen> createState() => _NhaThuocStockScreenState();
}

class _NhaThuocStockScreenState extends State<NhaThuocStockScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _filterStock = 'Tất cả';

  final List<_StockItem> _medicines = [
    _StockItem(id: 'M001', code: 'TH-10234', name: 'Paracetamol 500mg', unit: 'Hộp', costPrice: 35000, sellingPrice: 50000, stock: 120, minStock: 20, expiryDate: DateTime(2026, 8, 15)),
    _StockItem(id: 'M002', code: 'TH-10235', name: 'Amoxicillin 500mg', unit: 'Hộp', costPrice: 12000, sellingPrice: 20000, stock: 85, minStock: 15, expiryDate: DateTime(2026, 12, 20)),
    _StockItem(id: 'M003', code: 'TH-10236', name: 'Omeprazol 20mg', unit: 'Hộp', costPrice: 90000, sellingPrice: 150000, stock: 60, minStock: 10, expiryDate: DateTime(2027, 3, 10)),
    _StockItem(id: 'M004', code: 'TH-10237', name: 'Cetirizin 10mg', unit: 'Hộp', costPrice: 50000, sellingPrice: 80000, stock: 95, minStock: 15, expiryDate: DateTime(2026, 9, 30)),
    _StockItem(id: 'M005', code: 'TH-10238', name: 'Ibuprofen 400mg', unit: 'Hộp', costPrice: 40000, sellingPrice: 65000, stock: 8, minStock: 15, expiryDate: DateTime(2026, 7, 1)),
    _StockItem(id: 'M006', code: 'TH-10239', name: 'Vitamin C 1000mg', unit: 'Hộp', costPrice: 70000, sellingPrice: 120000, stock: 200, minStock: 20, expiryDate: DateTime(2027, 6, 15)),
    _StockItem(id: 'M007', code: 'TH-10240', name: 'Azithromycin 500mg', unit: 'Hộp', costPrice: 110000, sellingPrice: 180000, stock: 5, minStock: 10, expiryDate: DateTime(2026, 11, 25)),
    _StockItem(id: 'M008', code: 'TH-10241', name: 'Loratadin 10mg', unit: 'Hộp', costPrice: 30000, sellingPrice: 55000, stock: 75, minStock: 10, expiryDate: DateTime(2027, 1, 20)),
    _StockItem(id: 'M009', code: 'TH-10242', name: 'Metformin 500mg', unit: 'Hộp', costPrice: 60000, sellingPrice: 95000, stock: 50, minStock: 15, expiryDate: DateTime(2026, 10, 5)),
    _StockItem(id: 'M010', code: 'TH-10243', name: 'Dexamethasone 0.5mg', unit: 'Hộp', costPrice: 20000, sellingPrice: 35000, stock: 150, minStock: 20, expiryDate: DateTime(2027, 4, 12)),
  ];

  List<_StockItem> get _filteredMedicines {
    var list = _medicines.where((m) {
      if (_searchQuery.isEmpty) return true;
      return m.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          m.code.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    switch (_filterStock) {
      case 'Sắp hết':
        list = list.where((m) => m.stock <= m.minStock && m.stock > 0).toList();
        break;
      case 'Hết hàng':
        list = list.where((m) => m.stock == 0).toList();
        break;
      case 'Sắp hết hạn':
        final now = DateTime.now();
        list = list.where((m) => m.expiryDate != null && m.expiryDate!.difference(now).inDays < 90).toList();
        break;
    }
    return list;
  }

  void _showMedicineDialog({_StockItem? existing}) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final codeCtrl = TextEditingController(text: existing?.code ?? '');
    final costCtrl = TextEditingController(text: existing?.costPrice.toStringAsFixed(0) ?? '');
    final sellCtrl = TextEditingController(text: existing?.sellingPrice.toStringAsFixed(0) ?? '');
    final stockCtrl = TextEditingController(text: '${existing?.stock ?? 0}');
    final minCtrl = TextEditingController(text: '${existing?.minStock ?? 10}');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing != null ? 'edit_medicine'.tr : 'add_medicine_new'.tr),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: codeCtrl,
                decoration: InputDecoration(labelText: 'medicine_code'.tr),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'medicine_name'.tr),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: costCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'cost_price'.tr),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: sellCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'selling_price'.tr),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: stockCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'in_stock'.tr),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: minCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'min_stock'.tr),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          ElevatedButton(
            onPressed: () {
              final item = _StockItem(
                id: existing?.id ?? IdGenerator.generateId('M'),
                code: codeCtrl.text.isNotEmpty ? codeCtrl.text : IdGenerator.generateMedicineCode(),
                name: nameCtrl.text,
                costPrice: double.tryParse(costCtrl.text) ?? 0,
                sellingPrice: double.tryParse(sellCtrl.text) ?? 0,
                stock: int.tryParse(stockCtrl.text) ?? 0,
                minStock: int.tryParse(minCtrl.text) ?? 10,
                expiryDate: existing?.expiryDate,
              );
              setState(() {
                if (existing != null) {
                  final idx = _medicines.indexWhere((m) => m.id == existing.id);
                  if (idx >= 0) _medicines[idx] = item;
                } else {
                  _medicines.add(item);
                }
              });
              Navigator.pop(ctx);
            },
            child: Text('save'.tr),
          ),
        ],
      ),
    );
  }

  void _deleteMedicine(String id) {
    setState(() => _medicines.removeWhere((m) => m.id == id));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stockAlerts = _medicines.where((m) => m.stock <= m.minStock).length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('manage_stock'.tr,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                )),
                        if (stockAlerts > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: StatusBadge(
                              label: 'medicines_low_stock'.trParams({'count': '$stockAlerts'}),
                              color: AppColors.warning,
                            ),
                          ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _showMedicineDialog(),
                    icon: const Icon(Icons.add, size: 18),
                    label: Text('add_medicine'.tr),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: AppSearchBar(
                      hint: 'search_medicine_hint'.tr,
                      onChanged: (v) => setState(() => _searchQuery = v),
                      controller: _searchController,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SegmentedButton<String>(
                    segments: [
                      ButtonSegment(value: 'Tất cả', label: Text('all'.tr)),
                      ButtonSegment(value: 'Sắp hết', label: Text('low_stock'.tr)),
                      ButtonSegment(value: 'Hết hàng', label: Text('out_of_stock_short'.tr)),
                    ],
                    selected: {_filterStock},
                    onSelectionChanged: (v) => setState(() => _filterStock = v.first),
                    style: SegmentedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 11),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _filteredMedicines.isEmpty
                  ? EmptyState(
                      icon: Icons.inventory_2_outlined,
                      title: 'no_medicine_found'.tr,
                      subtitle: 'add_or_change_filter'.tr,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      itemCount: _filteredMedicines.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 6),
                      itemBuilder: (context, index) {
                        final m = _filteredMedicines[index];
                        final isLowStock = m.stock <= m.minStock;
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isLowStock ? AppColors.warning.withOpacity(0.5) : AppColors.border,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: (isLowStock ? AppColors.warning : AppColors.success).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  isLowStock ? Icons.warning_rounded : Icons.check_circle_rounded,
                                  color: isLowStock ? AppColors.warning : AppColors.success,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(m.name,
                                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Text(m.code,
                                            style: const TextStyle(
                                                color: AppColors.textMuted, fontSize: 11)),
                                        const Text(' · ', style: TextStyle(color: AppColors.textMuted)),
                                        Text('${m.stock} ${m.unit}',
                                            style: TextStyle(
                                                color: isLowStock ? AppColors.danger : AppColors.textSecondary,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(AppFormatters.formatCurrency(m.sellingPrice),
                                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                                  if (m.expiryDate != null)
                                    Text('expiry_date'.trParams({'date': AppFormatters.formatDate(m.expiryDate!)}),
                                        style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
                                ],
                              ),
                              PopupMenuButton(
                                itemBuilder: (_) => [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Row(
                                      children: [
                                        const Icon(Icons.edit_rounded, size: 16),
                                        const SizedBox(width: 8),
                                        Text('edit'.tr),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        const Icon(Icons.delete_rounded, size: 16, color: AppColors.danger),
                                        const SizedBox(width: 8),
                                        Text('delete'.tr, style: const TextStyle(color: AppColors.danger)),
                                      ],
                                    ),
                                  ),
                                ],
                                onSelected: (v) {
                                  if (v == 'edit') _showMedicineDialog(existing: m);
                                  if (v == 'delete') _deleteMedicine(m.id);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
