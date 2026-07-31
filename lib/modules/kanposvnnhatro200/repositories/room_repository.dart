import 'package:isar/isar.dart';
import '../models/room.dart';
import '../models/hostel.dart';
import 'nhatro_isar_db.dart';

class RoomRepository {
  Future<List<Room>> getAllRooms() async {
    final isar = await NhaTroIsarDB.getInstance();
    return await isar.rooms.where().findAll();
  }

  Future<void> saveRoom(Room room) async {
    final isar = await NhaTroIsarDB.getInstance();
    room.updatedAt = DateTime.now();
    room.createdAt ??= DateTime.now();
    room.syncStatus = SyncStatus.pending;
    
    await isar.writeTxn(() async {
      await isar.rooms.put(room);
    });
  }

  Future<void> deleteRoom(int id) async {
    final isar = await NhaTroIsarDB.getInstance();
    await isar.writeTxn(() async {
      // In a real offline-first app, we might soft delete:
      // final room = await isar.rooms.get(id);
      // room.deleted = true;
      // room.syncStatus = SyncStatus.pending;
      // await isar.rooms.put(room);
      await isar.rooms.delete(id);
    });
  }
}
