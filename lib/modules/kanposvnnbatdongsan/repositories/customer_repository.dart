import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../models/customer.dart';
import 'isar_db.dart';

class CustomerRepository {
  Future<List<Customer>> getAllCustomers() async {
    debugPrint('BDS-DEBUG: customers findAll START');
    final isar = await KanBatDongSanIsarDB.getInstance();
    try {
      final r = await isar.customers
          .where()
          .findAll()
          .timeout(const Duration(seconds: 6));
      debugPrint('BDS-DEBUG: customers findAll DONE n=${r.length}');
      return r;
    } catch (e, st) {
      debugPrint('BDS-DEBUG: customers findAll ERROR/TIMEOUT $e\n$st');
      return <Customer>[];
    }
  }

  Future<List<Customer>> getCustomersByType(CustomerType type) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    return await isar.customers.filter().typeEqualTo(type).findAll();
  }

  Future<void> saveCustomer(Customer customer) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    customer.updatedAt = DateTime.now();
    customer.isSynced = false;
    
    await isar.writeTxn(() async {
      await isar.customers.put(customer);
    });
  }

  Future<void> deleteCustomer(int id) async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    await isar.writeTxn(() async {
      await isar.customers.delete(id);
    });
  }
}
