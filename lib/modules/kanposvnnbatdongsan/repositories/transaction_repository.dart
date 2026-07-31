import 'package:isar/isar.dart';
import '../models/transaction.dart';
import 'isar_db.dart';

class TransactionRepository {
  Future<List<TransactionRecord>> getAllTransactions() async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    return await isar.transactionRecords.where().findAll();
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
