import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/member.dart';
import '../models/membership_plan.dart';
import '../models/check_in.dart';
import '../models/gym_product.dart';
import '../models/trainer.dart';
import '../models/asset.dart';
import '../models/gym_sync.dart';

class GymIsarService {
  late Future<Isar> db;

  GymIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('kanposvngym_db')) {
      return Isar.getInstance('kanposvngym_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        GymMemberSchema,
        GymHealthProfileSchema,
        GymPlanSchema,
        GymMembershipCardSchema,
        GymCheckInSchema,
        GymProductSchema,
        GymTrainerSchema,
        GymClassScheduleSchema,
        GymAssetSchema,
        GymSyncQueueSchema,
        GymSyncConfigSchema,
      ],
      inspector: true,
      directory: dir.path,
      name: 'kanposvngym_db',
    );
  }

  Future<List<GymMember>> getMembers() async {
    final isar = await db;
    return await isar.gymMembers.where().sortByCreatedAtDesc().findAll();
  }

  Future<void> saveMember(GymMember member) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.gymMembers.put(member);
    });
  }

  Future<List<GymCheckIn>> getCheckInsToday() async {
    final isar = await db;
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    
    return await isar.gymCheckIns
        .filter()
        .checkInTimeGreaterThan(startOfDay)
        .sortByCheckInTimeDesc()
        .findAll();
  }
}
