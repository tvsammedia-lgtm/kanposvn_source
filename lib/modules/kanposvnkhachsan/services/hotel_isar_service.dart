import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/hotel_room.dart';
import '../models/hotel_booking.dart';
import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_service.dart';
import '../models/hotel_inventory.dart';
import '../models/hotel_customer_supplier.dart';
import '../models/hotel_finance_accounting.dart';
import '../models/hotel_sync_model.dart';

class HotelIsarService {
  late Future<Isar> db;

  HotelIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('hotel_db')) {
      return Isar.getInstance('hotel_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      // Schema thay đổi (VD: thêm field) -> lưu lại DB cũ và mở lại với schema mới
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/hotel_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/hotel_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        HotelRoomSchema,
        RoomTypeSchema,
        HotelFloorSchema,
        RoomReservationSchema,
        RoomCheckInSchema,
        HotelServiceItemSchema,
        RoomServiceOrderItemSchema,
        HotelInventoryItemSchema,
        HotelInventoryTransactionSchema,
        HotelCustomerSchema,
        HotelSupplierSchema,
        HotelCashTransactionSchema,
        HotelShiftReportSchema,
        HotelAccountingSummarySchema,
        HotelSyncQueueSchema,
        HotelSyncConfigSchema,
      ],
      inspector: true,
      directory: dirPath,
      name: 'hotel_db',
    );
  }

  // Generic methods
  Future<void> save<T>(T item) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.collection<T>().putSync(item));
  }

  Future<void> saveAll<T>(List<T> items) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.collection<T>().putAllSync(items));
  }

  Future<List<T>> getAll<T>() async {
    final isar = await db;
    return await isar.collection<T>().where().findAll();
  }

  Future<void> delete<T>(Id id) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.collection<T>().deleteSync(id));
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  // --- Specific Queries Example ---
  
  Future<List<HotelRoom>> getRooms() async {
    final isar = await db;
    return await isar.hotelRooms.where().findAll();
  }

  Future<List<RoomType>> getRoomTypes() async {
    final isar = await db;
    return await isar.roomTypes.where().findAll();
  }

  Future<List<HotelFloor>> getFloors() async {
    final isar = await db;
    return await isar.hotelFloors.where().findAll();
  }
}
