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

  VlxdIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('vlxd_db')) {
      return Isar.getInstance('vlxd_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      // Schema thay đổi (VD: thêm field) -> lưu lại DB cũ và mở lại với schema mới
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/vlxd_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/vlxd_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
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
      name: 'vlxd_db',
    );
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
