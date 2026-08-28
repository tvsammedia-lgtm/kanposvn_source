import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../models/property.dart';
import 'isar_db.dart';

class PropertyRepository {
  Future<List<BdsProperty>> getAllProperties() async {
    debugPrint('BDS-DEBUG: props findAll START');
    final isar = await KanBatDongSanIsarDB.getInstance();
    try {
      final r = await isar.propertys
          .where()
          .findAll()
          .timeout(const Duration(seconds: 2));
      debugPrint('BDS-DEBUG: props findAll DONE n=${r.length}');
      return r;
    } catch (e, st) {
      debugPrint('BDS-DEBUG: props findAll ERROR/TIMEOUT $e\n$st');
      return <BdsProperty>[];
    }
  }

  Future<void> saveProperty(BdsProperty property) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    property.updatedAt = DateTime.now();
    property.isSynced = false;
    
    await isar.writeTxn(() async {
      await isar.propertys.put(property);
    });
  }

  Future<void> deleteProperty(int id) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    await isar.writeTxn(() async {
      await isar.propertys.delete(id);
    });
  }
}
