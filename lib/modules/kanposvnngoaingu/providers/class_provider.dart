import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/course_class.dart';
import 'ngoaingu_isar_provider.dart';
import 'package:uuid/uuid.dart';

final ngoaiNguClassProvider = StateNotifierProvider<NgoaiNguClassNotifier, AsyncValue<List<NgoaiNguClass>>>((ref) {
  final isar = ref.watch(ngoaiNguIsarProvider);
  return NgoaiNguClassNotifier(isar);
});

class NgoaiNguClassNotifier extends StateNotifier<AsyncValue<List<NgoaiNguClass>>> {
  final Isar isar;
  final uuid = const Uuid();

  NgoaiNguClassNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadClasses();
  }

  Future<void> loadClasses() async {
    try {
      state = const AsyncValue.loading();
      final classes = await isar.ngoaiNguClass.where().findAll();
      state = AsyncValue.data(classes);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addClass(NgoaiNguClass classItem) async {
    try {
      if (classItem.uuid == null || classItem.uuid!.isEmpty) {
        classItem.uuid = uuid.v4();
      }
      classItem.createdAt = DateTime.now();
      classItem.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.ngoaiNguClass.put(classItem);
      });
      await loadClasses();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
