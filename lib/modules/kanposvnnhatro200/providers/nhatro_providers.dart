import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../repositories/nhatro_isar_db.dart';
import '../services/nhatro_sync_service.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../models/contract.dart';
import '../models/payment.dart';
import '../models/expense.dart';
import '../models/electric_reading.dart';
import '../models/water_reading.dart';
import '../models/hostel_service.dart';
import '../models/maintenance.dart';
import '../models/asset.dart';

final nhatroIsarProvider = FutureProvider<Isar>((ref) async {
  return await NhaTroIsarDB.getInstance();
});

final nhatroSyncServiceProvider = Provider<NhaTroSyncService>((ref) {
  return NhaTroSyncService();
});

final roomsProvider = FutureProvider<List<Room>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.rooms.where().anyId().findAll();
});

final tenantsProvider = FutureProvider<List<Tenant>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.tenants.where().anyId().findAll();
});

final contractsProvider = FutureProvider<List<Contract>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.contracts.where().anyId().findAll();
});

final paymentsProvider = FutureProvider<List<Payment>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.payments.where().anyId().findAll();
});

final expensesProvider = FutureProvider<List<HostelExpense>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.hostelExpenses.where().anyId().findAll();
});

final electricReadingsProvider = FutureProvider<List<ElectricReading>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.electricReadings.where().anyId().findAll();
});

final waterReadingsProvider = FutureProvider<List<WaterReading>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.waterReadings.where().anyId().findAll();
});

final hostelServicesProvider = FutureProvider<List<HostelService>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.hostelServices.where().anyId().findAll();
});

final maintenanceProvider = FutureProvider<List<Maintenance>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.maintenances.where().anyId().findAll();
});

final assetsProvider = FutureProvider<List<Asset>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.assets.where().anyId().findAll();
});
