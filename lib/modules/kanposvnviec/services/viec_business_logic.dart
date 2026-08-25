import 'dart:math';

import 'package:isar/isar.dart';
import '../models/candidate.dart';
import '../models/contract.dart';
import '../models/employer.dart';
import '../models/job_match.dart';
import '../models/job_posting.dart';
import '../models/payment.dart';
import '../models/viec_ops_models.dart';

/// Kết quả ghép việc cho một ứng viên / một tin tuyển.
class ViecMatchResult {
  final ViecJobPosting job;
  final double score; // 0-100 (%)
  final double distanceKm;

  ViecMatchResult({required this.job, required this.score, required this.distanceKm});
}

/// Toàn bộ nghiệp vụ KanViec theo kanposvnviec.md.
class ViecBusinessLogic {
  static const double brokeragePercentDefault = 0.10; // §15: 10% mặc định

  static double _haversineKm(lat1, lng1, lat2, lng2) {
    const r = 6371.0;
    final dLat = (lat2 - lat1) * pi / 180;
    final dLng = (lng2 - lng1) * pi / 180;
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLng / 2) *
            sin(dLng / 2);
    return r * 2 * atan2(sqrt(a), sqrt(1 - a));
  }

  // ══════════════ §11+§12. GHÉP VIỆC TỰ ĐỘNG ══════════════

  /// Chuẩn hóa lương về quy tháng để so sánh công bằng:
  /// theo ngày x22 · theo giờ x176 · tuần x4 · năm /12...
  static double monthlyEquivalent(ViecJobPosting j) {
    switch (j.salaryType) {
      case 'hour':
        return j.salary * 8 * 22;
      case 'day':
        return j.salary * 22;
      case 'week':
        return j.salary * 4;
      case 'year':
        return j.salary / 12;
      default:
        return j.salary; // month
    }
  }

  /// Điều kiện cứng (§12): ngành nghề, bán kính, lương, trạng thái,
  /// giới tính, độ tuổi, kinh nghiệm. Không đạt -> loại ngay.
  static bool hardFilter(ViecCandidate c, ViecJobPosting j) {
    if (j.status != 'open') return false;
    if (!c.categoryIds.contains(j.categoryId)) return false;
    if (j.lat == null || j.lng == null || c.lat == null || c.lng == null) {
      return false;
    }
    final dist = _haversineKm(c.lat!, c.lng!, j.lat!, j.lng!);
    if (dist > c.workRadiusKm) return false;
    if (monthlyEquivalent(j) < c.desiredSalary) return false;
    if (c.status != 'available') return false;

    // Yêu cầu giới tính.
    if (j.requiredGender != 'any' && c.gender != j.requiredGender) return false;

    // Độ tuổi.
    if (c.dateOfBirth != null) {
      final age = DateTime.now().difference(c.dateOfBirth!).inDays ~/ 365;
      if (age < j.ageMin || age > j.ageMax) return false;
    }
    return true;
  }

  /// Chấm điểm % (§12): khoảng cách 30% + lương 25% (đạt mong muốn là full)
  /// + kinh nghiệm 20% (đủ yêu cầu được 12, dư càng nhiều càng cao)
  /// + đánh giá nhà tuyển dụng 15% + cùng khu vực 10%.
  static ({double score, double distanceKm}) scoreCandidateJob(
      ViecCandidate c, ViecJobPosting j, ViecEmployer employer) {
    final distance =
        _haversineKm(c.lat ?? 0, c.lng ?? 0, j.lat ?? 0, j.lng ?? 0);

    final distScore = distance <= 1
        ? 30
        : max(0.0, 30 - (distance - 1) / (c.workRadiusKm <= 0 ? 1 : c.workRadiusKm) * 30);

    final ratio =
        c.desiredSalary <= 0 ? 1 : monthlyEquivalent(j) / c.desiredSalary;
    final salaryScore = ratio >= 1
        ? 25
        : (ratio.clamp(0.0, 1.0)) * 25;

    final surplus = c.experienceYears - j.minExperienceYears;
    final expScore = surplus < 0
        ? 0
        : 12 + (surplus.clamp(0, 4) / 4) * 8;

    final ratingScore = (employer.rating / 5).clamp(0.0, 1.0) * 15;

    var areaScore = 0.0;
    final candDistrict = _districtOf(c.address);
    final jobDistrict = _districtOf(j.address);
    if (candDistrict.isNotEmpty &&
        jobDistrict.isNotEmpty &&
        candDistrict == jobDistrict) {
      areaScore = 10;
    }

    final score = distScore + salaryScore + expScore + ratingScore + areaScore;
    return (score: score.clamp(0.0, 100.0), distanceKm: distance);
  }

  static String _districtOf(String address) {
    final m = RegExp(r'(Q\.?\s?\d+|Quận\s[^,]+|Huyện\s[^,]+|TP\.\s?Thủ Đức)')
        .firstMatch(address);
    return m?.group(0)?.trim().toLowerCase() ?? '';
  }

  /// §9+§12. Ghép tự động cho MỘT ứng viên -> nhiều việc phù hợp.
  /// Lưu kết quả vào JobMatch với matchScore %.
  static Future<List<ViecMatchResult>> autoMatchForCandidate(
      Isar db, ViecCandidate candidate,
      {int topN = 5, double minScore = 50}) async {
    final jobs =
        await db.viecJobPostings.filter().statusEqualTo('open').findAll();
    final results = <ViecMatchResult>[];
    for (final j in jobs) {
      if (!hardFilter(candidate, j)) continue;
      final employer = await db.viecEmployers
          .filter()
          .employerIdEqualTo(j.employerId)
          .findFirst();
      final s = scoreCandidateJob(candidate, j, employer!);
      if (s.score < minScore) continue;
      results.add(
          ViecMatchResult(job: j, score: s.score, distanceKm: s.distanceKm));
    }
    results.sort((a, b) => b.score.compareTo(a.score));
    final top = results.take(topN).toList();

    await db.writeTxn(() async {
      for (final r in top) {
        await db.viecJobMatchs.put(ViecJobMatch()
          ..matchId = 'm_${candidate.candidateId}_${r.job.jobId}'
          ..jobId = r.job.jobId
          ..candidateId = candidate.candidateId
          ..matchScore = r.score
          ..distanceKm = r.distanceKm
          ..status = 'suggested');
      }
    });
    return top;
  }

  /// §9. Ghép ngược: một tin tuyển -> nhiều ứng viên phù hợp.
  static Future<List<({ViecCandidate candidate, double score})>>
      autoMatchForJob(Isar db, ViecJobPosting job,
          {int topN = 5, double minScore = 50}) async {
    final candidates = await db.viecCandidates
        .filter()
        .statusEqualTo('available')
        .findAll();
    final employer = await db.viecEmployers
        .filter()
        .employerIdEqualTo(job.employerId)
        .findFirst();
    final out = <({ViecCandidate candidate, double score})>[];
    for (final c in candidates) {
      if (!hardFilter(c, job)) continue;
      final s = scoreCandidateJob(c, job, employer!);
      if (s.score >= minScore) out.add((candidate: c, score: s.score));
    }
    out.sort((a, b) => b.score.compareTo(a.score));
    return out.take(topN).toList();
  }

  // ══════════════ §13+§14-15. NHẬN VIỆC / HỢP ĐỒNG / PHÍ ══════════════

  /// Ứng viên nhận việc từ gợi ý: tạo hợp đồng + thu phí môi giới theo %
  /// hoặc cố định (§15), tăng filledCount của tin.
  static Future<ViecContract> acceptMatch(
    Isar db, {
    required String matchId,
    String feeMode = 'percent', // percent | fixed | monthly
    double feeValue = brokeragePercentDefault,
  }) async {
    final m = await db.viecJobMatchs.filter().matchIdEqualTo(matchId).findFirst();
    if (m == null) throw Exception('Không tìm thấy gợi ý $matchId');
    if (m.status == 'accepted') throw Exception('Gợi ý đã được nhận.');
    final job = await db.viecJobPostings
        .filter()
        .jobIdEqualTo(m.jobId)
        .findFirst();
    if (job == null || job.status != 'open') {
      throw Exception('Tin tuyển dụng không còn mở.');
    }

    late ViecContract contract;
    await db.writeTxn(() async {
      m.status = 'accepted';
      await db.viecJobMatchs.put(m);

      contract = ViecContract()
        ..contractId = 'ct_${matchId}_${DateTime.now().millisecondsSinceEpoch}'
        ..matchId = m.matchId
        ..startDate = DateTime.now()
        ..agreedSalary = job.salary
        ..terms = 'Lương ${job.salary} (${job.salaryType}) tại ${job.address}'
        ..status = 'active';
      await db.viecContracts.put(contract);

      // Phí môi giới (§15).
      final fee = feeMode == 'percent'
          ? job.salary * feeValue
          : feeValue;
      await db.viecPayments.put(ViecPayment()
        ..paymentId = 'pay_${contract.contractId}'
        ..contractId = contract.contractId
        ..employerId = job.employerId
        ..amount = fee
        ..status = 'paid');

      // Thu phí môi giới -> doanh thu trung tâm (§16).
      await db.viecFinanceTxs.put(ViecFinanceTx()
        ..txId = 'thu_fee_${contract.contractId}'
        ..isIncome = true
        ..category = 'REFERRAL_FEE'
        ..amount = fee
        ..note = 'Phí môi giới nhận việc ${m.jobId}');

      // Tin tuyển đủ người chưa?
      job.filledCount += 1;
      if (job.filledCount >= job.quantity) {
        job.status = 'filled'; // §8 Đã tuyển đủ
      }
      await db.viecJobPostings.put(job);
    });
    return contract;
  }

  /// §13. Hoàn thành phiên làm việc + chốt hợp đồng hoàn thành.
  static Future<void> completeWorkSession(
      Isar db, ViecContract contract) async {
    await db.writeTxn(() async {
      final sessions = await db.viecWorkSessions
          .filter()
          .contractIdEqualTo(contract.contractId)
          .statusEqualTo('working')
          .findAll();
      for (final s in sessions) {
        s.status = 'completed';
        await db.viecWorkSessions.put(s);
      }
      contract.status = 'completed';
      await db.viecContracts.put(contract);

      final m = await db.viecJobMatchs
          .filter()
          .matchIdEqualTo(contract.matchId)
          .findFirst();
      final c = m == null
          ? null
          : await db.viecCandidates
              .filter()
              .candidateIdEqualTo(m.candidateId)
              .findFirst();
      if (c != null) {
        c.status = 'working'; // §6 đang làm
        await db.viecCandidates.put(c);
      }
    });
  }

  static Future<void> cancelContract(Isar db, ViecContract contract,
      {String reason = ''}) async {
    await db.writeTxn(() async {
      contract.status = 'cancelled';
      contract.terms = '${contract.terms} | Hủy: $reason'.trim();
      await db.viecContracts.put(contract);
    });
  }

  // ══════════════ §16. THU CHI THỦ CÔNG ══════════════

  static Future<ViecFinanceTx> addFinanceTx(Isar db,
      {required bool isIncome,
      required String category,
      required double amount,
      String note = ''}) async {
    if (amount <= 0) throw Exception('Số tiền phải > 0.');
    late ViecFinanceTx tx;
    await db.writeTxn(() async {
      tx = ViecFinanceTx()
        ..txId =
            '${isIncome ? 'thu' : 'chi'}_${DateTime.now().millisecondsSinceEpoch}_$category'
        ..isIncome = isIncome
        ..category = category
        ..amount = amount
        ..note = note;
      await db.viecFinanceTxs.put(tx);
    });
    return tx;
  }

  // ══════════════ §21. ĐÁNH GIÁ 2 CHIỀU ══════════════

  static Future<void> submitRating(Isar db,
      {required String matchId,
      required String raterType, // candidate | employer
      required String targetUuid,
      required int stars,
      String comment = ''}) async {
    if (stars < 1 || stars > 5) throw Exception('Số sao phải 1-5.');
    await db.writeTxn(() async {
      await db.viecRatings.put(ViecRating()
        ..ratingId =
            'rate_${matchId}_$raterType'
        ..matchId = matchId
        ..raterType = raterType
        ..targetUuid = targetUuid
        ..stars = stars
        ..comment = comment);
      if (raterType == 'employer') return; // chấm ứng viên không cập nhật NTD
      // Ứng viên chấm NTD -> cập nhật rating trung bình của NTD.
      final all = await db.viecRatings
          .filter()
          .targetUuidEqualTo(targetUuid)
          .raterTypeEqualTo('candidate')
          .findAll();
      final target = await db.viecEmployers
          .filter()
          .employerIdEqualTo(targetUuid)
          .findFirst();
      if (target != null && all.isNotEmpty) {
        target.rating =
            all.fold<double>(0, (s, r) => s + r.stars) / all.length;
        await db.viecEmployers.put(target);
      }
    });
  }

  // ══════════════ §19+§25. THÔNG BÁO & NHẬT KÝ ══════════════

  static Future<void> notify(Isar db,
      {required String targetUuid,
      required String title,
      String body = '',
      String channel = 'push'}) async {
    await db.writeTxn(() async {
      await db.viecNotifications.put(ViecNotification()
        ..notifId =
            'ntf_${DateTime.now().millisecondsSinceEpoch}_$targetUuid'
        ..targetUuid = targetUuid
        ..channel = channel
        ..title = title
        ..body = body);
    });
  }

  static Future<void> audit(Isar db, String actor, String action,
      String entity, String entityId, String detail) async {
    await db.writeTxn(() async {
      await db.viecAuditLogs.put(ViecAuditLog()
        ..actorUuid = actor
        ..action = action
        ..entity = entity
        ..entityId = entityId
        ..detail = detail
        ..createdAt = DateTime.now());
    });
  }

  // ══════════════ §17+§29. BÁO CÁO ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  static Future<Map<String, dynamic>> report(
      Isar db, DateTime from, DateTime to) async {
    final jobs = await db.viecJobPostings.where().findAll();
    final candidates = await db.viecCandidates.where().findAll();
    final employers = await db.viecEmployers.where().findAll();
    final matches = await db.viecJobMatchs.where().findAll();
    final contracts = await db.viecContracts.where().findAll();
    final txs = await db.viecFinanceTxs.where().findAll();

    final inRangeJobs =
        jobs.where((j) => _inRange(j.createdAt, from, to)).toList();
    final newCandidates =
        candidates.where((c) => _inRange(c.createdAt, from, to)).length;

    var revenue = 0.0, expense = 0.0;
    final byCategoryIncome = <String, double>{};
    final byCategoryExpense = <String, double>{};
    for (final t in txs) {
      if (!_inRange(t.createdAt, from, to)) continue;
      if (t.isIncome) {
        revenue += t.amount;
        byCategoryIncome[t.category] = (byCategoryIncome[t.category] ?? 0) + t.amount;
      } else {
        expense += t.amount;
        byCategoryExpense[t.category] =
            (byCategoryExpense[t.category] ?? 0) + t.amount;
      }
    }

    final accepted = matches.where((m) => m.status == 'accepted').length;
    final suggested = matches.length;

    // Top ngành nghề & khu vực tuyển nhiều nhất (§29).
    final byCat = <String, int>{};
    final byDistrict = <String, int>{};
    for (final j in inRangeJobs) {
      byCat[j.categoryId] = (byCat[j.categoryId] ?? 0) + 1;
      final district = RegExp(r'(Q\.?\s?\d+|Quận\s[^,]+|Huyện\s[^,]+)')
          .firstMatch(j.address)
          ?.group(0);
      if (district != null) {
        byDistrict[district.trim()] = (byDistrict[district.trim()] ?? 0) + 1;
      }
    }

    return {
      'revenue': revenue,
      'expense': expense,
      'profit': revenue - expense,
      'incomeByCategory': byCategoryIncome,
      'expenseByCategory': byCategoryExpense,
      'totalJobs': jobs.length,
      'hiringJobs': jobs.where((j) => j.status == 'open').length,
      'filledJobs': jobs.where((j) => j.status == 'filled').length,
      'completedContracts': contracts.where((c) => c.status == 'completed').length,
      'activeContracts': contracts.where((c) => c.status == 'active').length,
      'newCandidates': newCandidates,
      'totalCandidates': candidates.length,
      'totalEmployers': employers.length,
      'matchSuccessRatePercent':
          suggested == 0 ? 0.0 : accepted / suggested * 100,
      'topCategories':
          (byCat.entries.toList()..sort((a, b) => b.value.compareTo(a.value)))
              .take(3)
              .map((e) => e.key)
              .toList(),
      'topDistricts':
          (byDistrict.entries.toList()..sort((a, b) => b.value.compareTo(a.value)))
              .take(3)
              .map((e) => e.key)
              .toList(),
    };
  }

  /// §18. Dashboard hôm nay.
  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));

    final jobs = await db.viecJobPostings.where().findAll();
    final candidates = await db.viecCandidates.where().findAll();
    final matches = await db.viecJobMatchs.where().findAll();
    final txs = await db.viecFinanceTxs.where().findAll();

    final revenueToday = txs
        .where((t) => t.isIncome && _inRange(t.createdAt, todayStart, tomorrow))
        .fold<double>(0, (s, t) => s + t.amount);

    final nearExpiry = jobs
        .where((j) =>
            j.status == 'open' &&
            j.endDate != null &&
            j.endDate!.isBefore(now.add(const Duration(days: 3))) &&
            j.endDate!.isAfter(now))
        .toList();

    return {
      'newJobsToday':
          jobs.where((j) => _inRange(j.createdAt, todayStart, tomorrow)).length,
      'newCandidatesToday': candidates
          .where((c) => _inRange(c.createdAt, todayStart, tomorrow))
          .length,
      'revenueToday': revenueToday,
      'successfulMatchesToday': matches
          .where((m) =>
              m.status == 'accepted' && _inRange(m.createdAt, todayStart, tomorrow))
          .length,
      'jobsNearExpiry': nearExpiry.map((j) => j.jobId).toList(),
      'hiringJobs': jobs.where((j) => j.status == 'open').length,
    };
  }

  /// §29. Thông báo "có việc gần bạn" cho các ứng viên còn rảnh.
  static Future<int> notifyNearbyOpenings(Isar db) async {
    final openJobs =
        await db.viecJobPostings.filter().statusEqualTo('open').findAll();
    final candidates =
        await db.viecCandidates.filter().statusEqualTo('available').findAll();
    var sent = 0;
    for (final c in candidates) {
      final near = openJobs.any((j) {
        if (j.lat == null ||
            j.lng == null ||
            c.lat == null ||
            c.lng == null ||
            !c.categoryIds.contains(j.categoryId)) {
          return false;
        }
        return _haversineKm(c.lat!, c.lng!, j.lat!, j.lng!) <= c.workRadiusKm;
      });
      if (near) {
        await notify(db,
            targetUuid: c.candidateId,
            title: 'Có việc gần bạn!',
            body: 'Có tin tuyển dụng phù hợp trong bán kính ${c.workRadiusKm}km.');
        sent++;
      }
    }
    return sent;
  }
}
