import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_purchase.dart';
import '../models/nhathuoc_supplier.dart';

class NhathuocInventoryScreen extends ConsumerStatefulWidget {
  const NhathuocInventoryScreen({super.key});

  @override
  ConsumerState<NhathuocInventoryScreen> createState() => _NhathuocInventoryScreenState();
}

class _NhathuocInventoryScreenState extends ConsumerState<NhathuocInventoryScreen> {
  void _showImportDialog(BuildContext context, NhathuocMedicine medicine) {
    final qtyCtrl = TextEditingController();
    final batchCtrl = TextEditingController();
    final priceCtrl = TextEditingController(text: medicine.purchasePrice.toString());
    final expiryCtrl = TextEditingController();
    NhathuocSupplier? selectedSupplier;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text('Nhập Kho: ${medicine.name}'),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Giá nhập hiện tại: ${medicine.purchasePrice.toStringAsFixed(0)} đ'),
                  const SizedBox(height: 12),
                  _importField(qtyCtrl, 'Số lượng nhập *', keyboard: TextInputType.number),
                  _importField(batchCtrl, 'Số lô'),
                  _importField(priceCtrl, 'Giá nhập (đ)', keyboard: TextInputType.number),
                  _importField(expiryCtrl, 'Hạn dùng (YYYY-MM-DD)'),
                  const SizedBox(height: 8),
                  Consumer(
                    builder: (ctx, ref, _) {
                      final suppliersAsync = ref.watch(nhathuocSuppliersProvider);
                      return suppliersAsync.when(
                        data: (suppliers) => DropdownButtonFormField<NhathuocSupplier>(
                          isExpanded: true,
                          value: selectedSupplier,
                          hint: const Text('Chọn NCC'),
                          decoration: const InputDecoration(labelText: 'Nhà cung cấp', border: OutlineInputBorder(), isDense: true),
                          items: suppliers.map((s) => DropdownMenuItem(value: s, child: Text(s.name))).toList(),
                          onChanged: (v) => setDialogState(() => selectedSupplier = v),
                        ),
                        loading: () => const CircularProgressIndicator(),
                        error: (_, __) => const Text('Lỗi tải NCC'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                final qty = double.tryParse(qtyCtrl.text) ?? 0;
                if (qty <= 0) return;
                final price = double.tryParse(priceCtrl.text) ?? medicine.purchasePrice;
                DateTime? expiry;
                if (expiryCtrl.text.isNotEmpty) expiry = DateTime.tryParse(expiryCtrl.text);

                final tx = NhathuocPurchase()
                  ..purchaseId = const Uuid().v4()
                  ..documentCode = 'NK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                  ..purchaseDate = DateTime.now()
                  ..totalAmount = qty * price;

                final detail = NhathuocPurchaseDetail()
                  ..quantity = qty
                  ..purchasePrice = price
                  ..totalAmount = qty * price
                  ..batchNumber = batchCtrl.text.trim()
                  ..expiryDate = expiry;
                detail.medicine.value = medicine;
                detail.purchase.value = tx;
                if (selectedSupplier != null) {
                  tx.supplier.value = selectedSupplier;
                }

                await ref.read(nhathuocPurchasesProvider.notifier).createPurchase(tx, [detail]);
                ref.read(nhathuocMedicinesProvider.notifier).loadMedicines();
                ref.read(nhathuocFinanceProvider.notifier).calculateMetrics();
                if (context.mounted) Navigator.pop(ctx);
              },
              child: const Text('Lưu Phiếu Nhập'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _importField(TextEditingController ctrl, String label, {TextInputType? keyboard}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: ctrl,
        keyboardType: keyboard,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(), isDense: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý Kho Thuốc'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tồn Kho'),
              Tab(text: 'Nhập Hàng'),
              Tab(text: 'Cảnh Báo'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Current Stock
            Consumer(
              builder: (context, ref, child) {
                final medicinesAsync = ref.watch(nhathuocMedicinesProvider);
                return medicinesAsync.when(
                  data: (medicines) {
                    return ListView.builder(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        final m = medicines[index];
                        final isLow = m.currentStock < 10;
                        return ListTile(
                          leading: Icon(Icons.medication, color: m.isPrescriptionRequired ? Colors.red : (isLow ? Colors.orange : Colors.green)),
                          title: Text(m.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${m.activeIngredient} | ${m.category.label} | Lô: ${m.batchNumber.isNotEmpty ? m.batchNumber : "N/A"}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Tồn: ${m.currentStock.toStringAsFixed(0)} ${m.unit}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isLow ? Colors.red : Colors.blue)),
                                  if (m.expiryDate != null)
                                    Text('HSD: ${m.expiryDate!.toIso8601String().substring(0,10)}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () => _showImportDialog(context, m),
                                child: const Text('Nhập'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              },
            ),

            // Tab 2: Purchase History
            Consumer(
              builder: (context, ref, child) {
                final purchasesAsync = ref.watch(nhathuocPurchasesProvider);
                return purchasesAsync.when(
                  data: (txs) {
                    if (txs.isEmpty) return const Center(child: Text('Chưa có phiếu nhập kho nào.'));
                    txs.sort((a, b) => (b.purchaseDate ?? DateTime(0)).compareTo(a.purchaseDate ?? DateTime(0)));
                    return ListView.builder(
                      itemCount: txs.length,
                      itemBuilder: (context, index) {
                        final tx = txs[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: ListTile(
                            leading: const Icon(Icons.arrow_downward, color: Colors.green),
                            title: Text(tx.documentCode, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ngày: ${tx.purchaseDate?.toIso8601String().substring(0,10) ?? "N/A"}'),
                                if (tx.importedBy.isNotEmpty) Text('Nhập bởi: ${tx.importedBy}'),
                              ],
                            ),
                            trailing: Text('${tx.totalAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              },
            ),

            // Tab 3: Alerts
            Consumer(
              builder: (context, ref, child) {
                final medicinesAsync = ref.watch(nhathuocMedicinesProvider);
                return medicinesAsync.when(
                  data: (medicines) {
                    final now = DateTime.now();
                    final threeMonths = now.add(const Duration(days: 90));
                    final lowStock = medicines.where((m) => m.currentStock < 10).toList();
                    final expired = medicines.where((m) => m.expiryDate != null && m.expiryDate!.isBefore(now)).toList();
                    final expiringSoon = medicines.where((m) => m.expiryDate != null && m.expiryDate!.isAfter(now) && m.expiryDate!.isBefore(threeMonths)).toList();

                    return ListView(
                      padding: const EdgeInsets.all(8),
                      children: [
                        if (lowStock.isNotEmpty) ...[
                          _sectionHeader('Thuốc Sắp Hết (${lowStock.length})', Colors.orange),
                          ...lowStock.map((m) => ListTile(
                            leading: const Icon(Icons.warning, color: Colors.orange),
                            title: Text(m.name),
                            trailing: Text('Tồn: ${m.currentStock.toStringAsFixed(0)}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          )),
                        ],
                        if (expired.isNotEmpty) ...[
                          _sectionHeader('Thuốc Hết Hạn (${expired.length})', Colors.red),
                          ...expired.map((m) => ListTile(
                            leading: const Icon(Icons.error, color: Colors.red),
                            title: Text(m.name),
                            subtitle: Text('HSD: ${m.expiryDate!.toIso8601String().substring(0,10)}'),
                          )),
                        ],
                        if (expiringSoon.isNotEmpty) ...[
                          _sectionHeader('Thuốc Sắp Hết Hạn (${expiringSoon.length})', Colors.amber),
                          ...expiringSoon.map((m) => ListTile(
                            leading: const Icon(Icons.schedule, color: Colors.amber),
                            title: Text(m.name),
                            subtitle: Text('HSD: ${m.expiryDate!.toIso8601String().substring(0,10)}'),
                          )),
                        ],
                        if (lowStock.isEmpty && expired.isEmpty && expiringSoon.isEmpty)
                          const Center(child: Padding(
                            padding: EdgeInsets.all(32),
                            child: Text('Không có cảnh báo nào!', style: TextStyle(color: Colors.green, fontSize: 16)),
                          )),
                      ],
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
    );
  }
}
