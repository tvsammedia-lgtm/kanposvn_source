import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import '../services/pawn_isar_service.dart';
import '../services/pawn_neon_sync_service.dart';
import '../services/pawn_einvoice_settings.dart';

final pawnIsarServiceProvider = Provider<PawnIsarService>((ref) {
  return PawnIsarService();
});

final pawnNeonSyncServiceProvider = Provider<PawnNeonSyncService>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return PawnNeonSyncService(isarService);
});

// Settings
final pawnEinvoiceSettingsProvider =
    ChangeNotifierProvider<PawnEinvoiceSettingsStore>((ref) {
  final store = PawnEinvoiceSettingsStore();
  store.load();
  return store;
});

class PawnDatabaseSetup {
  static Future<Isar> init() async {
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
      name: 'kanposvnpawn_db',
    );
  }
}
