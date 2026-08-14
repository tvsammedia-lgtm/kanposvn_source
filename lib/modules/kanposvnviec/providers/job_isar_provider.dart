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
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        JobLocalSchema,
        CvProfileSchema,
        JobChatSchema,
      ],
      directory: dir.path,
      name: 'kanposvnviec_db',
    );
  }
}
