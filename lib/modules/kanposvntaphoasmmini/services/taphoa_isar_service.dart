import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/product.dart';
import '../models/invoice.dart';
import '../models/inventory.dart';
import '../models/finance.dart';
import '../models/partner.dart';
import '../models/sync_model.dart';

class TapHoaIsarService {
  late Future<Isar> db;

  TapHoaIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('taphoa_db')) {
      return Isar.getInstance('taphoa_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        TapHoaCategorySchema,
        TapHoaProductSchema,
        TapHoaInvoiceSchema,
        TapHoaInvoiceItemSchema,
        TapHoaInventoryItemSchema,
        TapHoaInventoryTransactionSchema,
        TapHoaCashTransactionSchema,
        TapHoaCustomerSchema,
        TapHoaSupplierSchema,
        TapHoaSyncQueueSchema,
        TapHoaSyncConfigSchema,
      ],
      inspector: true,
      directory: dir.path,
      name: 'taphoa_db',
    );
  }

  // --- Category ---
  Future<List<TapHoaCategory>> getCategories() async {
    final isar = await db;
    return await isar.tapHoaCategorys.where().findAll();
  }

  Future<void> saveCategory(TapHoaCategory category) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaCategorys.put(category);
    });
  }

  // --- Product ---
  Future<List<TapHoaProduct>> getProducts() async {
    final isar = await db;
    return await isar.tapHoaProducts.where().findAll();
  }

  Future<void> saveProduct(TapHoaProduct product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaProducts.put(product);
      await product.category.save();
    });
  }

  // --- Invoice ---
  Future<List<TapHoaInvoice>> getInvoices() async {
    final isar = await db;
    return await isar.tapHoaInvoices.where().sortByCreatedAtDesc().findAll();
  }

  Future<void> saveInvoice(TapHoaInvoice invoice) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaInvoices.put(invoice);
      await invoice.items.save();
    });
  }

  // --- Inventory ---
  Future<List<TapHoaInventoryItem>> getInventoryItems() async {
    final isar = await db;
    return await isar.tapHoaInventoryItems.where().findAll();
  }

  Future<void> saveInventoryItem(TapHoaInventoryItem item) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaInventoryItems.put(item);
    });
  }

  // --- Finance ---
  Future<List<TapHoaCashTransaction>> getCashTransactions() async {
    final isar = await db;
    return await isar.tapHoaCashTransactions.where().sortByTimestampDesc().findAll();
  }

  Future<void> saveCashTransaction(TapHoaCashTransaction tx) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaCashTransactions.put(tx);
    });
  }

  // --- Partner ---
  Future<List<TapHoaCustomer>> getCustomers() async {
    final isar = await db;
    return await isar.tapHoaCustomers.where().findAll();
  }

  Future<void> saveCustomer(TapHoaCustomer customer) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tapHoaCustomers.put(customer);
    });
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
