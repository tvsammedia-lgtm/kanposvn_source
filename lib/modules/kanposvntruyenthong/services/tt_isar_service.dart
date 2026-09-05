import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/tt_product.dart';
import '../models/tt_partner.dart';
import '../models/tt_loyalty.dart';
import '../models/tt_order.dart';
import '../models/tt_stock.dart';
import '../models/tt_finance.dart';
import '../models/tt_sync_model.dart';

class TtIsarService {
  late Future<Isar> db;

  TtIsarService() {
    db = openDB();
  }

  TtIsarService.forIsar(Isar isar) {
    db = Future.value(isar);
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('kanposvntruyenthong_db')) {
      return Isar.getInstance('kanposvntruyenthong_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      // Schema thay đổi (VD: thêm field) -> lưu lại DB cũ và mở lại với schema mới
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/kanposvntruyenthong_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/kanposvntruyenthong_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        TtCategorySchema,
        TtUnitSchema,
        TtProductSchema,
        TtCustomerSchema,
        TtSupplierSchema,
        TtLoyaltyRuleSchema,
        TtLoyaltyTransactionSchema,
        TtSalesInvoiceSchema,
        TtSalesItemSchema,
        TtPurchaseInvoiceSchema,
        TtPurchaseItemSchema,
        TtStockLotSchema,
        TtStockIssueSchema,
        TtStockMovementSchema,
        TtReceiptSchema,
        TtExpenseCategorySchema,
        TtExpenseSchema,
        TtSyncQueueSchema,
        TtSyncConfigSchema,
        TtAppConfigSchema,
      ],
      inspector: true,
      directory: dirPath,
      name: 'kanposvntruyenthong_db',
    );
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}