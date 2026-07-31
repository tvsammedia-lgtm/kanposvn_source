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
    return await Isar.open(
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
      directory: dir.path,
      name: 'vlxd_db',
    );
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
