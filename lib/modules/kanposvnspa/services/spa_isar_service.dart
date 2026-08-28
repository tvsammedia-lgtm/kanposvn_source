import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/spa_bed.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_session.dart';
import '../models/spa_sync_model.dart';
import '../models/spa_customer.dart';
import '../models/spa_inventory_models.dart';
import '../models/spa_appointment.dart';
import '../models/spa_combo.dart';
import '../models/spa_expense.dart';

class SpaIsarService {
  late Future<Isar> db;

  SpaIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('spa_db')) {
      return Isar.getInstance('spa_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/spa_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/spa_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        SpaBedSchema,
        SpaServiceModelSchema,
        SpaTechnicianSchema,
        SpaSessionSchema,
        SpaSyncQueueSchema,
        SpaCustomerSchema,
        SpaProductSchema,
        SpaInventoryTxSchema,
        SpaAppointmentSchema,
        SpaComboSchema,
        SpaExpenseSchema,
      ],
      directory: dirPath,
      name: 'spa_db',
    );
  }
}
