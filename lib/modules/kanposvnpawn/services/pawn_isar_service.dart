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

class PawnIsarService {
  late Future<Isar> db;

  PawnIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('pawn_db')) {
      return Isar.getInstance('pawn_db')!;
    }
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
      ],
      directory: dir.path,
      name: 'pawn_db',
    );
  }
}
