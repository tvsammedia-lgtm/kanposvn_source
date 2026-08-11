import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../providers/taphoa_providers.dart';

class TapHoaProductManagementScreen extends ConsumerStatefulWidget {
  const TapHoaProductManagementScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaProductManagementScreen> createState() =>
      _TapHoaProductManagementScreenState();
}

class _TapHoaProductManagementScreenState
    extends ConsumerState<TapHoaProductManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaProductsProvider.notifier).loadProducts();
    });
  }

  Future<void> _showProductDialog({TapHoaProduct? existing}) async {
    final codeController = TextEditingController(text: existing?.productCode ?? '');
    final barcodeController = TextEditingController(text: existing?.barcode ?? '');
    final nameController = TextEditingController(text: existing?.productName ?? '');
    final unitController = TextEditingController(text: existing?.unit ?? '');
    final purchaseController = TextEditingController(
        text: existing != null ? existing.purchasePrice.toStringAsFixed(0) : '');
    final retailController = TextEditingController(
        text: existing != null ? existing.retailPrice.toStringAsFixed(0) : '');
    final wholesaleController = TextEditingController(
        text: existing != null ? existing.wholesalePrice.toStringAsFixed(0) : '');
    final promotionController = TextEditingController(
        text: existing != null ? existing.promotionPrice.toStringAsFixed(0) : '');
    final vatController =
        TextEditingController(text: existing != null ? existing.vatRate.toString() : '');
    final manufacturerController =
        TextEditingController(text: existing?.manufacturer ?? '');
    final noteController = TextEditingController(text: existing?.note ?? '');

    DateTime? expiryDate = existing?.expiryDate;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return AlertDialog(
              title: Text(existing == null ? 'Thêm Hàng Hóa' : 'Sửa Hàng Hóa'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: codeController,
                        decoration: const InputDecoration(labelText: 'Mã hàng / SKU')),
                    TextField(controller: barcodeController,
                        decoration: const InputDecoration(labelText: 'Barcode')),
                    TextField(controller: nameController,
                        decoration: const InputDecoration(labelText: 'Tên hàng hóa *')),
                    TextField(controller: unitController,
                        decoration: const InputDecoration(labelText: 'Đơn vị (Cái, Gói, Lon...)')),
                    TextField(controller: purchaseController,
                        decoration: const InputDecoration(labelText: 'Giá nhập (đ)'),
                        keyboardType: TextInputType.number),
                    TextField(controller: retailController,
                        decoration: const InputDecoration(labelText: 'Giá bán lẻ (đ)'),
                        keyboardType: TextInputType.number),
                    TextField(controller: wholesaleController,
                        decoration: const InputDecoration(labelText: 'Giá bán sỉ (đ)'),
                        keyboardType: TextInputType.number),
                    TextField(controller: promotionController,
                        decoration: const InputDecoration(labelText: 'Giá khuyến mãi (đ)'),
                        keyboardType: TextInputType.number),
                    TextField(controller: vatController,
                        decoration: const InputDecoration(labelText: 'VAT (%)'),
                        keyboardType: TextInputType.number),
                    TextField(controller: manufacturerController,
                        decoration: const InputDecoration(labelText: 'Nhà sản xuất')),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: dialogContext,
                          initialDate: expiryDate ?? DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2035),
                        );
                        if (picked != null) {
                          setDialogState(() => expiryDate = picked);
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                            labelText: 'Hạn sử dụng', border: OutlineInputBorder()),
                        child: Text(expiryDate == null
                            ? 'Chưa chọn'
                            : '${expiryDate!.day}/${expiryDate!.month}/${expiryDate!.year}'),
                      ),
                    ),
                    TextField(controller: noteController,
                        decoration: const InputDecoration(labelText: 'Ghi chú')),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text('Hủy')),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(dialogContext).showSnackBar(
                        const SnackBar(content: Text('Vui lòng nhập tên hàng hóa')),
                      );
                      return;
                    }
                    final product = existing ?? TapHoaProduct();
                    product
                      ..productId = existing?.productId ??
                          'PRD_${DateTime.now().millisecondsSinceEpoch}'
                      ..productCode = codeController.text
                      ..barcode = barcodeController.text
                      ..qrCode = barcodeController.text
                      ..sku = codeController.text
                      ..productName = nameController.text
                      ..unit = unitController.text
                      ..purchasePrice = double.tryParse(purchaseController.text) ?? 0
                      ..retailPrice = double.tryParse(retailController.text) ?? 0
                      ..wholesalePrice = double.tryParse(wholesaleController.text) ?? 0
                      ..promotionPrice = double.tryParse(promotionController.text) ?? 0
                      ..vatRate = double.tryParse(vatController.text) ?? 0
                      ..manufacturer = manufacturerController.text
                      ..note = noteController.text
                      ..expiryDate = expiryDate
                      ..updatedAt = DateTime.now();
                    ref.read(tapHoaProductsProvider.notifier).saveProduct(product);
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Lưu'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _deleteProduct(TapHoaProduct product) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xóa hàng hóa'),
        content: Text('Bạn có chắc muốn xóa "${product.productName}"?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Hủy')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(tapHoaProductsProvider.notifier).deleteProduct(product.productId);
      ref.read(tapHoaInventoryProvider.notifier).loadInventory();
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tapHoaProductsProvider);
    final filtered = products.where((p) {
      return p.productName.toLowerCase().contains(_query.toLowerCase()) ||
          p.productCode.toLowerCase().contains(_query.toLowerCase()) ||
          p.barcode.toLowerCase().contains(_query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Hàng Hóa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showProductDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm theo tên, mã, barcode...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('Không tìm thấy hàng hóa'))
                : ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final product = filtered[index];
                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.inventory_2)),
                        title: Text(product.productName),
                        subtitle: Text(
                            'Mã: ${product.productCode}\nNhập: ${product.purchasePrice.toStringAsFixed(0)} đ - Bán: ${product.retailPrice.toStringAsFixed(0)} đ${product.unit.isNotEmpty ? ' / ${product.unit}' : ''}'),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showProductDialog(existing: product),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteProduct(product),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProductDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
