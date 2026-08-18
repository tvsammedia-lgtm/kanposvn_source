import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_order.dart';
import '../models/nhathuoc_patient.dart';
import '../models/nhathuoc_prescription.dart';
import '../../../core/auth/auth_service.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';

class NhathuocPosScreen extends ConsumerStatefulWidget {
  const NhathuocPosScreen({super.key});

  @override
  ConsumerState<NhathuocPosScreen> createState() => _NhathuocPosScreenState();
}

class _NhathuocPosScreenState extends ConsumerState<NhathuocPosScreen> {
  final List<NhathuocOrderDetail> _cart = [];
  String _searchQuery = '';
  NhathuocPatient? _selectedPatient;
  PaymentMethod _paymentMethod = PaymentMethod.CASH;
  double _cashReceived = 0;
  double _discountAmount = 0;
  final _cashCtrl = TextEditingController();
  final _discountCtrl = TextEditingController();

  void _addToCart(NhathuocMedicine medicine, {double quantity = 1}) {
    if (medicine.currentStock < quantity) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không đủ tồn kho: ${medicine.name} (còn ${medicine.currentStock})')),
      );
      return;
    }
    setState(() {
      final existingIndex = _cart.indexWhere((item) => item.medicine.value?.id == medicine.id);
      if (existingIndex >= 0) {
        _cart[existingIndex].quantity += quantity;
        _cart[existingIndex].total = _cart[existingIndex].quantity * _cart[existingIndex].unitPrice;
      } else {
        final detail = NhathuocOrderDetail()
          ..quantity = quantity
          ..unitPrice = medicine.retailPrice
          ..total = medicine.retailPrice * quantity;
        detail.medicine.value = medicine;
        _cart.add(detail);
      }
    });
  }

  void _applyTemplate(NhathuocPrescriptionTemplate template) {
    for (var d in template.details) {
      if (d.medicine.value != null) {
        _addToCart(d.medicine.value!, quantity: d.defaultQuantity);
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã áp dụng toa: ${template.diseaseName}')));
  }

  double get _subtotal => _cart.fold(0.0, (sum, item) => sum + item.total);
  double get _totalAmount => _subtotal - _discountAmount;
  double get _change => _cashReceived - _totalAmount;

  void _completeCheckout(ReceiptPrintMode mode) async {
    if (_cart.isEmpty) return;

    final order = NhathuocOrder()
      ..orderId = const Uuid().v4()
      ..orderCode = 'NT-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
      ..status = _paymentMethod == PaymentMethod.CREDIT
          ? NhathuocOrderStatus.CREDIT
          : NhathuocOrderStatus.COMPLETED
      ..orderDate = DateTime.now()
      ..paymentMethod = _paymentMethod
      ..cashReceived = _cashReceived
      ..discountAmount = _discountAmount
      ..changeAmount = _change > 0 ? _change : 0
      ..totalAmount = _totalAmount;

    if (_selectedPatient != null) {
      order.patient.value = _selectedPatient;
    }

    await ref.read(nhathuocOrdersProvider.notifier).createOrder(order, _cart);
    ref.read(nhathuocMedicinesProvider.notifier).loadMedicines();
    ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();

    if (mounted) {
      final storeName = await AuthService.loadSavedStoreName();
      final ownerName = await AuthService.loadSavedOwnerName();
      final storePhone = await AuthService.loadSavedStorePhone();
      final patient = order.patient.value;
      try {
        await printReceiptByMode(
          context,
          ref,
          ReceiptData(
            shopName: storeName ?? 'KANPOSVN NHÀ THUỐC',
            shopOwnerName: ownerName,
            shopPhone: storePhone,
            title: _paymentMethod == PaymentMethod.CREDIT ? 'PHIẾU BÁN NỢ' : 'HÓA ĐƠN BÁN THUỐC',
            orderCode: order.orderCode,
            date: order.orderDate ?? DateTime.now(),
            customer: patient?.name ?? '',
            qrData: order.orderCode,
            items: _cart
                .map((item) => ReceiptItem(
                      name: item.medicine.value?.name ?? 'Thuốc',
                      quantity: item.quantity,
                      unitPrice: item.unitPrice,
                      total: item.total,
                      extra: item.dosageInstructions,
                    ))
                .toList(),
            subtotal: _subtotal,
            grandTotal: _totalAmount,
          ),
          mode,
          pdfFilename: 'HoaDon_${order.orderCode}.pdf',
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('In hóa đơn thất bại: $e')),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_paymentMethod == PaymentMethod.CREDIT ? 'Đã ghi nhận bán nợ!' : 'Thanh toán thành công!')),
      );
      setState(() {
        _cart.clear();
        _selectedPatient = null;
        _paymentMethod = PaymentMethod.CASH;
        _cashReceived = 0;
        _discountAmount = 0;
        _cashCtrl.clear();
        _discountCtrl.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final medicinesAsync = ref.watch(nhathuocMedicinesProvider);
    final templatesAsync = ref.watch(nhathuocPrescriptionTemplatesProvider);
    final patientsAsync = ref.watch(nhathuocPatientsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bán Hàng (POS)'),
        actions: [
          templatesAsync.when(
            data: (templates) => PopupMenuButton<NhathuocPrescriptionTemplate>(
              icon: const Icon(Icons.receipt_long),
              tooltip: 'Kê Toa Nhanh',
              onSelected: _applyTemplate,
              itemBuilder: (context) => templates.map((t) => PopupMenuItem(
                value: t,
                child: Text('Toa: ${t.diseaseName}'),
              )).toList(),
            ),
            loading: () => const SizedBox(),
            error: (_, __) => const SizedBox(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          // Left: Product List
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Tìm thuốc (tên, mã vạch, hoạt chất)',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
                  ),
                ),
                Expanded(
                  child: medicinesAsync.when(
                    data: (medicines) {
                      final filtered = medicines.where((m) => m.name.toLowerCase().contains(_searchQuery) || m.activeIngredient.toLowerCase().contains(_searchQuery) || m.barcode.toLowerCase().contains(_searchQuery)).toList();
                      return GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final med = filtered[index];
                          final isLow = med.currentStock < 10;
                          return InkWell(
                            onTap: () => _addToCart(med),
                            child: Card(
                              color: med.isPrescriptionRequired ? Colors.red[50] : (isLow ? Colors.orange[50] : Colors.green[50]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(med.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
                                    Text(med.activeIngredient, style: const TextStyle(color: Colors.grey, fontSize: 11), textAlign: TextAlign.center),
                                    const SizedBox(height: 4),
                                    Text('${med.retailPrice.toStringAsFixed(0)} đ / ${med.unit}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                                    const SizedBox(height: 2),
                                    Text('Tồn: ${med.currentStock.toStringAsFixed(0)}', style: TextStyle(color: isLow ? Colors.red : Colors.black, fontSize: 11)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, st) => Center(child: Text('Lỗi: $err')),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // Right: Cart & Checkout
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // Patient Selection
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue[50],
                  child: patientsAsync.when(
                    data: (patients) => DropdownButton<NhathuocPatient>(
                      isExpanded: true,
                      hint: const Text('Chọn Bệnh Nhân (Không bắt buộc)'),
                      value: _selectedPatient,
                      items: [
                        const DropdownMenuItem<NhathuocPatient>(value: null, child: Text('Khách lẻ')),
                        ...patients.map((p) => DropdownMenuItem(value: p, child: Text('${p.name} - ${p.phone}')))
                      ],
                      onChanged: (val) {
                        setState(() => _selectedPatient = val);
                        if (val != null && val.allergies.isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Cảnh báo Dị ứng', style: TextStyle(color: Colors.red)),
                              content: Text('Bệnh nhân ${val.name} có tiền sử dị ứng:\n\n${val.allergies}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Đã hiểu')),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (_, __) => const Text('Lỗi tải BN'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.grey[200],
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Giỏ hàng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('${_cart.length} SP', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (context, index) {
                      final item = _cart[index];
                      bool isAllergic = false;
                      if (_selectedPatient != null && _selectedPatient!.allergies.toLowerCase().contains(item.medicine.value?.activeIngredient.toLowerCase() ?? '')) {
                        isAllergic = true;
                      }
                      if (_selectedPatient != null && _selectedPatient!.allergies.toLowerCase().contains(item.medicine.value?.name.toLowerCase() ?? '')) {
                        isAllergic = true;
                      }

                      return ListTile(
                        tileColor: isAllergic ? Colors.red[100] : null,
                        title: Text(item.medicine.value?.name ?? '', style: TextStyle(color: isAllergic ? Colors.red : Colors.black, fontWeight: isAllergic ? FontWeight.bold : FontWeight.normal, fontSize: 13)),
                        subtitle: Text('${item.quantity.toStringAsFixed(0)} x ${item.unitPrice.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 12)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${item.total.toStringAsFixed(0)} đ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 18),
                              onPressed: () => setState(() => _cart.removeAt(index)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Payment & Checkout
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
                  child: Column(
                    children: [
                      // Payment method selector
                      DropdownButtonFormField<PaymentMethod>(
                        value: _paymentMethod,
                        decoration: const InputDecoration(labelText: 'Phương thức thanh toán', border: OutlineInputBorder(), isDense: true),
                        items: PaymentMethod.values.where((p) => p != PaymentMethod.MIXED).map((p) => DropdownMenuItem(value: p, child: Text(p.label))).toList(),
                        onChanged: (v) => setState(() => _paymentMethod = v ?? PaymentMethod.CASH),
                      ),
                      const SizedBox(height: 8),
                      // Discount
                      TextField(
                        controller: _discountCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Giảm giá (đ)', border: OutlineInputBorder(), isDense: true),
                        onChanged: (v) => setState(() => _discountAmount = double.tryParse(v) ?? 0),
                      ),
                      if (_paymentMethod == PaymentMethod.CASH) ...[
                        const SizedBox(height: 8),
                        TextField(
                          controller: _cashCtrl,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Tiền khách đưa (đ)', border: OutlineInputBorder(), isDense: true),
                          onChanged: (v) => setState(() => _cashReceived = double.tryParse(v) ?? 0),
                        ),
                        if (_cashReceived > 0 && _change >= 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text('Tiền thối: ${_change.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                          ),
                        if (_cashReceived > 0 && _change < 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text('Thiếu: ${(-_change).toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          ),
                      ],
                      const SizedBox(height: 8),
                      // Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tổng:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('${_totalAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Checkout buttons
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                                onPressed: _cart.isEmpty ? null : () => _completeCheckout(ReceiptPrintMode.thermal80),
                                icon: const Icon(Icons.print, size: 14),
                                label: const Text('IN 80mm', style: TextStyle(fontSize: 11)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                                onPressed: _cart.isEmpty ? null : () => _completeCheckout(ReceiptPrintMode.pdf),
                                icon: const Icon(Icons.picture_as_pdf, size: 14),
                                label: const Text('IN PDF', style: TextStyle(fontSize: 11)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _paymentMethod == PaymentMethod.CREDIT ? Colors.orange : Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: _cart.isEmpty ? null : () => _completeCheckout(ReceiptPrintMode.auto),
                          child: Text(_paymentMethod == PaymentMethod.CREDIT ? 'GHI NỢ' : 'Thanh Toán', style: const TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
