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

import '../services/barber_db_service.dart';
import '../services/barber_ai_service.dart';
import '../services/barber_sync_service.dart';

final barberIsarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  if (Isar.getInstance('barber_instance') != null) {
    return Isar.getInstance('barber_instance')!;
  }
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
    ],
    directory: dir.path,
    name: 'barber_instance',
  );
});

final barberDbServiceProvider = FutureProvider<BarberDbService>((ref) async {
  final isar = await ref.watch(barberIsarProvider.future);
  return BarberDbService(isar);
});

final barberAiServiceProvider = Provider<BarberAiService>((ref) {
  return BarberAiService(apiKey: 'dummy_api_key');
});

final barberSyncServiceProvider = Provider<BarberSyncService>((ref) {
  return BarberSyncService();
});
