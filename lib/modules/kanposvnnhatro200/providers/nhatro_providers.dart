import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../repositories/nhatro_isar_db.dart';
import '../services/nhatro_sync_service.dart';
import '../models/room.dart';
import '../models/tenant.dart';

final nhatroIsarProvider = FutureProvider<Isar>((ref) async {
  return await NhaTroIsarDB.getInstance();
});

final nhatroSyncServiceProvider = Provider<NhaTroSyncService>((ref) {
  return NhaTroSyncService();
});

final roomsProvider = FutureProvider<List<Room>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.rooms.where().findAll();
});

final tenantsProvider = FutureProvider<List<Tenant>>((ref) async {
  final isar = await ref.watch(nhatroIsarProvider.future);
  return await isar.tenants.where().findAll();
});
