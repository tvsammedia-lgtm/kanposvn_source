import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/gara_providers.dart';
import '../models/gara_repair_order.dart';
import '../models/gara_product.dart';
import '../models/gara_customer.dart';
import '../models/gara_inventory.dart';
import '../models/gara_finance.dart';
import '../services/gara_receipt_printer.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/printer_service.dart';

class GaraWorkOrderScreen extends ConsumerStatefulWidget {
  const GaraWorkOrderScreen({super.key});

  @override
  ConsumerState<GaraWorkOrderScreen> createState() => _GaraWorkOrderScreenState();
}

class _GaraWorkOrderScreenState extends ConsumerState<GaraWorkOrderScreen> {
  GaraRepairOrder? _selectedOrder;
  final List<GaraRepairDetail> _currentDetails = [];

  void _selectOrder(GaraRepairOrder order) async {
    setState(() {
      _selectedOrder = order;
      _currentDetails.clear();
    });
    // Load existing details from DB
    final details = await ref.read(garaOrderDetailsProvider(order.id).future);
    if (mounted) {
      setState(() {
        _currentDetails.addAll(details);
      });
    }
  }

  void _addService(GaraProduct product) {
    if (_selectedOrder == null) return;
    // Stock guard: prevent adding PART when stock is 0
    if (product.type == GaraProductType.PART && product.currentStock <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.name} đã hết tồn kho!')),
      );
      return;
    }
    setState(() {
      final existingIndex = _currentDetails.indexWhere((d) => d.product.value?.id == product.id);
      if (existingIndex >= 0) {
        _currentDetails[existingIndex].quantity += 1;
        _currentDetails[existingIndex].total = _currentDetails[existingIndex].quantity * _currentDetails[existingIndex].unitPrice;
      } else {
        final detail = GaraRepairDetail()
          ..quantity = 1
          ..unitPrice = product.retailPrice
          ..total = product.retailPrice;
        detail.product.value = product;
        detail.order.value = _selectedOrder;
        _currentDetails.add(detail);
      }
    });
  }

  double get _totalAmount => _currentDetails.fold(0.0, (sum, item) => sum + item.total);

  void _completeOrder() async {
    if (_selectedOrder == null) return;

    // Show payment dialog
    final remainingAmount = _totalAmount - _selectedOrder!.paidAmount;
    final paidAmountCtrl = TextEditingController(text: remainingAmount > 0 ? remainingAmount.toStringAsFixed(0) : '0');
    
    final paymentResult = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thanh Toán'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Tổng phí: ${_totalAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            if (_selectedOrder!.paidAmount > 0)
              Text('Đã tạm ứng: ${_selectedOrder!.paidAmount.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.green)),
            if (_selectedOrder!.paidAmount > 0)
              Text('Còn lại: ${remainingAmount.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: paidAmountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Số tiền thanh toán (VNĐ)', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              final amt = double.tryParse(paidAmountCtrl.text) ?? 0;
              Navigator.pop(ctx, amt);
            },
            child: const Text('Xác Nhận'),
          ),
        ],
      ),
    );
    if (paymentResult == null) return;

    final totalPaid = _selectedOrder!.paidAmount + paymentResult;
    final isFullyPaid = totalPaid >= _totalAmount;

    _selectedOrder!.status = isFullyPaid ? GaraOrderStatus.DELIVERED : GaraOrderStatus.COMPLETED;
    _selectedOrder!.totalAmount = _totalAmount;
    _selectedOrder!.subTotal = _totalAmount;
    _selectedOrder!.paidAmount = totalPaid;

    await ref.read(garaOrdersProvider.notifier).updateOrderWithDetails(_selectedOrder!, _currentDetails);

    // Xuất kho phụ tùng đã dùng trong sửa chữa (ví dụ: nhớt)
    final partDetails = _currentDetails.where((d) => d.product.value?.type == GaraProductType.PART).toList();
    if (partDetails.isNotEmpty) {
      final invTx = GaraInventoryTransaction()
        ..transactionId = const Uuid().v4()
        ..documentCode = 'XK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
        ..type = GaraInventoryTransactionType.EXPORT
        ..transactionDate = DateTime.now();

      final invDetails = <GaraInventoryDetail>[];
      for (final d in partDetails) {
        final invDetail = GaraInventoryDetail()
          ..quantity = d.quantity
          ..unitPrice = d.product.value?.purchasePrice ?? 0
          ..totalAmount = d.total;
        invDetail.product.value = d.product.value;
        invDetail.transaction.value = invTx;
        invDetails.add(invDetail);
      }
      await ref.read(garaInventoryProvider.notifier).createTransaction(invTx, invDetails);
      ref.read(garaProductsProvider.notifier).loadProducts(); // Cập nhật tồn kho
    }

    // Công nợ: phát sinh nợ cho khách khi hoàn thành sửa chữa
    await _selectedOrder!.customer.load();
    final customer = _selectedOrder!.customer.value;
    if (customer != null) {
      customer.currentDebt += _selectedOrder!.totalAmount;
    }

    // Phiếu thu tiền khách -> ghi sổ quỹ & giảm công nợ
    if (paymentResult > 0) {
      final finTx = GaraFinanceTransaction()
        ..transactionId = const Uuid().v4()
        ..documentCode = 'PT-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
        ..type = GaraFinanceTransactionType.RECEIPT
        ..amount = paymentResult
        ..description = 'Thu tiền sửa xe ${customer?.name ?? ''} - ${_selectedOrder!.orderCode}'
        ..transactionDate = DateTime.now();
      finTx.customer.value = customer;
      await ref.read(garaFinanceProvider.notifier).createTransaction(finTx);
    } else if (customer != null) {
      final db = await ref.read(garaIsarServiceProvider).db;
      await db.writeTxn(() async {
        await db.garaCustomers.put(customer);
      });
    }
    ref.read(garaCustomersProvider.notifier).loadCustomers(); // Cập nhật công nợ

    if (mounted) {
      try {
        await _selectedOrder!.vehicle.load();
        final printer = ref.read(printerSettingsProvider).settings;
        if (printer.isConfigured) {
          await printReceipt80(
            context,
            ref,
            await buildGaraReceiptData(
              _selectedOrder!,
              List<GaraRepairDetail>.from(_currentDetails),
            ),
          );
        } else {
          await printGaraReceiptPdf(_selectedOrder!, List<GaraRepairDetail>.from(_currentDetails));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('In phiếu thất bại: $e')));
        }
      }
      final msg = isFullyPaid ? 'Thanh toán đầy đủ & Giao xe thành công!' : 'Đã ghi nhận thanh toán ${paymentResult.toStringAsFixed(0)} đ. Đơn hàng chuyển sang hoàn thành.';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      setState(() {
        _selectedOrder = null;
        _currentDetails.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(garaOrdersProvider);
    final productsAsync = ref.watch(garaProductsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lệnh Sửa Chữa (Work Order)')),
      body: Row(
        children: [
          // Left: Orders List
          Expanded(
            flex: 1,
            child: ordersAsync.when(
              data: (orders) {
                final pendingOrders = orders.where((o) => o.status == GaraOrderStatus.RECEPTION || o.status == GaraOrderStatus.IN_PROGRESS).toList();
                if (pendingOrders.isEmpty) return const Center(child: Text('Không có xe chờ sửa.'));
                
                return ListView.builder(
                  itemCount: pendingOrders.length,
                  itemBuilder: (context, index) {
                    final order = pendingOrders[index];
                    final isSelected = _selectedOrder?.id == order.id;
                    return ListTile(
                      selected: isSelected,
                      selectedTileColor: Colors.blue.withValues(alpha: 0.1),
                      leading: const CircleAvatar(child: Icon(Icons.car_repair)),
                      title: Text(order.vehicle.value?.licensePlate ?? 'Chưa rõ biển số', style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('${order.customer.value?.name} - ${order.orderCode}'),
                      onTap: () => _selectOrder(order),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            )
          ),
          const VerticalDivider(width: 1, thickness: 1),
          
          // Right: Detail & Products
          Expanded(
            flex: 2,
            child: _selectedOrder == null 
              ? const Center(child: Text('Vui lòng chọn 1 xe đang sửa ở danh sách bên trái'))
              : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.blueGrey[50],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Đang xử lý: ${_selectedOrder!.vehicle.value?.licensePlate}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Km: ${_selectedOrder!.currentKm}', style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        // Products List
                        Expanded(
                          child: productsAsync.when(
                            data: (products) {
                              return GridView.builder(
                                padding: const EdgeInsets.all(8),
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 1.0,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  return InkWell(
                                    onTap: () => _addService(product),
                                    child: Card(
                                      color: product.type == GaraProductType.PART ? Colors.blue[50] : Colors.orange[50],
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(product.type == GaraProductType.PART ? Icons.settings : Icons.engineering, size: 30),
                                          const SizedBox(height: 4),
                                          Text(product.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                          if (product.type == GaraProductType.PART)
                                            Text('Tồn: ${product.currentStock}', style: TextStyle(fontSize: 11, color: product.currentStock <= 5 ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            loading: () => const Center(child: CircularProgressIndicator()),
                            error: (err, st) => const SizedBox(),
                          ),
                        ),
                        const VerticalDivider(width: 1, thickness: 1),
                        // Current Details
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.grey[200],
                                width: double.infinity,
                                child: const Text('Các hạng mục sửa chữa', style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: _currentDetails.length,
                                  itemBuilder: (context, index) {
                                    final item = _currentDetails[index];
                                    return ListTile(
                                      title: Text(item.product.value?.name ?? ''),
                                      subtitle: Text('${item.quantity} x ${item.unitPrice} đ'),
                                      trailing: Text('${item.total} đ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  border: Border(top: BorderSide(color: Colors.grey)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Tổng phí:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        Text('$_totalAmount đ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, padding: const EdgeInsets.all(16)),
                                        onPressed: _currentDetails.isEmpty ? null : _completeOrder,
                                        child: const Text('Thanh Toán & Giao Xe', style: TextStyle(fontSize: 16)),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    )
                  )
                ],
              ),
          )
        ],
      )
    );
  }
}
