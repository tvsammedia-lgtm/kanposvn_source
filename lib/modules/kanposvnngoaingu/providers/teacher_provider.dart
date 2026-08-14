import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/teacher.dart';
import 'ngoaingu_isar_provider.dart';
import 'package:uuid/uuid.dart';

final ngoaiNguTeacherProvider = StateNotifierProvider<NgoaiNguTeacherNotifier, AsyncValue<List<NgoaiNguTeacher>>>((ref) {
  final isar = ref.watch(ngoaiNguIsarProvider);
  return NgoaiNguTeacherNotifier(isar);
});

class NgoaiNguTeacherNotifier extends StateNotifier<AsyncValue<List<NgoaiNguTeacher>>> {
  final Isar isar;
  final uuid = const Uuid();

  NgoaiNguTeacherNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadTeachers();
  }

  Future<void> loadTeachers() async {
    try {
      state = const AsyncValue.loading();
      final teachers = await isar.ngoaiNguTeachers.where().findAll();
      state = AsyncValue.data(teachers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTeacher(NgoaiNguTeacher teacher) async {
    try {
      if (teacher.uuid == null || teacher.uuid!.isEmpty) {
        teacher.uuid = uuid.v4();
      }
      teacher.createdAt = DateTime.now();
      teacher.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.ngoaiNguTeachers.put(teacher);
      });
      await loadTeachers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
