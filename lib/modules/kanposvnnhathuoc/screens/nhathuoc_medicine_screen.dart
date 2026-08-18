import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_medicine.dart';

class NhathuocMedicineScreen extends ConsumerStatefulWidget {
  const NhathuocMedicineScreen({super.key});

  @override
  ConsumerState<NhathuocMedicineScreen> createState() => _NhathuocMedicineScreenState();
}

class _NhathuocMedicineScreenState extends ConsumerState<NhathuocMedicineScreen> {
  String _searchQuery = '';
  MedicineCategory? _filterCategory;

  void _showAddEditDialog({NhathuocMedicine? medicine}) {
    final nameCtrl = TextEditingController(text: medicine?.name ?? '');
    final barcodeCtrl = TextEditingController(text: medicine?.barcode ?? '');
    final activeIngredientCtrl = TextEditingController(text: medicine?.activeIngredient ?? '');
    final strengthCtrl = TextEditingController(text: medicine?.strength ?? '');
    final unitCtrl = TextEditingController(text: medicine?.unit ?? '');
    final dosageFormCtrl = TextEditingController(text: medicine?.dosageForm ?? '');
    final specCtrl = TextEditingController(text: medicine?.specification ?? '');
    final manufacturerCtrl = TextEditingController(text: medicine?.manufacturer ?? '');
    final countryCtrl = TextEditingController(text: medicine?.countryOfOrigin ?? '');
    final drugGroupCtrl = TextEditingController(text: medicine?.drugGroup ?? '');
    final retailPriceCtrl = TextEditingController(text: medicine?.retailPrice.toString() ?? '');
    final purchasePriceCtrl = TextEditingController(text: medicine?.purchasePrice.toString() ?? '');
    final vatCtrl = TextEditingController(text: medicine?.vat.toString() ?? '0');
    final stockCtrl = TextEditingController(text: medicine?.currentStock.toString() ?? '0');
    final expiryCtrl = TextEditingController(text: medicine?.expiryDate?.toIso8601String().substring(0,10) ?? '');
    final batchCtrl = TextEditingController(text: medicine?.batchNumber ?? '');
    final regNumCtrl = TextEditingController(text: medicine?.registrationNumber ?? '');
    final descCtrl = TextEditingController(text: medicine?.description ?? '');
    final noteCtrl = TextEditingController(text: medicine?.note ?? '');
    
    MedicineCategory selectedCategory = medicine?.category ?? MedicineCategory.OTHER;
    bool isRx = medicine?.isPrescriptionRequired ?? false;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(medicine != null ? 'Sửa Thuốc' : 'Thêm Thuốc Mới'),
          content: SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _field(nameCtrl, 'Tên thuốc *'),
                  _field(barcodeCtrl, 'Barcode'),
                  _field(activeIngredientCtrl, 'Hoạt chất'),
                  _field(strengthCtrl, 'Hàm lượng (VD: 500mg)'),
                  Row(
                    children: [
                      Expanded(child: _field(unitCtrl, 'Đơn vị tính')),
                      const SizedBox(width: 8),
                      Expanded(child: _field(dosageFormCtrl, 'Dạng bào chế')),
                    ],
                  ),
                  _field(specCtrl, 'Quy cách (VD: Hộp 10 vỉ x 10 viên)'),
                  Row(
                    children: [
                      Expanded(child: _field(manufacturerCtrl, 'Nhà sản xuất')),
                      const SizedBox(width: 8),
                      Expanded(child: _field(countryCtrl, 'Nước sản xuất')),
                    ],
                  ),
                  _field(drugGroupCtrl, 'Nhóm thuốc'),
                  Row(
                    children: [
                      Expanded(child: _field(retailPriceCtrl, 'Giá bán (đ)', keyboard: TextInputType.number)),
                      const SizedBox(width: 8),
                      Expanded(child: _field(purchasePriceCtrl, 'Giá vốn (đ)', keyboard: TextInputType.number)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _field(vatCtrl, 'VAT %', keyboard: TextInputType.number)),
                      const SizedBox(width: 8),
                      Expanded(child: _field(stockCtrl, 'Tồn kho', keyboard: TextInputType.number)),
                    ],
                  ),
                  _field(batchCtrl, 'Số lô'),
                  _field(regNumCtrl, 'Số đăng ký'),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<MedicineCategory>(
                          value: selectedCategory,
                          decoration: const InputDecoration(labelText: 'Loại thuốc', border: OutlineInputBorder()),
                          items: MedicineCategory.values.map((c) => DropdownMenuItem(value: c, child: Text(c.label))).toList(),
                          onChanged: (v) => setDialogState(() => selectedCategory = v ?? MedicineCategory.OTHER),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SwitchListTile(
                          title: const Text('Kê đơn'),
                          value: isRx,
                          onChanged: (v) => setDialogState(() => isRx = v),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                  _field(descCtrl, 'Mô tả', maxLines: 2),
                  _field(noteCtrl, 'Ghi chú'),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                final retailPrice = double.tryParse(retailPriceCtrl.text) ?? 0;
                final purchasePrice = double.tryParse(purchasePriceCtrl.text) ?? 0;
                final vat = double.tryParse(vatCtrl.text) ?? 0;
                final stock = double.tryParse(stockCtrl.text) ?? 0;
                DateTime? expiry;
                if (expiryCtrl.text.isNotEmpty) {
                  expiry = DateTime.tryParse(expiryCtrl.text);
                }

                if (medicine != null) {
                  medicine.name = nameCtrl.text.trim();
                  medicine.barcode = barcodeCtrl.text.trim();
                  medicine.activeIngredient = activeIngredientCtrl.text.trim();
                  medicine.strength = strengthCtrl.text.trim();
                  medicine.unit = unitCtrl.text.trim();
                  medicine.dosageForm = dosageFormCtrl.text.trim();
                  medicine.specification = specCtrl.text.trim();
                  medicine.manufacturer = manufacturerCtrl.text.trim();
                  medicine.countryOfOrigin = countryCtrl.text.trim();
                  medicine.drugGroup = drugGroupCtrl.text.trim();
                  medicine.retailPrice = retailPrice;
                  medicine.purchasePrice = purchasePrice;
                  medicine.vat = vat;
                  medicine.currentStock = stock;
                  medicine.batchNumber = batchCtrl.text.trim();
                  medicine.registrationNumber = regNumCtrl.text.trim();
                  medicine.description = descCtrl.text.trim();
                  medicine.note = noteCtrl.text.trim();
                  medicine.category = selectedCategory;
                  medicine.isPrescriptionRequired = isRx;
                  medicine.expiryDate = expiry;
                  medicine.updatedAt = DateTime.now();
                  await ref.read(nhathuocMedicinesProvider.notifier).addMedicine(medicine);
                } else {
                  final newMed = NhathuocMedicine()
                    ..medicineId = const Uuid().v4()
                    ..name = nameCtrl.text.trim()
                    ..barcode = barcodeCtrl.text.trim()
                    ..activeIngredient = activeIngredientCtrl.text.trim()
                    ..strength = strengthCtrl.text.trim()
                    ..unit = unitCtrl.text.trim()
                    ..dosageForm = dosageFormCtrl.text.trim()
                    ..specification = specCtrl.text.trim()
                    ..manufacturer = manufacturerCtrl.text.trim()
                    ..countryOfOrigin = countryCtrl.text.trim()
                    ..drugGroup = drugGroupCtrl.text.trim()
                    ..retailPrice = retailPrice
                    ..purchasePrice = purchasePrice
                    ..vat = vat
                    ..currentStock = stock
                    ..batchNumber = batchCtrl.text.trim()
                    ..registrationNumber = regNumCtrl.text.trim()
                    ..description = descCtrl.text.trim()
                    ..note = noteCtrl.text.trim()
                    ..category = selectedCategory
                    ..isPrescriptionRequired = isRx
                    ..expiryDate = expiry;
                  await ref.read(nhathuocMedicinesProvider.notifier).addMedicine(newMed);
                }
                if (mounted) Navigator.pop(ctx);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label, {TextInputType? keyboard, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: ctrl,
        keyboardType: keyboard,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(), isDense: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final medicinesAsync = ref.watch(nhathuocMedicinesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Mục Thuốc'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.white),
            tooltip: 'Thêm thuốc mới',
            onPressed: () => _showAddEditDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Tìm thuốc (tên, mã vạch, hoạt chất)',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<MedicineCategory?>(
                    value: _filterCategory,
                    decoration: const InputDecoration(labelText: 'Loại', border: OutlineInputBorder()),
                    items: [
                      const DropdownMenuItem<MedicineCategory?>(value: null, child: Text('Tất cả')),
                      ...MedicineCategory.values.map((c) => DropdownMenuItem(value: c, child: Text(c.label))),
                    ],
                    onChanged: (v) => setState(() => _filterCategory = v),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: medicinesAsync.when(
              data: (medicines) {
                final filtered = medicines.where((m) {
                  final matchSearch = m.name.toLowerCase().contains(_searchQuery) ||
                      m.activeIngredient.toLowerCase().contains(_searchQuery) ||
                      m.barcode.toLowerCase().contains(_searchQuery);
                  final matchCategory = _filterCategory == null || m.category == _filterCategory;
                  return matchSearch && matchCategory;
                }).toList();
                if (filtered.isEmpty) return const Center(child: Text('Không tìm thấy thuốc nào.'));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final m = filtered[index];
                    final isLowStock = m.currentStock < 10;
                    final isExpired = m.expiryDate != null && m.expiryDate!.isBefore(DateTime.now());
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: isExpired ? Colors.red[50] : (isLowStock ? Colors.orange[50] : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          m.isPrescriptionRequired ? Icons.medical_services : Icons.medication,
                          color: m.isPrescriptionRequired ? Colors.red : Colors.green,
                          size: 32,
                        ),
                        title: Text(m.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${m.activeIngredient} | ${m.dosageForm} | ${m.unit}'),
                            Text('${m.category.label} | ${m.manufacturer.isNotEmpty ? m.manufacturer : "N/A"}'),
                            if (m.expiryDate != null)
                              Text('HSD: ${m.expiryDate!.toIso8601String().substring(0,10)}',
                                style: TextStyle(color: isExpired ? Colors.red : Colors.grey, fontSize: 12)),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${m.retailPrice.toStringAsFixed(0)} đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 14)),
                                Text('Tồn: ${m.currentStock.toStringAsFixed(0)}', style: TextStyle(fontSize: 12, color: isLowStock ? Colors.red : Colors.grey)),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              onPressed: () => _showAddEditDialog(medicine: m),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Xóa thuốc?'),
                                    content: Text('Xóa ${m.name} khỏi danh mục?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Không')),
                                      TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Xóa', style: TextStyle(color: Colors.red))),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await ref.read(nhathuocMedicinesProvider.notifier).deleteMedicine(m.id);
                                }
                              },
                            ),
                          ],
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
    );
  }
}
