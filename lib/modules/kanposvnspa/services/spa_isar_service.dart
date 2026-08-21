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
    return await Isar.open(
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
      directory: dir.path,
      name: 'spa_db',
    );
  }
}
