import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../models/floor_fee.dart';
import 'isar_db.dart';

class FloorFeeRepository {
  Future<List<FloorFee>> getAllFees() async {
    debugPrint('BDS-DEBUG: fees findAll START');
    final isar = await KanBatDongSanIsarDB.getInstance();
    try {
      final r = await isar.floorFees
          .where()
          .findAll()
          .timeout(const Duration(seconds: 6));
      debugPrint('BDS-DEBUG: fees findAll DONE n=${r.length}');
      return r;
    } catch (e, st) {
      debugPrint('BDS-DEBUG: fees findAll ERROR/TIMEOUT $e\n$st');
      return <FloorFee>[];
    }
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
