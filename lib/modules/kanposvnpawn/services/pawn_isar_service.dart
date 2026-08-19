import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user.dart';
import '../models/customer.dart';
import '../models/product.dart';
import '../models/pawn_contract.dart';
import '../models/invoice.dart';
import '../models/warehouse.dart';
import '../models/sync_queue.dart';
import '../models/settings.dart';
import '../models/supplier.dart';
import '../models/pawn_cash_transaction.dart';
import '../models/pawn_invoice_detail.dart';
import '../models/pawn_repair_order.dart';

class PawnIsarService {
  late Future<Isar> db;

  PawnIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    const dbName = 'kanposvnpawn_db';
    final existing = Isar.getInstance(dbName);
    if (existing != null && existing.isOpen) return existing;

    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        UserSchema,
        CustomerSchema,
        ProductSchema,
        PawnContractSchema,
        InvoiceSchema,
        WarehouseSchema,
        SyncQueueSchema,
        SettingsSchema,
        SupplierSchema,
        PawnCashTransactionSchema,
        PawnInvoiceDetailSchema,
        PawnRepairOrderSchema,
      ],
      directory: dir.path,
      name: dbName,
    );
  }
}
