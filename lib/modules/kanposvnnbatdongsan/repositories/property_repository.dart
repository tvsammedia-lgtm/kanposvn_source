import 'package:isar/isar.dart';
import '../models/property.dart';
import 'isar_db.dart';

class PropertyRepository {
  Future<List<Property>> getAllProperties() async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    return await isar.propertys.where().findAll();
  }

  Future<void> saveProperty(Property property) async {
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
