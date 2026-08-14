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

  void _addToCart(NhathuocMedicine medicine, {double quantity = 1}) {
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

  double get _totalAmount => _cart.fold(0.0, (sum, item) => sum + item.total);

  void _completeCheckout(ReceiptPrintMode mode) async {
    if (_cart.isEmpty) return;

    final order = NhathuocOrder()
      ..orderId = const Uuid().v4()
      ..orderCode = 'NT-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
      ..status = NhathuocOrderStatus.COMPLETED
      ..orderDate = DateTime.now()
      ..totalAmount = _totalAmount;

    if (_selectedPatient != null) {
      order.patient.value = _selectedPatient;
    }

    await ref.read(nhathuocOrdersProvider.notifier).createOrder(order, _cart);
    ref.read(nhathuocMedicinesProvider.notifier).loadMedicines(); // Refresh stock
    ref.read(nhathuocFinanceProvider.notifier).calculateMetrics(); // Refresh dashboard

    if (mounted) {
      final storeName = await AuthService.loadSavedStoreName();
      final storePhone = await AuthService.loadSavedStorePhone();
      final patient = order.patient.value;
      try {
        await printReceiptByMode(
          context,
          ref,
          ReceiptData(
            shopName: storeName ?? 'KANPOSVN NHÀ THUỐC',
            shopPhone: storePhone,
            title: 'HÓA ĐƠN BÁN THUỐC',
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
            subtotal: _totalAmount,
            grandTotal: order.totalAmount,
          ),
          mode,
          pdfFilename: 'HoaDon_${order.orderCode}.pdf',
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('In hóa đơn thất bại: $e')),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thanh toán thành công!')));
      setState(() {
        _cart.clear();
        _selectedPatient = null;
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
          // Select Template
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
                      final filtered = medicines.where((m) => m.name.toLowerCase().contains(_searchQuery) || m.activeIngredient.toLowerCase().contains(_searchQuery)).toList();
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
                          return InkWell(
                            onTap: () => _addToCart(med),
                            child: Card(
                              color: med.isPrescriptionRequired ? Colors.red[50] : Colors.green[50],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(med.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center),
                                    Text(med.activeIngredient, style: const TextStyle(color: Colors.grey, fontSize: 12), textAlign: TextAlign.center),
                                    const SizedBox(height: 8),
                                    Text('${med.retailPrice} đ / ${med.unit}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text('Tồn: ${med.currentStock}', style: TextStyle(color: med.currentStock <= 0 ? Colors.red : Colors.black)),
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
          // Right: Cart & Patient
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
                        setState(() {
                          _selectedPatient = val;
                        });
                        if (val != null && val.allergies.isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Cảnh báo Dị ứng', style: TextStyle(color: Colors.red)),
                              content: Text('Bệnh nhân ${val.name} có tiền sử dị ứng:\n\n${val.allergies}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Đã hiểu')),
                              ],
                            )
                          );
                        }
                      },
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (_, __) => const Text('Lỗi tải BN'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[200],
                  width: double.infinity,
                  child: const Text('Giỏ hàng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (context, index) {
                      final item = _cart[index];
                      // Check allergy highlight
                      bool isAllergic = false;
                      if (_selectedPatient != null && _selectedPatient!.allergies.toLowerCase().contains(item.medicine.value?.activeIngredient.toLowerCase() ?? '')) {
                        isAllergic = true;
                      }
                      if (_selectedPatient != null && _selectedPatient!.allergies.toLowerCase().contains(item.medicine.value?.name.toLowerCase() ?? '')) {
                        isAllergic = true;
                      }

                      return ListTile(
                        tileColor: isAllergic ? Colors.red[100] : null,
                        title: Text(item.medicine.value?.name ?? '', style: TextStyle(color: isAllergic ? Colors.red : Colors.black, fontWeight: isAllergic ? FontWeight.bold : FontWeight.normal)),
                        subtitle: Text('${item.quantity} x ${item.unitPrice} đ'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${item.total} đ', style: const TextStyle(fontWeight: FontWeight.bold)),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _cart.removeAt(index);
                                });
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tổng cộng:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('$_totalAmount đ', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: _cart.isEmpty
                                    ? null
                                    : () => _completeCheckout(
                                          ReceiptPrintMode.thermal80,
                                        ),
                                icon: const Icon(Icons.print, size: 16),
                                label: const Text('IN BILL 80mm',
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: _cart.isEmpty
                                    ? null
                                    : () => _completeCheckout(
                                          ReceiptPrintMode.pdf,
                                        ),
                                icon: const Icon(Icons.picture_as_pdf, size: 16),
                                label: const Text('IN PDF',
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                          onPressed: _cart.isEmpty
                              ? null
                              : () => _completeCheckout(ReceiptPrintMode.auto),
                          child: const Text('Thanh Toán', style: TextStyle(fontSize: 18)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
