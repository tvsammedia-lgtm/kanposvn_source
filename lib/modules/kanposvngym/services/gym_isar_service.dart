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
      inspector: false,
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

  /// Tìm hội viên theo SĐT hoặc mã QR check-in.
  Future<GymMember?> findMember(String query) async {
    final isar = await db;
    final q = query.trim();
    if (q.isEmpty) return null;
    return await isar.gymMembers
        .filter()
        .phoneEqualTo(q)
        .or()
        .qrCodeEqualTo(q)
        .or()
        .memberIdEqualTo(q)
        .findFirst();
  }

  // --- Plans & Membership cards ---
  Future<List<GymPlan>> getPlans() async {
    final isar = await db;
    return await isar.gymPlans.filter().statusEqualTo('active').findAll();
  }

  Future<void> savePlan(GymPlan plan) async {
    final isar = await db;
    await isar.writeTxn(() => isar.gymPlans.put(plan));
  }

  Future<GymPlan?> findPlan(String planId) async {
    final isar = await db;
    return await isar.gymPlans.filter().planIdEqualTo(planId).findFirst();
  }

  Future<List<GymMembershipCard>> getCards() async {
    final isar = await db;
    return await isar.gymMembershipCards.where().findAll();
  }

  Future<void> saveCard(GymMembershipCard card) async {
    final isar = await db;
    await isar.writeTxn(() => isar.gymMembershipCards.put(card));
  }

  /// Thẻ đang hiệu lực của hội viên (còn hạn & còn lượt).
  Future<GymMembershipCard?> getActiveCard(String memberId) async {
    final isar = await db;
    final now = DateTime.now();
    final cards = await isar.gymMembershipCards
        .filter()
        .memberIdEqualTo(memberId)
        .statusEqualTo('active')
        .sortByEndDateDesc()
        .findAll();
    for (final c in cards) {
      if (c.endDate.isAfter(now)) return c;
    }
    return null;
  }

  // --- Check-in ---
  Future<void> saveCheckIn(GymCheckIn checkIn) async {
    final isar = await db;
    await isar.writeTxn(() => isar.gymCheckIns.put(checkIn));
  }

  Future<List<GymCheckIn>> getAllCheckIns() async {
    final isar = await db;
    return await isar.gymCheckIns.where().sortByCheckInTimeDesc().findAll();
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

  // --- Products (POS mini) ---
  Future<List<GymProduct>> getProducts() async {
    final isar = await db;
    return await isar.gymProducts.filter().statusEqualTo('active').findAll();
  }

  Future<void> saveProduct(GymProduct product) async {
    final isar = await db;
    await isar.writeTxn(() => isar.gymProducts.put(product));
  }

  // --- Trainers & lớp học ---
  Future<List<GymTrainer>> getTrainers() async {
    final isar = await db;
    return await isar.gymTrainers.filter().statusEqualTo('active').findAll();
  }

  Future<void> saveTrainer(GymTrainer trainer) async {
    final isar = await db;
    await isar.writeTxn(() => isar.gymTrainers.put(trainer));
  }

  Future<List<GymClassSchedule>> getClassSchedules() async {
    final isar = await db;
    final all = await isar.gymClassSchedules.where().findAll();
    all.sort((a, b) => a.startTime.compareTo(b.startTime));
    return all;
  }

  Future<void> saveClassSchedule(GymClassSchedule schedule) async {
    final isar = await db;
    await isar.writeTxn(() => isar.gymClassSchedules.put(schedule));
  }

  // --- Thiết bị (khấu hao) ---
  Future<List<GymAsset>> getAssets() async {
    final isar = await db;
    return await isar.gymAssets.where().findAll();
  }

  Future<void> saveAsset(GymAsset asset) async {
    final isar = await db;
    await isar.writeTxn(() => isar.gymAssets.put(asset));
  }
}
