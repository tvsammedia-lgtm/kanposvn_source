import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/tt_product.dart';
import '../models/tt_finance.dart';
import '../providers/tt_providers.dart';

/// Tab "Cài Đặt": thông tin sạp, danh mục sản phẩm, đơn vị tính, nhóm chi phí,
/// xóa sạch dữ liệu demo.
class TtSettingsScreen extends ConsumerStatefulWidget {
  const TtSettingsScreen({super.key});

  @override
  ConsumerState<TtSettingsScreen> createState() => _TtSettingsScreenState();
}

class _TtSettingsScreenState extends ConsumerState<TtSettingsScreen> {
  final _nameCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStoreName();
  }

  Future<void> _loadStoreName() async {
    final prefs = await SharedPreferences.getInstance();
final n = prefs.getString('store_name');
    if (n != null && n.isNotEmpty) {
      _nameCtrl.text = n;
    } else {
      _nameCtrl.text = 'SẠP RAU CỦ QUẢ';
    }
  }

  Future<void> _saveStoreName() async {
    final prefs = await SharedPreferences.getInstance();
await prefs.setString('store_name', _nameCtrl.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã lưu thông tin sạp')));
  }

  Future<void> _addCategory() async {
    final ctrl = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm danh mục'),
        content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Tên danh mục')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Thêm')),
        ],
      ),
    );
    if (ok != true || ctrl.text.trim().isEmpty) return;
    final db = await ref.read(ttIsarServiceProvider).db;
    await db.writeTxn(() async {
      await db.ttCategorys.put(TtCategory()..categoryId = const Uuid().v4()..name = ctrl.text.trim());
    });
    ref.invalidate(ttCategoriesProvider);
  }

  Future<void> _addUnit() async {
    final nameCtrl = TextEditingController();
    final rateCtrl = TextEditingController(text: '1');
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm đơn vị tính'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên đơn vị (kg, bó, túi...)')),
            const SizedBox(height: 8),
            TextField(controller: rateCtrl, decoration: const InputDecoration(labelText: 'Quy đổi về kg (VD: 1 bao = 25)'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Thêm')),
        ],
      ),
    );
    if (ok != true || nameCtrl.text.trim().isEmpty) return;
    final db = await ref.read(ttIsarServiceProvider).db;
    await db.writeTxn(() async {
      await db.ttUnits.put(TtUnit()
        ..unitId = const Uuid().v4()
        ..name = nameCtrl.text.trim()
        ..conversionRate = double.tryParse(rateCtrl.text.replaceAll(',', '.')) ?? 1);
    });
    ref.invalidate(ttCategoriesProvider);
  }

  Future<void> _addExpenseCat() async {
    final ctrl = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm nhóm chi phí'),
        content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Tên nhóm')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Thêm')),
        ],
      ),
    );
    if (ok != true || ctrl.text.trim().isEmpty) return;
    final db = await ref.read(ttIsarServiceProvider).db;
    await db.writeTxn(() async {
      await db.ttExpenseCategorys.put(TtExpenseCategory()..categoryId = const Uuid().v4()..name = ctrl.text.trim());
    });
    ref.invalidate(ttExpenseCategoriesProvider);
  }

  Future<void> _addProduct() async {
    final nameCtrl = TextEditingController();
    final sellCtrl = TextEditingController();
    final buyCtrl = TextEditingController();
    final cats = await ref.read(ttCategoriesProvider.future);
    TtCategory? category = cats.isNotEmpty ? cats.first : null;

    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm sản phẩm'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên sản phẩm')),
            const SizedBox(height: 8),
            DropdownButtonFormField<TtCategory>(
              value: category,
              decoration: const InputDecoration(labelText: 'Danh mục'),
              items: [for (final c in cats) DropdownMenuItem(value: c, child: Text(c.name))],
              onChanged: (v) => category = v,
            ),
            const SizedBox(height: 8),
            TextField(controller: buyCtrl, decoration: const InputDecoration(labelText: 'Giá nhập (đ/kg)'), keyboardType: TextInputType.number),
            const SizedBox(height: 8),
            TextField(controller: sellCtrl, decoration: const InputDecoration(labelText: 'Giá bán (đ/kg)'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Thêm')),
        ],
      ),
    );
    if (ok != true || nameCtrl.text.trim().isEmpty) return;
    final db = await ref.read(ttIsarServiceProvider).db;
    final p = TtProduct()
      ..productId = const Uuid().v4()
      ..sku = 'RC${nameCtrl.text.hashCode.abs() % 99999999}'
      ..name = nameCtrl.text.trim()
      ..baseUnit = 'kg'
      ..purchaseUnit = 'kg'
      ..saleUnit = 'kg'
      ..defaultPurchasePrice = double.tryParse(buyCtrl.text.replaceAll(',', '.')) ?? 0
      ..defaultSalePrice = double.tryParse(sellCtrl.text.replaceAll(',', '.')) ?? 0
      ..minStock = 5
      ..maxStock = 40
      ..reorderLevel = 10
      ..shelfLifeDays = 5
      ..isPerishable = true;
    if (category != null) p.category.value = category;
    await db.writeTxn(() async {
      await db.ttProducts.put(p);
      await p.category.save();
    });
    await ref.read(ttProductsProvider.notifier).loadProducts();
  }

  Future<void> _resetData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa toàn bộ dữ liệu?'),
        content: const Text('Sạp Rau Củ Quả sẽ tự nạp lại dữ liệu mẫu sau khi xóa.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final db = await ref.read(ttIsarServiceProvider).db;
await db.writeTxn(() async {
      db.clear();
    });
    ref.invalidate(ttIsarServiceProvider);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã xóa dữ liệu. Khởi động lại tab để nạp lại mẫu.')));
  }

  @override
  Widget build(BuildContext context) {
    final catsAsync = ref.watch(ttCategoriesProvider);
    final expCatsAsync = ref.watch(ttExpenseCategoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Cài Đặt', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('THÔNG TIN SẠP', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(labelText: 'Tên sạp', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _saveStoreName,
                      icon: const Icon(Icons.save),
                      label: const Text('Lưu'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('DANH MỤC SẢN PHẨM', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Thêm danh mục',
                        icon: const Icon(Icons.add_circle, color: Color(0xFF16A34A)),
                        onPressed: _addCategory,
                      ),
                      IconButton(
                        tooltip: 'Thêm sản phẩm',
                        icon: const Icon(Icons.add_box, color: Color(0xFF16A34A)),
                        onPressed: _addProduct,
                      ),
                    ],
                  ),
                  catsAsync.when(
                    loading: () => const LinearProgressIndicator(),
                    error: (e, st) => Text('Lỗi: $e'),
                    data: (cats) => Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [for (final c in cats) Chip(label: Text(c.name))],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('ĐƠN VỊ TÍNH', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Thêm đơn vị',
                        icon: const Icon(Icons.add_circle, color: Color(0xFF16A34A)),
                        onPressed: _addUnit,
                      ),
                    ],
                  ),
                  Text('Quy đổi về kg: 1 bó = 0.5 kg, 1 bao = 25 kg, 1 thùng = 10 kg...',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('NHÓM CHI PHÍ', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Thêm nhóm chi phí',
                        icon: const Icon(Icons.add_circle, color: Color(0xFF16A34A)),
                        onPressed: _addExpenseCat,
                      ),
                    ],
                  ),
                  expCatsAsync.when(
                    loading: () => const LinearProgressIndicator(),
                    error: (e, st) => Text('Lỗi: $e'),
                    data: (cats) => Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [for (final c in cats) Chip(label: Text(c.name))],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text('Xóa dữ liệu demo'),
              subtitle: const Text('Đưa ứng dụng về trạng thái như mới'),
              onTap: _resetData,
            ),
          ),
        ],
      ),
    );
  }
}

