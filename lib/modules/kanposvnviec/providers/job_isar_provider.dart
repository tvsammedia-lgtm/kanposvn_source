import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/job.dart';
import '../models/cv_profile.dart';
import '../models/job_chat.dart';

final jobIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('jobIsarProvider must be overridden in main');
});

class JobDatabaseSetup {
  static Future<Isar> init() async {
    const name = 'kanposvnviec_db';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) return existing;
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        JobLocalSchema,
        CvProfileSchema,
        JobChatSchema,
      ],
      directory: dir.path,
      name: name,
    );
  }
}
