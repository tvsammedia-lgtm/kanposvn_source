import 'package:isar/isar.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_patient.dart';
import '../models/nhathuoc_supplier.dart';
import '../models/nhathuoc_order.dart';
import '../models/nhathuoc_purchase.dart';
import '../models/nhathuoc_sync_model.dart';
import '../models/nhathuoc_prescription.dart';
import '../models/nhathuoc_customer.dart';
import '../models/nhathuoc_expense.dart';
import 'dart:io';

class NhathuocIsarService {
  late Future<Isar> db;

  NhathuocIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('nhathuoc_db')) {
      return Isar.getInstance('nhathuoc_db')!;
    }
    
    final dir = Directory.systemTemp.createTempSync('nhathuoc_db');
    
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/nhathuoc_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/nhathuoc_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        NhathuocMedicineSchema,
        NhathuocPatientSchema,
        NhathuocSupplierSchema,
        NhathuocOrderSchema,
        NhathuocOrderDetailSchema,
        NhathuocPurchaseSchema,
        NhathuocPurchaseDetailSchema,
        NhathuocSyncQueueSchema,
        NhathuocPrescriptionTemplateSchema,
        NhathuocPrescriptionTemplateDetailSchema,
        NhathuocCustomerSchema,
        NhathuocExpenseSchema,
      ],
      directory: dirPath,
      name: 'nhathuoc_db',
    );
  }
}
