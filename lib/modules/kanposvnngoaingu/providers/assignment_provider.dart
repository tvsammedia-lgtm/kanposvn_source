import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/assignment.dart';
import 'ngoaingu_isar_provider.dart';
import 'package:uuid/uuid.dart';

final ngoaiNguAssignmentProvider = StateNotifierProvider<NgoaiNguAssignmentNotifier, AsyncValue<List<NgoaiNguAssignment>>>((ref) {
  final isar = ref.watch(ngoaiNguIsarProvider);
  return NgoaiNguAssignmentNotifier(isar);
});

class NgoaiNguAssignmentNotifier extends StateNotifier<AsyncValue<List<NgoaiNguAssignment>>> {
  final Isar isar;
  final uuid = const Uuid();

  NgoaiNguAssignmentNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadAssignments();
  }

  Future<void> loadAssignments() async {
    try {
      state = const AsyncValue.loading();
      final assignments = await isar.ngoaiNguAssignments.where().findAll();
      state = AsyncValue.data(assignments);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addAssignment(NgoaiNguAssignment assignment) async {
    try {
      if (assignment.uuid == null || assignment.uuid!.isEmpty) {
        assignment.uuid = uuid.v4();
      }
      assignment.createdAt = DateTime.now();
      assignment.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.ngoaiNguAssignments.put(assignment);
      });
      await loadAssignments();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
