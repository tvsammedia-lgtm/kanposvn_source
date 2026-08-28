import 'package:isar/isar.dart';
import '../models/gara_customer.dart';
import '../models/gara_vehicle.dart';
import '../models/gara_product.dart';
import '../models/gara_repair_order.dart';
import '../models/gara_sync_model.dart';
import '../models/gara_supplier.dart';
import '../models/gara_inventory.dart';
import '../models/gara_finance.dart';
import 'dart:io';

class GaraIsarService {
  late Future<Isar> db;

  GaraIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('gara_db')) {
      return Isar.getInstance('gara_db')!;
    }
    
    // In a real app we'd use path_provider
    final dir = Directory.systemTemp.createTempSync('gara_db');
    
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/gara_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/gara_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        GaraCustomerSchema,
        GaraVehicleSchema,
        GaraProductSchema,
        GaraRepairOrderSchema,
        GaraRepairDetailSchema,
        GaraSyncQueueSchema,
        GaraSupplierSchema,
        GaraInventoryTransactionSchema,
        GaraInventoryDetailSchema,
        GaraFinanceTransactionSchema,
      ],
      directory: dirPath,
      name: 'gara_db',
    );
  }
}
