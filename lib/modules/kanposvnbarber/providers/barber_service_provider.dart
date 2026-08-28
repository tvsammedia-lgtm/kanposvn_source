import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/barber_customer.dart';
import '../models/barber_appointment.dart';
import '../models/barber_service.dart';
import '../models/barber_employee.dart';
import '../models/barber_invoice.dart';
import '../models/barber_invoice_detail.dart';
import '../models/barber_hair_style.dart';
import '../models/barber_product.dart';
import '../models/barber_expense.dart';
import '../models/barber_inventory_transaction.dart';
import '../models/barber_supplier.dart';
import '../models/barber_ai_result.dart';

import '../services/barber_db_service.dart';
import '../services/barber_ai_service.dart';
import '../services/barber_sync_service.dart';
import '../services/barber_einvoice_settings.dart';

final barberIsarProvider = FutureProvider<Isar>((ref) async {
  const dbName = 'barber_instance';
  final existing = Isar.getInstance(dbName);
  if (existing != null && existing.isOpen) return existing;

  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open(
    [
      BarberCustomerSchema,
      BarberAppointmentSchema,
      BarberServiceSchema,
      BarberEmployeeSchema,
      BarberInvoiceSchema,
      BarberInvoiceDetailSchema,
      BarberHairStyleSchema,
      BarberProductSchema,
      BarberExpenseSchema,
      BarberInventoryTransactionSchema,
      BarberSupplierSchema,
      BarberAiResultSchema,
    ],
    directory: dir.path,
    name: dbName,
  );
});

final barberDbServiceProvider = FutureProvider<BarberDbService>((ref) async {
  final isar = await ref.watch(barberIsarProvider.future);
  return BarberDbService(isar);
});

final barberAiServiceProvider = Provider<BarberAiService>((ref) {
  return BarberAiService();
});

final barberSyncServiceProvider = Provider<BarberSyncService>((ref) {
  return BarberSyncService();
});

final barberEinvoiceSettingsProvider =
    ChangeNotifierProvider<BarberEinvoiceSettingsStore>((ref) {
  final store = BarberEinvoiceSettingsStore();
  store.load();
  return store;
});
