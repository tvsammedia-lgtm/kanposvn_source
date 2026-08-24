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
    return await Isar.open(
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
      directory: dir.path,
      name: 'vantai_db',
    );
  }
}
