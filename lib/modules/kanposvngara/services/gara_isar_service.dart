import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/gara_customer.dart';
import '../models/gara_vehicle.dart';
import '../models/gara_product.dart';
import '../models/gara_repair_order.dart';
import '../models/gara_sync_model.dart';
import '../models/gara_supplier.dart';
import '../models/gara_inventory.dart';
import '../models/gara_finance.dart';

class GaraIsarService {
  late Future<Isar> db;

  /// Chi nhánh hiện tại (mô hình 1 module = nhiều chi nhánh).
  /// Khác biệt → mỗi chi nhánh dùng một Isar DB riêng (`gara_db_<branchId>`),
  /// tránh dùng chung 1 DB rồi push cùng bộ dữ liệu lên mọi chi nhánh.
  final String? branchId;

  GaraIsarService({this.branchId}) {
    db = openDB();
  }

  String get _dbName {
    if (branchId == null || branchId!.isEmpty) return 'gara_db';
    final safe = branchId!.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    return 'gara_db_$safe';
  }

  Future<Isar> openDB() async {
    final name = _dbName;
    // KHÔNG đóng các instance khác tại đây: việc dọn dẹp instance cũ được làm
    // trong `dispose()` (thuộc vòng đời provider) để tránh `close()` blocking
    // làm treo UI khi đang chuyển module/chi nhánh.
    final current = Isar.getInstance(name);
    if (current != null && current.isOpen) {
      return current;
    }

    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/$name.isar');
        if (oldDir.existsSync()) {
          await oldDir.rename('${dir.path}/${name}_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  /// Đóng Isar instance do service này quản lý (gọi khi provider bị dispose).
  Future<void> dispose() async {
    final inst = Isar.getInstance(_dbName);
    if (inst != null && inst.isOpen) {
      try {
        await inst.close();
      } catch (_) {
        // best-effort
      }
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
      name: _dbName,
    );
  }
}
