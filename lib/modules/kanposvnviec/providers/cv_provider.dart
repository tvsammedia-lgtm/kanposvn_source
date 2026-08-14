import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/cv_profile.dart';
import 'job_isar_provider.dart';

final cvProvider = StateNotifierProvider<CvNotifier, AsyncValue<CvProfile?>>((ref) {
  final isar = ref.watch(jobIsarProvider);
  return CvNotifier(isar);
});

class CvNotifier extends StateNotifier<AsyncValue<CvProfile?>> {
  final Isar isar;

  CvNotifier(this.isar) : super(const AsyncValue.loading()) {
    _loadCv();
  }

  Future<void> _loadCv() async {
    try {
      final cv = await isar.cvProfiles.where().findFirst();
      state = AsyncValue.data(cv);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> saveCv(CvProfile cv) async {
    state = const AsyncValue.loading();
    try {
      cv.updatedAt = DateTime.now();
      await isar.writeTxn(() async {
        await isar.cvProfiles.put(cv);
      });
      state = AsyncValue.data(cv);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
