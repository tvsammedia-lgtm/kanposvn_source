import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/gym_isar_service.dart';
import '../models/member.dart';
import '../models/membership_plan.dart';
import '../models/check_in.dart';
import '../models/gym_product.dart';
import '../models/trainer.dart';

final gymIsarServiceProvider = Provider<GymIsarService>((ref) {
  return GymIsarService();
});

class GymMembersNotifier extends StateNotifier<List<GymMember>> {
  final GymIsarService _isar;
  bool _isLoading = false;

  GymMembersNotifier(this._isar) : super([]) {
    loadMembers();
  }

  Future<void> loadMembers() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      state = await _isar.getMembers();
    } finally {
      _isLoading = false;
    }
  }

  Future<void> saveMember(GymMember member) async {
    await _isar.saveMember(member);
    await loadMembers();
  }
}

final gymMembersProvider = StateNotifierProvider<GymMembersNotifier, List<GymMember>>((ref) {
  return GymMembersNotifier(ref.watch(gymIsarServiceProvider));
});

/// Check-in HÔM NAY dạng StateNotifier để dashboard refresh được sau check-in.
class GymCheckInsNotifier extends StateNotifier<List<GymCheckIn>> {
  final GymIsarService _isar;
  GymCheckInsNotifier(this._isar) : super([]) {
    refresh();
  }

  Future<void> refresh() async {
    state = await _isar.getCheckInsToday();
  }
}

final gymCheckInsTodayProvider =
    StateNotifierProvider<GymCheckInsNotifier, List<GymCheckIn>>((ref) {
  return GymCheckInsNotifier(ref.watch(gymIsarServiceProvider));
});

class GymPlansNotifier extends StateNotifier<List<GymPlan>> {
  final GymIsarService _isar;
  GymPlansNotifier(this._isar) : super([]) {
    refresh();
  }

  Future<void> refresh() async => state = await _isar.getPlans();
}

final gymPlansProvider = StateNotifierProvider<GymPlansNotifier, List<GymPlan>>((ref) {
  return GymPlansNotifier(ref.watch(gymIsarServiceProvider));
});

class GymProductsNotifier extends StateNotifier<List<GymProduct>> {
  final GymIsarService _isar;
  GymProductsNotifier(this._isar) : super([]) {
    refresh();
  }

  Future<void> refresh() async => state = await _isar.getProducts();

  /// POS mini: bán sản phẩm → trừ kho.
  Future<void> sellProduct(GymProduct product, int qty) async {
    product.stock = (product.stock - qty).clamp(0, 1 << 31);
    product.updatedAt = DateTime.now();
    await _isar.saveProduct(product);
    await refresh();
  }
}

final gymProductsProvider =
    StateNotifierProvider<GymProductsNotifier, List<GymProduct>>((ref) {
  return GymProductsNotifier(ref.watch(gymIsarServiceProvider));
});

class GymTrainersNotifier extends StateNotifier<List<GymTrainer>> {
  final GymIsarService _isar;
  GymTrainersNotifier(this._isar) : super([]) {
    refresh();
  }

  Future<void> refresh() async => state = await _isar.getTrainers();
}

final gymTrainersProvider =
    StateNotifierProvider<GymTrainersNotifier, List<GymTrainer>>((ref) {
  return GymTrainersNotifier(ref.watch(gymIsarServiceProvider));
});

class GymClassesNotifier extends StateNotifier<List<GymClassSchedule>> {
  final GymIsarService _isar;
  GymClassesNotifier(this._isar) : super([]) {
    refresh();
  }

  Future<void> refresh() async => state = await _isar.getClassSchedules();

  Future<void> register(String classId) async {
    final list = await _isar.getClassSchedules();
    final cls = list.firstWhere((c) => c.classId == classId,
        orElse: () => throw Exception('Không tìm thấy lớp'));
    if (cls.registeredCount < cls.maxCapacity) {
      cls.registeredCount += 1;
      await _isar.saveClassSchedule(cls);
      await refresh();
    }
  }
}

final gymClassesProvider =
    StateNotifierProvider<GymClassesNotifier, List<GymClassSchedule>>((ref) {
  return GymClassesNotifier(ref.watch(gymIsarServiceProvider));
});

// ================= NGHIỆP VỤ GIAI ĐOẠN 1 =================

/// Bán gói tập cho hội viên: tạo thẻ + tính ngày hết hạn từ loại gói.
/// Trả về null nếu hội viên không tồn tại.
Future<GymMembershipCard?> sellPlan(
  WidgetRef ref, {
  required String memberId,
  required String planId,
}) async {
  final isar = ref.read(gymIsarServiceProvider);
  final member = await isar.findMember(memberId);
  if (member == null) return null;
  final plan = await isar.findPlan(planId);
  if (plan == null) return null;

  // Nếu đang có thẻ còn hạn cùng gói → gia hạn cộng thêm thời gian.
  final existing = await isar.getActiveCard(memberId);
  final start = (existing != null && existing.planId == planId)
      ? existing.endDate
      : DateTime.now();
  final card = GymMembershipCard()
    ..cardId = 'CARD-${DateTime.now().millisecondsSinceEpoch}'
    ..memberId = member.memberId
    ..planId = plan.planId
    ..startDate = start
    ..endDate = start.add(Duration(days: plan.durationDays))
    ..paymentStatus = 'paid'
    ..status = 'active';
  await isar.saveCard(card);

  ref.read(gymCardsVersionProvider.notifier).state++;
  ref.read(gymCheckInsTodayProvider.notifier).refresh();
  return card;
}

/// Check-in theo SĐT/QR: kiểm tra thẻ còn hạn rồi ghi nhận.
/// Trả về thông báo lỗi, hoặc null nếu OK.
Future<String?> checkInByQuery(WidgetRef ref, String query) async {
  final isar = ref.read(gymIsarServiceProvider);
  final member = await isar.findMember(query);
  if (member == null) return 'Không tìm thấy hội viên với "$query"';

  final card = await isar.getActiveCard(member.memberId);
  if (card == null) {
    return '${member.fullName} chưa có gói tập hiệu lực. Vui lòng bán gói!';
  }

  final now = DateTime.now();
  await isar.saveCheckIn(GymCheckIn()
    ..checkInId = 'CHK-${now.millisecondsSinceEpoch}'
    ..memberId = member.memberId
    ..cardId = card.cardId
    ..method = query == member.qrCode ? 'qr_code' : 'manual');

  // Đếm lượt tập nếu gói giới hạn số lần.
  final plan = await isar.findPlan(card.planId);
  if (plan != null && plan.totalSessions > 0) {
    card.sessionsUsed += 1;
    if (card.sessionsUsed >= plan.totalSessions) card.status = 'expired';
    await isar.saveCard(card);
  }

  ref.read(gymCheckInsTodayProvider.notifier).refresh();
  ref.read(gymCardsVersionProvider.notifier).state++;
  return null;
}

/// Bộ đếm phiên bản thẻ — tăng mỗi khi bán/gia hạn/check-in để dashboard
/// và danh sách thẻ tính toán lại (sắp hết hạn...) mà không cần stream DB.
final gymCardsVersionProvider = StateProvider<int>((ref) => 0);

/// Thẻ sắp hết hạn trong [days] ngày tới (kèm tên hội viên).
final gymExpiringCardsProvider = FutureProvider.autoDispose
    .family<List<({GymMembershipCard card, GymMember? member})>, int>(
        (ref, days) async {
  ref.watch(gymCardsVersionProvider);
  final isar = ref.watch(gymIsarServiceProvider);
  final cards = await isar.getCards();
  final limit = DateTime.now().add(Duration(days: days));
  final result = <({GymMembershipCard card, GymMember? member})>[];
  for (final c in cards) {
    if (c.status != 'active') continue;
    if (c.endDate.isBefore(DateTime.now())) continue;
    if (c.endDate.isAfter(limit)) continue;
    final m = await isar.findMember(c.memberId);
    result.add((card: c, member: m));
  }
  result.sort((a, b) => a.card.endDate.compareTo(b.card.endDate));
  return result;
});

/// Doanh thu hôm nay = tổng giá gói của các thẻ bán ra trong hôm nay.
final gymRevenueTodayProvider = FutureProvider<double>((ref) async {
  ref.watch(gymCardsVersionProvider);
  final isar = ref.watch(gymIsarServiceProvider);
  final now = DateTime.now();
  final startOfDay = DateTime(now.year, now.month, now.day);
  final cards =
      await isar.getCards(); // gồm cả thẻ mới tạo hôm nay (startDate >= 0h)
  double total = 0;
  for (final c in cards) {
    if (!c.startDate.isBefore(startOfDay)) {
      final plan = await isar.findPlan(c.planId);
      total += plan?.price ?? 0;
    }
  }
  return total;
});
