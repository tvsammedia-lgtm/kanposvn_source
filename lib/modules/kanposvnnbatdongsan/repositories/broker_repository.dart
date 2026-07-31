import 'package:isar/isar.dart';
import '../models/broker.dart';
import 'isar_db.dart';

class BrokerRepository {
  Future<List<Broker>> getAllBrokers() async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    return await isar.brokers.where().findAll();
  }

  Future<void> saveBroker(Broker broker) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    broker.updatedAt = DateTime.now();
    broker.isSynced = false;
    
    await isar.writeTxn(() async {
      await isar.brokers.put(broker);
    });
  }

  Future<void> deleteBroker(int id) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    await isar.writeTxn(() async {
      await isar.brokers.delete(id);
    });
  }
}
