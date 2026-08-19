import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/inventory_provider.dart';
import '../models/barber_product.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  String _filter = 'ALL';

  @override
  Widget build(BuildContext context) {
    final inventoryState = ref.watch(inventoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Kho'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (v) => setState(() => _filter = v),
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'ALL', child: Text('Tất cả')),
              const PopupMenuItem(value: 'LOW', child: Text('Sắp hết hàng')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showImportDialog(context),
          ),
        ],
      ),
      body: inventoryState.when(
        data: (items) {
          var filtered = items;
          if (_filter == 'LOW') {
            filtered = items.where((i) => i.isLowStock).toList();
          }
          if (filtered.isEmpty) return const Center(child: Text('Không có sản phẩm nào.'));
          return Column(
            children: [
              // Transaction history header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.blue.shade50,
                child: Row(
                  children: [
                    const Icon(Icons.history, size: 16, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text('Lịch sử xuất nhập kho', style: TextStyle(fontSize: 12, color: Colors.blue.shade800)),
                    const Spacer(),
                    TextButton.icon(
                      icon: const Icon(Icons.receipt_long, size: 14),
                      label: const Text('Xem tất cả', style: TextStyle(fontSize: 12)),
                      onPressed: () => _showTransactions(context),
                    ),
                  ],
                ),
              ),
              // Product list
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    return Card(
                      color: item.isLowStock ? Colors.red.shade50 : Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        leading: Icon(
                          Icons.inventory_2,
                          color: item.isLowStock ? Colors.red : Colors.blue,
                        ),
                        title: Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${item.product.category} - ${_fmt(item.product.sellingPrice)}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${item.quantityInStock}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: item.isLowStock ? Colors.red : Colors.black,
                              ),
                            ),
                            if (item.isLowStock)
                              const Text('Sắp hết!', style: TextStyle(color: Colors.red, fontSize: 11)),
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
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }

  String _fmt(double v) => '${v.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';

  void _showImportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const _ImportStockDialog(),
    );
  }

  void _showTransactions(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const _TransactionsScreen()));
  }
}

class _ImportStockDialog extends ConsumerStatefulWidget {
  const _ImportStockDialog();

  @override
  ConsumerState<_ImportStockDialog> createState() => _ImportStockDialogState();
}

class _ImportStockDialogState extends ConsumerState<_ImportStockDialog> {
  BarberProduct? _selected;
  final _qtyCtrl = TextEditingController(text: '1');
  final _reasonCtrl = TextEditingController();
  bool _isImport = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isImport ? 'Nhập kho' : 'Xuất kho'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ChoiceChip(
            label: const Text('Nhập kho'),
            selected: _isImport,
            onSelected: (_) => setState(() => _isImport = true),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Xuất kho'),
            selected: !_isImport,
            onSelected: (_) => setState(() => _isImport = false),
          ),
        ]),
        const SizedBox(height: 12),
        TextField(
          decoration: const InputDecoration(labelText: 'Số lượng', border: OutlineInputBorder()),
          controller: _qtyCtrl,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: const InputDecoration(labelText: 'Lý do', border: OutlineInputBorder()),
          controller: _reasonCtrl,
        ),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
        ElevatedButton(
          onPressed: () {
            if (_selected != null) {
              final qty = int.tryParse(_qtyCtrl.text) ?? 0;
              final reason = _reasonCtrl.text.isNotEmpty ? _reasonCtrl.text : (_isImport ? 'Nhập kho' : 'Xuất kho');
              if (_isImport) {
                ref.read(inventoryProvider.notifier).importStock(_selected!.productId, qty, reason);
              } else {
                ref.read(inventoryProvider.notifier).exportStock(_selected!.productId, qty, reason);
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Thực hiện'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _qtyCtrl.dispose();
    _reasonCtrl.dispose();
    super.dispose();
  }
}

class _TransactionsScreen extends ConsumerWidget {
  const _TransactionsScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryNotifier = ref.read(inventoryProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Lịch sử Xuất Nhập Kho')),
      body: FutureBuilder<List>(
        future: inventoryNotifier.getTransactions(),
        builder: (context, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          final txns = snap.data!;
          if (txns.isEmpty) return const Center(child: Text('Chưa có giao dịch nào.'));
          return ListView.builder(
            itemCount: txns.length,
            itemBuilder: (_, i) {
              final t = txns[i];
              final isImport = t.type == 'IMPORT';
              return ListTile(
                leading: Icon(
                  isImport ? Icons.arrow_downward : Icons.arrow_upward,
                  color: isImport ? Colors.green : Colors.red,
                ),
                title: Text(t.productName ?? 'N/A'),
                subtitle: Text(t.reason ?? ''),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${isImport ? '+' : '-'}${t.quantity}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isImport ? Colors.green : Colors.red,
                      ),
                    ),
                    Text('${t.unitCost.toStringAsFixed(0)}đ', style: const TextStyle(fontSize: 11)),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
