import 'package:isar/isar.dart';
import '../models/customer.dart';
import 'isar_db.dart';

class CustomerRepository {
  Future<List<Customer>> getAllCustomers() async {
    final isar = await KanBatDongSanIsarDB.getInstance();
    return await isar.customers.where().findAll();
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
