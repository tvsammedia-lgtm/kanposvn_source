import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../models/broker.dart';
import 'isar_db.dart';

class BrokerRepository {
  Future<List<Broker>> getAllBrokers() async {
    debugPrint('BDS-DEBUG: brokers findAll START');
    final isar = await KanBatDongSanIsarDB.getInstance();
    try {
      final r = await isar.brokers
          .where()
          .findAll()
          .timeout(const Duration(seconds: 6));
      debugPrint('BDS-DEBUG: brokers findAll DONE n=${r.length}');
      return r;
    } catch (e, st) {
      debugPrint('BDS-DEBUG: brokers findAll ERROR/TIMEOUT $e\n$st');
      return <Broker>[];
    }
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
