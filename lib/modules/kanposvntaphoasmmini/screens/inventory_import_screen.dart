import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';
import '../services/taphoa_isar_service.dart';

class TapHoaInventoryImportScreen extends ConsumerStatefulWidget {
  const TapHoaInventoryImportScreen({super.key});

  @override
  ConsumerState<TapHoaInventoryImportScreen> createState() =>
      _TapHoaInventoryImportScreenState();
}

class _TapHoaInventoryImportScreenState
    extends ConsumerState<TapHoaInventoryImportScreen> {
  String? _selectedProductId;
  final _quantityController = TextEditingController(text: '10');
  final _costController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaProductsProvider.notifier).loadProducts();
      ref.read(tapHoaSuppliersProvider.notifier).loadSuppliers();
      ref.read(tapHoaInventoryProvider.notifier).loadInventory();
    });
  }

  Future<void> _import() async {
    final products = ref.read(tapHoaProductsProvider);
    final inventory = ref.read(tapHoaInventoryProvider);
    final product = products.where((p) => p.productId == _selectedProductId).firstOrNull;
    if (product == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn sản phẩm')),
      );
      return;
    }
    final quantity = double.tryParse(_quantityController.text) ?? 0;
    if (quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Số lượng nhập phải lớn hơn 0')),
      );
      return;
    }

    double cost = double.tryParse(_costController.text) ?? 0;
    if (cost <= 0) {
      final inv = inventory.where((i) => i.productId == product.productId).firstOrNull;
      cost = inv?.costPrice ?? product.purchasePrice;
    }

    final isar = TapHoaIsarService();
    await isar.processImport(
      productId: product.productId,
      productName: product.productName,
      quantity: quantity,
      costPrice: cost,
      unit: product.unit,
      note: _noteController.text,
    );

    ref.read(tapHoaInventoryProvider.notifier).loadInventory();
    ref.read(tapHoaInventoryTransactionsProvider.notifier).loadTransactions();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Đã nhập ${quantity.toInt()} ${product.unit} ${product.productName}')),
      );
      _noteController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tapHoaProductsProvider);
    final inventory = ref.watch(tapHoaInventoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Nhập Hàng Mới')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<String>(
            initialValue: _selectedProductId,
            decoration: const InputDecoration(
              labelText: 'Chọn sản phẩm *',
              border: OutlineInputBorder(),
            ),
            items: products.map((p) {
              final inv = inventory.where((i) => i.productId == p.productId).firstOrNull;
              return DropdownMenuItem(
                value: p.productId,
                child: Text(
                    '${p.productName}${inv != null ? ' (tồn ${inv.currentStock.toInt()} ${p.unit})' : ''}'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedProductId = value;
                final p = products.where((e) => e.productId == value).firstOrNull;
                if (p != null && _costController.text.isEmpty) {
                  _costController.text = p.purchasePrice.toStringAsFixed(0);
                }
              });
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Số lượng nhập *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _costController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Đơn giá nhập (đ)',
              prefixText: '₫ ',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _noteController,
            decoration: const InputDecoration(
              labelText: 'Ghi chú',
              hintText: 'VD: Nhập lô hàng tháng 8',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _import,
            child: const Text('NHẬP HÀNG', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
