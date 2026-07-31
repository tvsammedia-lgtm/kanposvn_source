import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';
import '../services/database_service.dart';

class BackupRestoreScreen extends ConsumerStatefulWidget {
  const BackupRestoreScreen({super.key});

  @override
  ConsumerState<BackupRestoreScreen> createState() => _BackupRestoreScreenState();
}

class _BackupRestoreScreenState extends ConsumerState<BackupRestoreScreen> {
  bool _isProcessing = false;

  // ===================== EXPORT JSON =====================

  Future<void> _exportJson() async {
    setState(() => _isProcessing = true);
    try {
      final db = ref.read(dbProvider);
      final data = {
        'exportDate': DateTime.now().toIso8601String(),
        'appName': 'KanCafe POS',
        'areas': db.areas.map((a) => a.toJson()).toList(),
        'tables': db.tables.map((t) => t.toJson()).toList(),
        'categories': db.categories.map((c) => c.toJson()).toList(),
        'products': db.products.map((p) => p.toJson()).toList(),
        'recipes': db.recipes.map((r) => r.toJson()).toList(),
        'inventory': db.inventory.map((i) => i.toJson()).toList(),
        'customers': db.customers.map((c) => c.toJson()).toList(),
        'suppliers': db.suppliers.map((s) => s.toJson()).toList(),
        'orders': db.orders.map((o) => o.toJson()).toList(),
        'expenses': db.expenses.map((e) => e.toJson()).toList(),
        'debts': db.debts.map((d) => d.toJson()).toList(),
      };

      final jsonStr = const JsonEncoder.withIndent('  ').convert(data);
      final fileName = 'kancafe_backup_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.json';

      final result = await FilePicker.saveFile(
        dialogTitle: 'Lưu file JSON backup',
        fileName: fileName,
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        final file = File(result);
        await file.writeAsString(jsonStr);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Đã export JSON: $fileName'), backgroundColor: Colors.green),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi export JSON: $e'), backgroundColor: Colors.red),
        );
      }
    }
    setState(() => _isProcessing = false);
  }

  // ===================== IMPORT JSON =====================

  Future<void> _importJson() async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result == null || result.files.isEmpty) return;

      final file = File(result.files.first.path!);
      final jsonStr = await file.readAsString();
      final data = jsonDecode(jsonStr) as Map<String, dynamic>;

      if (!mounted) return;

      // Confirm import
      final confirm = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Xác nhận Import JSON'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('File: ${result.files.first.name}'),
              Text('Ngày export: ${data['exportDate'] ?? 'Không rõ'}'),
              const SizedBox(height: 12),
              const Text('Dữ liệu hiện tại sẽ bị GHI ĐÈ. Tiếp tục?', style: TextStyle(color: Colors.red)),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Import'),
            ),
          ],
        ),
      );

      if (confirm != true) return;
      setState(() => _isProcessing = true);

      final db = ref.read(dbProvider);
      // Restore data
      _restoreFromJson(db, data);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Import JSON thành công!'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi import JSON: $e'), backgroundColor: Colors.red),
        );
      }
    }
    setState(() => _isProcessing = false);
  }

  void _restoreFromJson(DatabaseService db, Map<String, dynamic> data) {
    // Areas
    final areas = (data['areas'] as List?)?.map((e) => AreaModel.fromJson(e)).toList() ?? [];
    for (var a in areas) { db.deleteArea(a.id); db.addArea(a); }

    // Tables
    final tables = (data['tables'] as List?)?.map((e) => TableModel.fromJson(e)).toList() ?? [];
    for (var t in tables) { db.addTable(t); }

    // Customers
    final customers = (data['customers'] as List?)?.map((e) => CustomerModel.fromJson(e)).toList() ?? [];
    for (var c in customers) { db.updateCustomer(c); }

    // Orders
    final orders = (data['orders'] as List?)?.map((e) => OrderModel.fromJson(e)).toList() ?? [];
    for (var o in orders) { db.saveOrder(o); }

    // Expenses
    final expenses = (data['expenses'] as List?)?.map((e) => ExpenseModel.fromJson(e)).toList() ?? [];
    for (var e in expenses) { db.addExpense(e); }

    // Inventory
    final inventory = (data['inventory'] as List?)?.map((e) => InventoryItemModel.fromJson(e)).toList() ?? [];
    for (var i in inventory) { db.addOrUpdateInventoryItem(i); }
  }

  // ===================== EXPORT CSV (cho Excel/Tax) =====================

  Future<void> _exportCsvOrders() async {
    setState(() => _isProcessing = true);
    try {
      final db = ref.read(dbProvider);
      final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
      final dateTime = DateFormat('dd/MM/yyyy HH:mm');

      final buffer = StringBuffer();
      buffer.writeln('Mã HĐ,Ngày tạo,Loại đơn,Bàn,Khu vực,Khách hàng,Số món,Tạm tính,Giảm giá,Phí ship,Tổng tiền,Phương thức TT,Trạng thái TT,Giờ vào,Giờ ra');

      for (var order in db.orders) {
        buffer.writeln('${order.orderCode},'
            '${dateTime.format(order.createdAt)},'
            '${order.type == OrderType.atTable ? "Tại bàn" : order.type == OrderType.takeaway ? "Mang đi" : "Giao hàng"},'
            '${order.tableName ?? ""},'
            '${order.areaName ?? ""},'
            '${order.customerName ?? ""},'
            '${order.items.length},'
            '${order.subtotal.toInt()},'
            '${order.discountAmount.toInt()},'
            '${order.deliveryFee.toInt()},'
            '${order.totalAmount.toInt()},'
            '${order.paymentMethod},'
            '${order.paymentStatus == "PAID" ? "Đã thanh toán" : "Chưa thanh toán"},'
            '${order.occupiedAt != null ? dateTime.format(order.occupiedAt!) : ""},'
            '${order.paidAt != null ? dateTime.format(order.paidAt!) : ""}');
      }

      await _saveCsvFile(buffer.toString(), 'kancafe_donhang_${DateFormat('yyyyMMdd').format(DateTime.now())}.csv');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
      }
    }
    setState(() => _isProcessing = false);
  }

  Future<void> _exportCsvExpenses() async {
    setState(() => _isProcessing = true);
    try {
      final db = ref.read(dbProvider);
      final dateTime = DateFormat('dd/MM/yyyy HH:mm');

      final buffer = StringBuffer();
      buffer.writeln('Tiêu đề,Danh mục,Loại (Thu/Chi),Số tiền,Phương thức TT,Ghi chú,Ngày tạo,Thao tác');

      for (var e in db.expenses) {
        buffer.writeln('${e.title},'
            '${e.categoryName},'
            '${e.type == "INCOME" ? "Thu" : "Chi"},'
            '${e.amount.toInt()},'
            '${e.paymentMethod},'
            '${e.note},'
            '${dateTime.format(e.createdAt)},'
            '${e.createdBy}');
      }

      await _saveCsvFile(buffer.toString(), 'kancafe_thuchi_${DateFormat('yyyyMMdd').format(DateTime.now())}.csv');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
      }
    }
    setState(() => _isProcessing = false);
  }

  Future<void> _exportCsvInventory() async {
    setState(() => _isProcessing = true);
    try {
      final db = ref.read(dbProvider);

      final buffer = StringBuffer();
      buffer.writeln('Mã NL,Tên nguyên liệu,Đơn vị,Tồn kho,Tồn tối thiểu,Đơn giá,Nhà cung cấp,Trạng thái');

      for (var i in db.inventory) {
        buffer.writeln('${i.sku},'
            '${i.name},'
            '${i.unit},'
            '${i.currentStock},'
            '${i.minStock},'
            '${i.costPrice.toInt()},'
            '${i.supplierName ?? ""},'
            '${i.isLowStock ? "THẤP" : "Bình thường"}');
      }

      await _saveCsvFile(buffer.toString(), 'kancafe_kho_${DateFormat('yyyyMMdd').format(DateTime.now())}.csv');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
      }
    }
    setState(() => _isProcessing = false);
  }

  Future<void> _saveCsvFile(String content, String fileName) async {
    final result = await FilePicker.saveFile(
      dialogTitle: 'Lưu file CSV (mở bằng Excel)',
      fileName: fileName,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      // BOM UTF-8 for Excel Vietnamese support
      final bomBytes = [0xEF, 0xBB, 0xBF];
      final file = File(result);
      await file.writeAsBytes([...bomBytes, ...utf8.encode(content)]);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đã export: $fileName'), backgroundColor: Colors.green),
        );
      }
    }
  }

  // ===================== UI =====================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Backup & Restore', style: TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.bold)),
      ),
      body: _isProcessing
          ? const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Đang xử lý...'),
            ]))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // JSON Section
                  _buildSection(
                    title: 'JSON (Backup/Restore toàn bộ)',
                    icon: Icons.code,
                    color: Colors.blue,
                    children: [
                      _buildActionCard(
                        title: 'Export JSON',
                        subtitle: 'Sao lưu toàn bộ dữ liệu',
                        icon: Icons.upload_file,
                        color: Colors.green,
                        onTap: _exportJson,
                      ),
                      _buildActionCard(
                        title: 'Import JSON',
                        subtitle: 'Khôi phục dữ liệu từ file backup',
                        icon: Icons.download,
                        color: Colors.orange,
                        onTap: _importJson,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // CSV/Excel Section
                  _buildSection(
                    title: 'CSV cho Excel (Báo cáo thuế)',
                    icon: Icons.table_chart,
                    color: Colors.green,
                    children: [
                      _buildActionCard(
                        title: 'Export Đơn hàng → CSV',
                        subtitle: 'Danh sách HĐ: mã, ngày, loại, bàn, tổng tiền, GT...',
                        icon: Icons.receipt_long,
                        color: Colors.blue,
                        onTap: _exportCsvOrders,
                      ),
                      _buildActionCard(
                        title: 'Export Thu Chi → CSV',
                        subtitle: 'Sổ sách thu chi: thu, chi, danh mục, ngày...',
                        icon: Icons.account_balance_wallet,
                        color: Colors.purple,
                        onTap: _exportCsvExpenses,
                      ),
                      _buildActionCard(
                        title: 'Export Tồn kho → CSV',
                        subtitle: 'Nguyên liệu: mã, tên, tồn kho, đơn giá, NCC...',
                        icon: Icons.inventory_2,
                        color: Colors.brown,
                        onTap: _exportCsvInventory,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Info
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Icon(Icons.info_outline, color: Colors.blue[700]),
                          const SizedBox(width: 8),
                          const Text('Hướng dẫn', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ]),
                        const Divider(),
                        _infoItem('JSON:', 'Backup/Restore toàn bộ dữ liệu app. Dùng khi chuyển máy hoặc khôi phục.'),
                        _infoItem('CSV:', 'File mở bằng Excel. Dùng cho báo cáo thuế, sổ sách kế toán.'),
                        _infoItem('UTF-8 BOM:', 'File CSV đã có BOM UTF-8, mở bằng Excel sẽ hiển thị tiếng Việt đúng.'),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSection({required String title, required IconData icon, required Color color, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 10),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          ]),
          const Divider(),
          ...children,
        ]),
      ),
    );
  }

  Widget _buildActionCard({required String title, required String subtitle, required IconData icon, required Color color, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: 0.15), child: Icon(icon, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        trailing: Icon(Icons.chevron_right, color: color),
        onTap: onTap,
      ),
    );
  }

  Widget _infoItem(String label, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          children: [
            TextSpan(text: '$label ', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }
}
