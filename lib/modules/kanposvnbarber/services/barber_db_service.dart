import 'package:isar/isar.dart';
import '../models/barber_customer.dart';
import '../models/barber_appointment.dart';
import '../models/barber_service.dart';
import '../models/barber_employee.dart';
import '../models/barber_invoice.dart';
import '../models/barber_invoice_detail.dart';
import '../models/barber_product.dart';
import '../models/barber_hair_style.dart';
import '../models/barber_expense.dart';
import '../models/barber_inventory_transaction.dart';
import '../models/barber_supplier.dart';

class BarberDbService {
  final Isar isar;

  BarberDbService(this.isar);

  // ═══════════════════ Customers ═══════════════════
  Future<void> saveCustomer(BarberCustomer customer) async {
    await isar.writeTxn(() async => await isar.barberCustomers.put(customer));
  }

  Future<List<BarberCustomer>> getCustomers() async {
    return await isar.barberCustomers.where().anyId().findAll();
  }

  Future<void> deleteCustomer(int isarId) async {
    await isar.writeTxn(() async => await isar.barberCustomers.delete(isarId));
  }

  // ═══════════════════ Appointments ═══════════════════
  Future<void> saveAppointment(BarberAppointment appointment) async {
    await isar.writeTxn(() async => await isar.barberAppointments.put(appointment));
  }

  Future<List<BarberAppointment>> getAppointments() async {
    return await isar.barberAppointments.where().anyId().findAll();
  }

  Future<void> deleteAppointment(int isarId) async {
    await isar.writeTxn(() async => await isar.barberAppointments.delete(isarId));
  }

  // ═══════════════════ Services ═══════════════════
  Future<void> saveService(BarberService service) async {
    await isar.writeTxn(() async => await isar.barberServices.put(service));
  }

  Future<List<BarberService>> getServices() async {
    return await isar.barberServices.where().anyId().findAll();
  }

  Future<void> deleteService(int isarId) async {
    await isar.writeTxn(() async => await isar.barberServices.delete(isarId));
  }

  // ═══════════════════ Employees ═══════════════════
  Future<void> saveEmployee(BarberEmployee employee) async {
    await isar.writeTxn(() async => await isar.barberEmployees.put(employee));
  }

  Future<List<BarberEmployee>> getEmployees() async {
    return await isar.barberEmployees.where().anyId().findAll();
  }

  Future<void> deleteEmployee(int isarId) async {
    await isar.writeTxn(() async => await isar.barberEmployees.delete(isarId));
  }

  // ═══════════════════ Invoices ═══════════════════
  Future<void> saveInvoice(BarberInvoice invoice) async {
    await isar.writeTxn(() async => await isar.barberInvoices.put(invoice));
  }

  Future<List<BarberInvoice>> getInvoices() async {
    return await isar.barberInvoices.where().anyId().findAll();
  }

  Future<void> deleteInvoice(int isarId) async {
    await isar.writeTxn(() async => await isar.barberInvoices.delete(isarId));
  }

  // ═══════════════════ Invoice Details ═══════════════════
  Future<void> saveInvoiceDetail(BarberInvoiceDetail detail) async {
    await isar.writeTxn(() async => await isar.barberInvoiceDetails.put(detail));
  }

  Future<List<BarberInvoiceDetail>> getInvoiceDetails(String invoiceId) async {
    return await isar.barberInvoiceDetails.filter().invoiceIdEqualTo(invoiceId).findAll();
  }

  // ═══════════════════ Products ═══════════════════
  Future<void> saveProduct(BarberProduct product) async {
    await isar.writeTxn(() async => await isar.barberProducts.put(product));
  }

  Future<List<BarberProduct>> getProducts() async {
    return await isar.barberProducts.where().anyId().findAll();
  }

  Future<void> deleteProduct(int isarId) async {
    await isar.writeTxn(() async => await isar.barberProducts.delete(isarId));
  }

  // ═══════════════════ Hair Styles ═══════════════════
  Future<void> saveHairStyle(BarberHairStyle style) async {
    await isar.writeTxn(() async => await isar.barberHairStyles.put(style));
  }

  Future<List<BarberHairStyle>> getHairStyles() async {
    return await isar.barberHairStyles.where().anyId().findAll();
  }

  // ═══════════════════ Expenses ═══════════════════
  Future<void> saveExpense(BarberExpense expense) async {
    await isar.writeTxn(() async => await isar.barberExpenses.put(expense));
  }

  Future<List<BarberExpense>> getExpenses() async {
    return await isar.barberExpenses.where().anyId().findAll();
  }

  Future<void> deleteExpense(int isarId) async {
    await isar.writeTxn(() async => await isar.barberExpenses.delete(isarId));
  }

  // ═══════════════════ Suppliers ═══════════════════
  Future<void> saveSupplier(BarberSupplier supplier) async {
    await isar.writeTxn(() async => await isar.barberSuppliers.put(supplier));
  }

  Future<List<BarberSupplier>> getSuppliers() async {
    return await isar.barberSuppliers.where().anyId().findAll();
  }

  Future<void> deleteSupplier(int isarId) async {
    await isar.writeTxn(() async => await isar.barberSuppliers.delete(isarId));
  }

  // ═══════════════════ Inventory Transactions ═══════════════════
  Future<void> saveInventoryTransaction(BarberInventoryTransaction txn) async {
    await isar.writeTxn(() async => await isar.barberInventoryTransactions.put(txn));
  }

  Future<List<BarberInventoryTransaction>> getInventoryTransactions() async {
    return await isar.barberInventoryTransactions.where().anyId().findAll();
  }

  // ═══════════════════ Helpers ═══════════════════
  Future<void> deleteAllData() async {
    await isar.writeTxn(() async {
      await isar.barberCustomers.clear();
      await isar.barberAppointments.clear();
      await isar.barberServices.clear();
      await isar.barberEmployees.clear();
      await isar.barberInvoices.clear();
      await isar.barberInvoiceDetails.clear();
      await isar.barberProducts.clear();
      await isar.barberHairStyles.clear();
      await isar.barberExpenses.clear();
      await isar.barberInventoryTransactions.clear();
      await isar.barberSuppliers.clear();
    });
  }
}
