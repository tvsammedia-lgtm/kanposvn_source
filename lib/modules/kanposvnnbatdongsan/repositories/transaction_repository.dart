import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../models/transaction.dart';
import 'isar_db.dart';

class TransactionRepository {
  Future<List<TransactionRecord>> getAllTransactions() async {
    debugPrint('BDS-DEBUG: tx findAll START');
    final isar = await KanBatDongSanIsarDB.getInstance();
    try {
      final r = await isar.transactionRecords
          .where()
          .findAll()
          .timeout(const Duration(seconds: 6));
      debugPrint('BDS-DEBUG: tx findAll DONE n=${r.length}');
      return r;
    } catch (e, st) {
      debugPrint('BDS-DEBUG: tx findAll ERROR/TIMEOUT $e\n$st');
      return <TransactionRecord>[];
    }
  }

  Future<void> saveTransaction(TransactionRecord transaction) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    transaction.updatedAt = DateTime.now();
    transaction.isSynced = false;
    
    await isar.writeTxn(() async {
      await isar.transactionRecords.put(transaction);
    });
  }

  Future<void> deleteTransaction(int id) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    await isar.writeTxn(() async {
      await isar.transactionRecords.delete(id);
    });
  }
}
