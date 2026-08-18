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
    
    return await Isar.open(
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
      directory: dir.path,
      name: 'nhathuoc_db',
    );
  }
}
