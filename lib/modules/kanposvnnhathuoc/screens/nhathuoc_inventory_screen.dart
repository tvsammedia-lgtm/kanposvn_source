import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_purchase.dart';

class NhathuocInventoryScreen extends ConsumerStatefulWidget {
  const NhathuocInventoryScreen({super.key});

  @override
  ConsumerState<NhathuocInventoryScreen> createState() => _NhathuocInventoryScreenState();
}

class _NhathuocInventoryScreenState extends ConsumerState<NhathuocInventoryScreen> {
  void _showImportDialog(BuildContext context, NhathuocMedicine medicine) {
    final qtyCtrl = TextEditingController();
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Nhập Kho: ${medicine.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Giá nhập hiện tại: ${medicine.purchasePrice} đ'),
            const SizedBox(height: 16),
            TextField(controller: qtyCtrl, decoration: const InputDecoration(labelText: 'Số lượng nhập'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              final qty = double.tryParse(qtyCtrl.text) ?? 0;
              if (qty > 0) {
                final tx = NhathuocPurchase()
                  ..purchaseId = const Uuid().v4()
                  ..documentCode = 'NK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                  ..purchaseDate = DateTime.now()
                  ..totalAmount = qty * medicine.purchasePrice;

                final detail = NhathuocPurchaseDetail()
                  ..quantity = qty
                  ..purchasePrice = medicine.purchasePrice
                  ..totalAmount = qty * medicine.purchasePrice;
                detail.medicine.value = medicine;
                detail.purchase.value = tx;

                await ref.read(nhathuocPurchasesProvider.notifier).createPurchase(tx, [detail]);
                ref.read(nhathuocMedicinesProvider.notifier).loadMedicines(); // Refresh stock
                ref.read(nhathuocFinanceProvider.notifier).calculateMetrics(); // Refresh dashboard
                if (context.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text('Lưu Phiếu Nhập'),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý Kho Thuốc'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tồn Kho Hiện Tại'),
              Tab(text: 'Lịch Sử Nhập Hàng'),
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
                        return ListTile(
                          leading: Icon(Icons.medication, color: m.isPrescriptionRequired ? Colors.red : Colors.green),
                          title: Text(m.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${m.activeIngredient} | ${m.category.label}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Tồn: ${m.currentStock} ${m.unit}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: m.currentStock < 10 ? Colors.red : Colors.blue)),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () => _showImportDialog(context, m),
                                child: const Text('Nhập Hàng'),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              }
            ),

            // Tab 2: Purchase History
            Consumer(
              builder: (context, ref, child) {
                final purchasesAsync = ref.watch(nhathuocPurchasesProvider);
                return purchasesAsync.when(
                  data: (txs) {
                    if (txs.isEmpty) return const Center(child: Text('Chưa có phiếu nhập kho nào.'));
                    return ListView.builder(
                      itemCount: txs.length,
                      itemBuilder: (context, index) {
                        final tx = txs[index];
                        return ListTile(
                          leading: const Icon(Icons.arrow_downward, color: Colors.green),
                          title: Text(tx.documentCode),
                          subtitle: Text(tx.purchaseDate.toString()),
                          trailing: Text('${tx.totalAmount} đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, st) => Center(child: Text('Lỗi: $err')),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
