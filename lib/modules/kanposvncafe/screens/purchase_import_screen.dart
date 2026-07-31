import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/cafe_inventory.dart';
import '../models/cafe_finance_accounting.dart';
import '../providers/cafe_providers.dart';

class PurchaseImportScreen extends ConsumerStatefulWidget {
  const PurchaseImportScreen({super.key});

  @override
  ConsumerState<PurchaseImportScreen> createState() =>
      _PurchaseImportScreenState();
}

class _PurchaseImportScreenState extends ConsumerState<PurchaseImportScreen> {
  String? _selectedSupplierId;
  final _noteCtl = TextEditingController();
  final _items = <_ImportLineItem>[];

  @override
  void dispose() {
    _noteCtl.dispose();
    super.dispose();
  }

  double get _totalAmount => _items.fold(0, (sum, i) => sum + i.total);

  void _addItem(InventoryItem invItem) {
    setState(() => _items.add(_ImportLineItem(invItem: invItem)));
  }

  void _removeItem(int index) {
    setState(() => _items.removeAt(index));
  }

  Future<void> _submit() async {
    if (_selectedSupplierId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn nhà cung cấp'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chưa có mặt hàng nào'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final isar = ref.read(cafeIsarServiceProvider);
    final inventoryNotifier = ref.read(cafeInventoryProvider.notifier);
    final suppliers = ref.read(cafeSuppliersProvider);

    final supplier = suppliers.firstWhere((s) => s.id == _selectedSupplierId);
    final timestamp = DateTime.now();

    for (final line in _items) {
      final invItem = line.invItem;
      final qty = line.qtyCtl.text.isEmpty
          ? 0.0
          : double.parse(line.qtyCtl.text);
      final cost = line.costCtl.text.isEmpty
          ? 0.0
          : double.parse(line.costCtl.text);
      if (qty <= 0) continue;

      final updated = invItem.copyWith(
        currentStock: invItem.currentStock + qty,
        costPrice: cost > 0 ? cost : invItem.costPrice,
      );
      await inventoryNotifier.saveItem(updated);

      await isar.addInventoryTransaction(
        InventoryTransaction(
          id: 'TX-${DateTime.now().millisecondsSinceEpoch}-${invItem.id}',
          inventoryItemId: invItem.id,
          inventoryItemName: invItem.name,
          type: InventoryTransactionType.nhapKho,
          quantityChange: qty,
          oldStock: invItem.currentStock,
          newStock: updated.currentStock,
          unit: invItem.unit,
          note: 'Nhập từ ${supplier.name}: ${_noteCtl.text}',
          performerName: 'Quản lý',
          timestamp: timestamp,
        ),
      );
    }

    await ref
        .read(cafeCashTransactionsProvider.notifier)
        .save(
          CashTransaction(
            id: 'CTX-${DateTime.now().millisecondsSinceEpoch}',
            title: 'Nhập hàng từ ${supplier.name}',
            type: 'EXPENSE',
            category: ExpenseCategory.nhapHang.label,
            amount: _totalAmount,
            note: _noteCtl.text,
            performerName: 'Quản lý',
            timestamp: timestamp,
          ),
        );

    ref
        .read(cafeSuppliersProvider.notifier)
        .save(
          supplier.copyWith(debtAmount: supplier.debtAmount + _totalAmount),
        );

    setState(() {
      _items.clear();
      _noteCtl.clear();
      _selectedSupplierId = null;
    });

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Nhập hàng thành công! Tổng tiền: ${_totalAmount.toStringAsFixed(0)}đ',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inventory = ref.watch(cafeInventoryProvider);
    final suppliers = ref.watch(cafeSuppliersProvider);
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        children: [
          // Supplier & Note
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedSupplierId,
                  decoration: const InputDecoration(
                    labelText: 'Nhà cung cấp *',
                    border: OutlineInputBorder(),
                  ),
                  items: suppliers
                      .map(
                        (s) =>
                            DropdownMenuItem(value: s.id, child: Text(s.name)),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _selectedSupplierId = v),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _noteCtl,
                  decoration: const InputDecoration(
                    labelText: 'Ghi chú',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          // Items list
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Text('Chưa có mặt hàng nào. Nhấn + để thêm.'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: _items.length,
                    itemBuilder: (ctx, i) {
                      final line = _items[i];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  line.invItem.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: line.qtyCtl,
                                  decoration: InputDecoration(
                                    labelText: 'SL (${line.invItem.unit})',
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => setState(() {}),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: line.costCtl,
                                  decoration: const InputDecoration(
                                    labelText: 'Đơn giá',
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => setState(() {}),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                onPressed: () => _removeItem(i),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Bottom bar
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Thêm mặt hàng'),
                  onPressed: () => _showItemPicker(context, inventory),
                ),
                const Spacer(),
                Text(
                  'Tổng: ${currency.format(_totalAmount)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97706),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _submit,
                  child: const Text('Xác nhận nhập hàng'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showItemPicker(BuildContext context, List<InventoryItem> inventory) {
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Chọn mặt hàng nhập'),
        children: inventory
            .map(
              (item) => SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(ctx);
                  _addItem(item);
                },
                child: ListTile(
                  leading: const Icon(Icons.inventory_2),
                  title: Text(item.name),
                  subtitle: Text(
                    'Tồn: ${item.currentStock} ${item.unit} • Giá vốn: ${item.costPrice.toStringAsFixed(0)}đ',
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ImportLineItem {
  final InventoryItem invItem;
  final TextEditingController qtyCtl;
  final TextEditingController costCtl;

  _ImportLineItem({required this.invItem})
    : qtyCtl = TextEditingController(text: '1'),
      costCtl = TextEditingController(
        text: invItem.costPrice > 0 ? invItem.costPrice.toStringAsFixed(0) : '',
      );

  double get total {
    final qty = double.tryParse(qtyCtl.text) ?? 0;
    final cost = double.tryParse(costCtl.text) ?? 0;
    return qty * cost;
  }
}
