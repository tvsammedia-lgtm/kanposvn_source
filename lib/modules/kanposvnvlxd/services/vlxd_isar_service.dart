import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/vlxd_product.dart';
import '../models/vlxd_inventory.dart';
import '../models/vlxd_partner.dart';
import '../models/vlxd_order.dart';
import '../models/vlxd_finance.dart';
import '../models/vlxd_sync_model.dart';

class VlxdIsarService {
  late Future<Isar> db;

  /// Chi nhánh hiện tại (mô hình 1 module = nhiều chi nhánh).
  /// Khác biệt → mỗi chi nhánh dùng một Isar DB riêng (`vlxd_db_<branchId>`),
  /// tránh dùng chung 1 DB rồi push cùng bộ dữ liệu lên mọi chi nhánh.
  final String? branchId;

  VlxdIsarService({this.branchId}) {
    db = openDB();
  }

  String get _dbName {
    if (branchId == null || branchId!.isEmpty) return 'vlxd_db';
    final safe = branchId!.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    return 'vlxd_db_$safe';
  }

  Future<Isar> openDB() async {
    final name = _dbName;
    // KHÔNG đóng các instance khác tại đây: việc dọn dẹp instance cũ được làm
    // trong `dispose()` (thuộc vòng đời provider) để tránh `close()` blocking
    // làm treo UI khi đang chuyển module/chi nhánh.
    final current = Isar.getInstance(name);
    if (current != null && current.isOpen) {
      return current;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      // Schema thay đổi (VD: thêm field) -> lưu lại DB cũ và mở lại với schema mới
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/$name.isar');
        if (oldDir.existsSync()) {
          await oldDir.rename('${dir.path}/${name}_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  /// Đóng Isar instance do service này quản lý (gọi khi provider bị dispose).
  /// Không blocking UI: chỉ đóng nếu instance vẫn mở và không ai khác đang dùng.
  Future<void> dispose() async {
    final inst = Isar.getInstance(_dbName);
    if (inst != null && inst.isOpen) {
      try {
        await inst.close();
      } catch (_) {
        // best-effort
      }
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        VlxdProductCategorySchema,
        VlxdProductSchema,
        VlxdWarehouseSchema,
        VlxdInventoryStockSchema,
        VlxdInventoryTransactionSchema,
        VlxdInventoryTransactionDetailSchema,
        VlxdCustomerSchema,
        VlxdSupplierSchema,
        VlxdOrderSchema,
        VlxdOrderDetailSchema,
        VlxdDeliveryTicketSchema,
        VlxdFinanceTransactionSchema,
        VlxdSyncQueueSchema,
        VlxdSyncConfigSchema,
      ],
      inspector: true,
      directory: dirPath,
      name: _dbName,
    );
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
