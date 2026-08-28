import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_sync_model.dart';
import '../models/restaurant_inventory_models.dart';
import '../models/restaurant_reservation.dart';
import '../models/restaurant_promotion.dart';
import '../models/restaurant_partner_models.dart';
import '../models/restaurant_expense_model.dart';

class RestaurantIsarService {
  late Future<Isar> db;
  Future<void> _tail = Future<void>.value();

  /// [dbOverride] dùng cho unit test (inject Isar instance riêng).
  RestaurantIsarService({Future<Isar>? dbOverride}) {
    db = dbOverride ?? openDB();
  }

  /// Tuần tự hóa MỌI thao tác Isar (đọc/ghi) để tránh deadlock khi chạy
  /// nhiều query đồng thời trên Windows. Các notifier gọi qua phương thức này.
  Future<T> run<T>(Future<T> Function(Isar db) op) {
    final result = _tail.then((_) async {
      final isar = await db;
      return await op(isar);
    });
    _tail = result.then((_) {}, onError: (_) {});
    return result;
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('restaurant_db')) {
      return Isar.getInstance('restaurant_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/restaurant_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/restaurant_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        RestaurantTableSchema,
        RestaurantMenuItemSchema,
        RestaurantOrderSchema,
        RestaurantSyncQueueSchema,
        RestaurantIngredientSchema,
        RestaurantInventoryTxSchema,
        RestaurantReservationSchema,
        RestaurantPromotionSchema,
        RestaurantCustomerSchema,
        RestaurantSupplierSchema,
        RestaurantExpenseSchema,
      ],
      directory: dirPath,
      name: 'restaurant_db',
    );
  }
}
