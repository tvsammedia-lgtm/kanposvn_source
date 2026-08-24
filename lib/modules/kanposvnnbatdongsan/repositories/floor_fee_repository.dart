import 'package:isar/isar.dart';
import '../models/floor_fee.dart';
import 'isar_db.dart';

class FloorFeeRepository {
  Future<List<FloorFee>> getAllFees() async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    return await isar.floorFees.where().findAll();
  }

  Future<void> saveFee(FloorFee fee) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    fee.updatedAt = DateTime.now();
    fee.isSynced = false;
    await isar.writeTxn(() async {
      await isar.floorFees.put(fee);
    });
  }

  Future<void> deleteFee(int id) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    await isar.writeTxn(() async {
      await isar.floorFees.delete(id);
    });
  }
}
