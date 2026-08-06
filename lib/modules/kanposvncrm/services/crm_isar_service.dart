import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/customer.dart';
import '../models/license.dart';
import '../models/ticket.dart';
import '../models/crm_sync.dart';

class CrmIsarService {
  late Future<Isar> db;

  CrmIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('kanposvncrm_db')) {
      return Isar.getInstance('kanposvncrm_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        CrmCustomerSchema,
        CrmStoreSchema,
        CrmLicenseSchema,
        CrmSubscriptionSchema,
        CrmTicketSchema,
        CrmTicketMessageSchema,
        CrmSyncQueueSchema,
        CrmSyncConfigSchema,
      ],
      inspector: true,
      directory: dir.path,
      name: 'kanposvncrm_db',
    );
  }

  // --- Customer ---
  Future<List<CrmCustomer>> getCustomers() async {
    final isar = await db;
    return await isar.crmCustomers.where().sortByCreatedAtDesc().findAll();
  }

  Future<void> saveCustomer(CrmCustomer customer) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.crmCustomers.put(customer);
    });
  }

  // --- Ticket ---
  Future<List<CrmTicket>> getTickets() async {
    final isar = await db;
    return await isar.crmTickets.where().sortByCreatedAtDesc().findAll();
  }

  // --- License ---
  Future<List<CrmLicense>> getLicenses() async {
    final isar = await db;
    return await isar.crmLicenses.where().sortByCreatedAtDesc().findAll();
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
