import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/bida_table.dart';
import '../models/bida_item.dart';
import '../models/bida_session.dart';
import '../models/bida_sync_model.dart';
import '../models/bida_inventory_tx.dart';
import '../models/bida_partner.dart';
import '../models/bida_finance.dart';
import '../models/bida_reservation.dart';

class BidaIsarService {
  late Future<Isar> db;

  BidaIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('bida_db')) {
      return Isar.getInstance('bida_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      // Schema thay đổi (VD: thêm field) -> lưu lại DB cũ và mở lại với schema mới
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/bida_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/bida_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        BidaTableSchema,
        BidaItemSchema,
        BidaSessionSchema,
        BidaSyncQueueSchema,
        BidaInventoryTxSchema,
        BidaCustomerSchema,
        BidaSupplierSchema,
        BidaFinanceTxSchema,
        BidaPricingRuleSchema,
        BidaBlockPlanSchema,
        BidaReservationSchema,
      ],
      directory: dirPath,
      name: 'bida_db',
    );
  }
}
