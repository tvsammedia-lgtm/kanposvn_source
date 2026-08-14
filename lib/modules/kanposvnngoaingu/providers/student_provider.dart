import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/student.dart';
import 'ngoaingu_isar_provider.dart';
import 'package:uuid/uuid.dart';

final ngoaiNguStudentProvider = StateNotifierProvider<NgoaiNguStudentNotifier, AsyncValue<List<NgoaiNguStudent>>>((ref) {
  final isar = ref.watch(ngoaiNguIsarProvider);
  return NgoaiNguStudentNotifier(isar);
});

class NgoaiNguStudentNotifier extends StateNotifier<AsyncValue<List<NgoaiNguStudent>>> {
  final Isar isar;
  final uuid = const Uuid();

  NgoaiNguStudentNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadStudents();
  }

  Future<void> loadStudents() async {
    try {
      state = const AsyncValue.loading();
      final students = await isar.ngoaiNguStudents.where().findAll();
      state = AsyncValue.data(students);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addStudent(NgoaiNguStudent student) async {
    try {
      if (student.uuid == null || student.uuid!.isEmpty) {
        student.uuid = uuid.v4();
      }
      student.createdAt = DateTime.now();
      student.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.ngoaiNguStudents.put(student);
      });
      await loadStudents();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
