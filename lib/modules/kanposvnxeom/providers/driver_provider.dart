import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/driver.dart';
import 'xeom_isar_provider.dart';
import 'package:uuid/uuid.dart';

final xeOmDriverProvider = StateNotifierProvider<XeOmDriverNotifier, AsyncValue<List<XeOmDriver>>>((ref) {
  final isar = ref.watch(xeOmIsarProvider);
  return XeOmDriverNotifier(isar);
});

class XeOmDriverNotifier extends StateNotifier<AsyncValue<List<XeOmDriver>>> {
  final Isar isar;
  final uuid = const Uuid();

  XeOmDriverNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadDrivers();
  }

  Future<void> loadDrivers() async {
    try {
      state = const AsyncValue.loading();
      final drivers = await isar.xeOmDrivers.where().findAll();
      state = AsyncValue.data(drivers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addDriver(XeOmDriver driver) async {
    try {
      if (driver.uuid == null || driver.uuid!.isEmpty) {
        driver.uuid = uuid.v4();
      }
      driver.createdAt = DateTime.now();
      driver.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.xeOmDrivers.put(driver);
      });
      await loadDrivers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
