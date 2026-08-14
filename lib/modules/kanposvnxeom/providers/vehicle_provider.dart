import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/vehicle.dart';
import 'xeom_isar_provider.dart';
import 'package:uuid/uuid.dart';

final xeOmVehicleProvider = StateNotifierProvider<XeOmVehicleNotifier, AsyncValue<List<XeOmVehicle>>>((ref) {
  final isar = ref.watch(xeOmIsarProvider);
  return XeOmVehicleNotifier(isar);
});

class XeOmVehicleNotifier extends StateNotifier<AsyncValue<List<XeOmVehicle>>> {
  final Isar isar;
  final uuid = const Uuid();

  XeOmVehicleNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadVehicles();
  }

  Future<void> loadVehicles() async {
    try {
      state = const AsyncValue.loading();
      final vehicles = await isar.xeOmVehicles.where().findAll();
      state = AsyncValue.data(vehicles);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addVehicle(XeOmVehicle vehicle) async {
    try {
      if (vehicle.uuid == null || vehicle.uuid!.isEmpty) {
        vehicle.uuid = uuid.v4();
      }
      vehicle.createdAt = DateTime.now();
      vehicle.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.xeOmVehicles.put(vehicle);
      });
      await loadVehicles();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
