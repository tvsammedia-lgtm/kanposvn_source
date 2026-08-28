import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_sync_model.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_expense.dart';
import '../models/vantai_driver.dart';
import '../models/vantai_supplier.dart';
import '../models/vantai_cashbook.dart';

class VantaiIsarService {
  late Future<Isar> db;

  /// [dbOverride] dùng cho unit test (inject Isar instance riêng).
  VantaiIsarService({Future<Isar>? dbOverride}) {
    db = dbOverride ?? openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('vantai_db')) {
      return Isar.getInstance('vantai_db')!;
    }
    // FIX: dùng thư mục tài liệu của app để dữ liệu KHÔNG mất khi restart
    // (trước đây dùng temp dir nên mỗi lần mở app đều bị reset).
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/vantai_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/vantai_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        VantaiRouteSchema,
        VantaiVehicleSchema,
        VantaiCustomerSchema,
        VantaiTicketSchema,
        VantaiSyncQueueSchema,
        VantaiTripSchema,
        VantaiShipmentSchema,
        VantaiExpenseSchema,
        VantaiDriverSchema,
        VantaiSupplierSchema,
        VantaiCashTxSchema,
      ],
      directory: dirPath,
      name: 'vantai_db',
    );
  }
}
