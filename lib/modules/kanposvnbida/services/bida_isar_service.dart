import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/bida_table.dart';
import '../models/bida_item.dart';
import '../models/bida_session.dart';
import '../models/bida_sync_model.dart';
import '../models/bida_inventory_tx.dart';

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
    return await Isar.open(
      [
        BidaTableSchema,
        BidaItemSchema,
        BidaSessionSchema,
        BidaSyncQueueSchema,
        BidaInventoryTxSchema,
      ],
      directory: dir.path,
      name: 'bida_db',
    );
  }
}
