import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/candidate.dart';
import '../models/employer.dart';
import '../models/job_category.dart';
import '../models/job_posting.dart';
import '../models/job_match.dart';
import '../models/contract.dart';
import '../models/payment.dart';
import '../models/viec_sync.dart';
import '../models/viec_ops_models.dart';

class ViecIsarService {
  late Future<Isar> db;

  ViecIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('kanposvnviec_db')) {
      return Isar.getInstance('kanposvnviec_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        ViecCandidateSchema,
        ViecEmployerSchema,
        ViecJobCategorySchema,
        ViecJobPostingSchema,
        ViecJobMatchSchema,
        ViecContractSchema,
        ViecPaymentSchema,
        ViecSyncQueueSchema,
        ViecSyncConfigSchema,
        ViecWorkSessionSchema,
        ViecFinanceTxSchema,
        ViecRatingSchema,
        ViecNotificationSchema,
        ViecAuditLogSchema,
      ],
      inspector: true,
      directory: dir.path,
      name: 'kanposvnviec_db',
    );
  }

  Future<List<ViecCandidate>> getCandidates() async {
    final isar = await db;
    return await isar.viecCandidates.where().sortByCreatedAtDesc().findAll();
  }

  Future<void> saveCandidate(ViecCandidate candidate) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.viecCandidates.put(candidate);
    });
  }
}
