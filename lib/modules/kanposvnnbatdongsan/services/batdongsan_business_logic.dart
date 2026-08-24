import '../models/broker.dart';
import '../models/customer.dart';
import '../models/floor_fee.dart';
import '../models/property.dart';
import '../models/transaction.dart';

/// Kết quả so khớp một BĐS với nhu cầu khách mua.
class BdsMatchResult {
  final BdsProperty property;
  final double score; // 0..100
  final List<String> reasons; // Điểm cộng/trị hiển thị UI

  const BdsMatchResult({
    required this.property,
    required this.score,
    required this.reasons,
  });
}

/// Xếp hạng môi giới (báo cáo PRD mục 15).
class BrokerRanking {
  final Broker broker;
  final int dealCount; // Số giao dịch hoàn thành
  final double salesValue; // Tổng giá trị chốt
  final double commissionEarned; // Hoa hồng thực nhận
  final double kpiScore;

  const BrokerRanking({
    required this.broker,
    required this.dealCount,
    required this.salesValue,
    required this.commissionEarned,
    required this.kpiScore,
  });
}

/// Tóm lược báo cáo doanh thu/lợi nhuận theo kỳ.
class ProfitReport {
  final double transactionIncome; // Phí sàn + hoa hồng từ GD hoàn thành
  final double feeIncome; // Phí quảng cáo/dịch vụ/hồ sơ
  final double revenue; // Doanh thu
  final double brokerPayout; // Hoa hồng thực trả môi giới
  final double otherExpense; // Chi phí khác
  final double expense; // Tổng chi
  final double profit; // Lợi nhuận

  const ProfitReport({
    required this.transactionIncome,
    required this.feeIncome,
    required this.revenue,
    required this.brokerPayout,
    required this.otherExpense,
    required this.expense,
    required this.profit,
  });
}

/// Tóm lược báo cáo giao dịch theo tháng (PRD mục 15).
class MonthlyTxReport {
  final int total;
  final double totalValue; // Tổng giá trị chốt (không tính hủy)
  final int successCount;
  final int cancelledCount;

  const MonthlyTxReport({
    required this.total,
    required this.totalValue,
    required this.successCount,
    required this.cancelledCount,
  });
}

/// Tóm lược báo cáo khách hàng (PRD mục 15).
class CustomerReport {
  final int newBuyersThisMonth;
  final int newSellersThisMonth;
  final int buyersInTransaction;
  final int vipCount;

  const CustomerReport({
    required this.newBuyersThisMonth,
    required this.newSellersThisMonth,
    required this.buyersInTransaction,
    required this.vipCount,
  });
}

/// Logic nghiệp vụ module BĐS — hàm thuần Dart, không phụ thuộc Isar/UI.
class BdsBusinessLogic {
  // ================= PHÂN LOẠI BĐS (PRD mục 8) =================

  static const landTypes = [
    'Đất thổ cư',
    'Đất nền',
    'Đất vườn',
    'Đất nông nghiệp',
  ];
  static const houseTypes = [
    'Nhà ngõ',
    'Nhà mặt phố',
    'Biệt thự',
    'Nhà cấp 4',
  ];
  static const apartmentTypes = [
    'Chung cư Studio',
    'Chung cư 1PN',
    'Chung cư 2PN',
    'Chung cư 3PN',
  ];
  static const premisesTypes = [
    'Shophouse',
    'Văn phòng',
    'Kho xưởng',
  ];

  static const allPropertyTypes = [
    ...landTypes,
    ...houseTypes,
    ...apartmentTypes,
    ...premisesTypes,
  ];

  static const directions = [
    'Đông',
    'Tây',
    'Nam',
    'Bắc',
    'Đông Bắc',
    'Đông Nam',
    'Tây Bắc',
    'Tây Nam',
  ];

  static const frontages = [
    'Mặt phố',
    'Góc 2 mặt tiền',
    'Đường 1 chiều',
    'Đường 2 chiều',
    'Hẻm xe hơi',
    'Hẻm nhỏ',
  ];

  static const legalStatuses = [
    'Sổ đỏ',
    'Sổ hồng',
    'Đang làm sổ',
    'Hợp đồng mua bán',
  ];

  static const features = [
    'Chính chủ',
    'Góc 2 mặt tiền',
    'Mặt tiền đường 1 chiều',
    'Mặt tiền đường 2 chiều',
    'Hẻm xe hơi',
    'Hẻm nhỏ',
    'Gần trường',
    'Gần bệnh viện',
    'Gần chợ',
  ];

  /// Nhóm loại BĐS ('Đất'/'Nhà'/'Chung cư'/'Mặt bằng') từ subtype.
  static String propertyCategory(String? propertyType) {
    if (propertyType == null) return 'Khác';
    if (landTypes.contains(propertyType)) return 'Đất';
    if (houseTypes.contains(propertyType)) return 'Nhà';
    if (apartmentTypes.contains(propertyType)) return 'Chung cư';
    if (premisesTypes.contains(propertyType)) return 'Mặt bằng';
    return 'Khác';
  }

  // ================= SO KHỚP TỰ ĐỘNG (PRD mục 11) =================

  /// Điểm phù hợp 0..100 giữa khách mua và BĐS.
  ///
  /// Trọng số: giá 25, quận 15, diện tích 15, loại 10, thành phố 10,
  /// phường 10, hướng 5, mặt tiền 5, pháp lý 5.
  static double matchScore(Customer buyer, BdsProperty p) {
    if (buyer.type != CustomerType.buyer) return 0;
    var score = 0.0;

    // Giá (25): trong khoảng -> full; lệch <20% ngoài khoảng -> nửa.
    final price = p.price ?? 0;
    final from = buyer.demandPriceFrom;
    final to = buyer.demandPriceTo;
    if (from != null || to != null) {
      final lo = from ?? 0;
      final hi = to ?? double.infinity;
      if (price >= lo && price <= hi) {
        score += 25;
      } else if (price > 0 && _nearRange(price, lo, hi)) {
        score += 12;
      }
    }

    // Quận/Huyện (15)
    if (_eq(buyer.demandDistrict, p.district)) score += 15;

    // Diện tích (15)
    final aFrom = buyer.demandAreaFrom;
    final aTo = buyer.demandAreaTo;
    final areaSize = p.areaSize ?? 0;
    if (aFrom != null || aTo != null) {
      final lo = aFrom ?? 0;
      final hi = aTo ?? double.infinity;
      if (areaSize >= lo && areaSize <= hi) {
        score += 15;
      } else if (areaSize >= lo * 0.7 && areaSize <= hi * 1.3) {
        score += 7;
      }
    }

    // Loại BĐS (10): đúng subtype full, cùng nhóm nửa.
    if (_eq(buyer.demandPropertyType, p.propertyType)) {
      score += 10;
    } else if (buyer.demandPropertyType != null &&
        propertyCategory(buyer.demandPropertyType) ==
            propertyCategory(p.propertyType)) {
      score += 5;
    }

    // Thành phố (10)
    if (_eq(buyer.demandCity, p.province)) score += 10;

    // Phường/Xã (10)
    if (_eq(buyer.demandWard, p.ward)) score += 10;

    // Hướng (5), Mặt tiền (5), Pháp lý (5)
    if (_eq(buyer.demandDirection, p.direction)) score += 5;
    if (_eq(buyer.demandFrontage, p.frontage)) score += 5;
    if (_eq(buyer.demandLegalStatus, p.legalStatus)) score += 5;

    return score.clamp(0, 100);
  }

  static bool _nearRange(double v, double lo, double hi) {
    if (v < lo) return v >= lo * 0.8;
    if (v > hi) return v <= hi * 1.2;
    return true;
  }

  /// Danh sách gợi ý sắp xếp theo điểm phù hợp giảm dần.
  static List<BdsMatchResult> matchPropertiesForBuyer(
    Customer buyer,
    List<BdsProperty> properties, {
    double minScore = 40,
    bool excludeSold = true,
  }) {
    final results = <BdsMatchResult>[];
    for (final p in properties) {
      if (p.deletedAt != null) continue;
      if (excludeSold && p.status == PropertyStatus.sold) continue;
      final score = matchScore(buyer, p);
      if (score >= minScore) {
        results.add(
          BdsMatchResult(
            property: p,
            score: score,
            reasons: matchReasons(buyer, p),
          ),
        );
      }
    }
    results.sort((a, b) => b.score.compareTo(a.score));
    return results;
  }

  /// Lý do phù hợp để hiển thị chip trên UI.
  static List<String> matchReasons(Customer buyer, BdsProperty p) {
    final reasons = <String>[];
    if (_eq(buyer.demandCity, p.province)) reasons.add('Đúng thành phố');
    if (_eq(buyer.demandDistrict, p.district)) reasons.add('Đúng quận');
    if (_eq(buyer.demandWard, p.ward)) reasons.add('Đúng phường');
    if (_eq(buyer.demandDirection, p.direction)) reasons.add('Đúng hướng');
    if (_eq(buyer.demandFrontage, p.frontage)) {
      reasons.add('Đúng mặt tiền');
    }
    if (_eq(buyer.demandLegalStatus, p.legalStatus)) {
      reasons.add('Pháp lý như yêu cầu');
    }
    if (_eq(buyer.demandPropertyType, p.propertyType)) {
      reasons.add('Đúng loại BĐS');
    }
    final price = p.price ?? 0;
    if ((buyer.demandPriceFrom != null || buyer.demandPriceTo != null) &&
        price >= (buyer.demandPriceFrom ?? 0) &&
        price <= (buyer.demandPriceTo ?? double.infinity)) {
      reasons.add('Giá trong tầm tiền');
    }
    return reasons;
  }

  // ================= MÃ TỰ ĐỘNG =================

  static String nextCode(List<String?> existingCodes, String prefix) {
    var maxNum = 0;
    for (final c in existingCodes) {
      if (c == null || !c.startsWith(prefix)) continue;
      final numPart = int.tryParse(c.substring(prefix.length));
      if (numPart != null && numPart > maxNum) maxNum = numPart;
    }
    return '$prefix${(maxNum + 1).toString().padLeft(4, '0')}';
  }

  static String nextTransactionCode(List<TransactionRecord> existing) =>
      nextCode(existing.map((t) => t.transactionCode).toList(), 'GD');

  static String nextPropertyCode(List<BdsProperty> existing) =>
      nextCode(existing.map((p) => p.propertyCode).toList(), 'BDS');

  static String nextFeeCode(List<FloorFee> existing) =>
      nextCode(existing.map((f) => f.feeCode).toList(), 'PFS');

  // ================= LUỒNG TRẠNG THÁI GD (PRD mục 12) =================

  /// Đang đàm phán → Đặt cọc → Công chứng → Hoàn thành; mọi trạng thái
  /// (trừ hoàn thành/hủy) đều có thể Hủy.
  static bool canTransition(TransactionStatus from, TransactionStatus to) {
    switch (from) {
      case TransactionStatus.negotiating:
        return to == TransactionStatus.deposited ||
            to == TransactionStatus.cancelled;
      case TransactionStatus.deposited:
        return to == TransactionStatus.notarized ||
            to == TransactionStatus.cancelled;
      case TransactionStatus.notarized:
        return to == TransactionStatus.completed ||
            to == TransactionStatus.cancelled;
      case TransactionStatus.completed:
      case TransactionStatus.cancelled:
        return false;
    }
  }

  static List<TransactionStatus> nextStatuses(TransactionStatus current) {
    const order = [
      TransactionStatus.deposited,
      TransactionStatus.notarized,
      TransactionStatus.completed,
    ];
    if (current == TransactionStatus.completed ||
        current == TransactionStatus.cancelled) {
      return const [];
    }
    final idx = order.indexOf(current) + 1;
    return [
      if (idx < order.length) order[idx],
      TransactionStatus.cancelled,
    ];
  }

  // ================= HOA HỒNG (PRD mục 13) =================

  /// Hoa hồng thực nhận của môi giới = tổng hoa hồng x % + thưởng - khấu trừ.
  static double brokerNetCommission(TransactionRecord t) {
    final base = t.commission ?? 0;
    final rate = (t.commissionRate ?? 0).clamp(0, 100);
    final net =
        base * rate / 100 + (t.brokerBonus ?? 0) - (t.brokerDeduction ?? 0);
    return net < 0 ? 0 : net;
  }

  /// Phần hoa hồng công ty giữ lại.
  static double companyCommissionShare(TransactionRecord t) {
    final share = (t.commission ?? 0) - brokerNetCommission(t);
    return share < 0 ? 0 : share;
  }

  // ================= DOANH THU / LỢI NHUẬN =================

  static bool _inPeriod(DateTime? d, int? year, int? quarter, int? month) {
    if (d == null) return false;
    if (year != null && d.year != year) return false;
    if (quarter != null && ((d.month - 1) ~/ 3 + 1) != quarter) return false;
    if (month != null && d.month != month) return false;
    return true;
  }

  static bool _isCompleted(TransactionRecord t) =>
      t.status == TransactionStatus.completed && t.deletedAt == null;

  /// Báo cáo doanh thu - chi phí - lợi nhuận theo kỳ (PRD mục 15).
  ///
  /// Doanh thu  = (phí sàn + hoa hồng) GD hoàn thành + phí quảng cáo/dịch vụ/hồ sơ.
  /// Chi phí    = hoa hồng thực trả môi giới + chi phí khác.
  /// Lợi nhuận  = Doanh thu - Chi phí.
  static ProfitReport profitReport(
    List<TransactionRecord> transactions,
    List<FloorFee> fees, {
    int? year,
    int? quarter,
    int? month,
  }) {
    var txIncome = 0.0;
    var payout = 0.0;
    for (final t in transactions) {
      if (!_inPeriod(t.transactionDate, year, quarter, month)) continue;
      if (!_isCompleted(t)) continue;
      txIncome += (t.floorFee ?? 0) + (t.commission ?? 0);
      payout += brokerNetCommission(t);
    }
    var fIncome = 0.0;
    var oExpense = 0.0;
    for (final f in fees) {
      if (f.deletedAt != null) continue;
      if (!_inPeriod(f.feeDate, year, quarter, month)) continue;
      if (f.feeType.isExpense) {
        oExpense += f.amount ?? 0;
      } else {
        fIncome += f.amount ?? 0;
      }
    }
    final revenue = txIncome + fIncome;
    final expense = payout + oExpense;
    return ProfitReport(
      transactionIncome: txIncome,
      feeIncome: fIncome,
      revenue: revenue,
      brokerPayout: payout,
      otherExpense: oExpense,
      expense: expense,
      profit: revenue - expense,
    );
  }

  /// Báo cáo giao dịch tháng (PRD mục 15).
  static MonthlyTxReport monthlyTransactionReport(
    List<TransactionRecord> transactions,
    int year,
    int month,
  ) {
    var total = 0;
    var totalValue = 0.0;
    var success = 0;
    var cancelled = 0;
    for (final t in transactions) {
      if (!_inPeriod(t.transactionDate, year, null, month)) continue;
      if (t.deletedAt != null) continue;
      total++;
      if (t.status == TransactionStatus.cancelled) {
        cancelled++;
        continue;
      }
      if (t.status == TransactionStatus.completed) success++;
      totalValue += t.finalPrice ?? 0;
    }
    return MonthlyTxReport(
      total: total,
      totalValue: totalValue,
      successCount: success,
      cancelledCount: cancelled,
    );
  }

  /// Doanh số theo tháng trong năm (12 phần tử) — dùng biểu đồ báo cáo.
  static List<double> monthlySalesSeries(
    List<TransactionRecord> transactions,
    int year,
  ) {
    final series = List<double>.filled(12, 0);
    for (final t in transactions) {
      if (t.deletedAt != null) continue;
      if (t.status == TransactionStatus.cancelled) continue;
      final d = t.transactionDate;
      if (d == null || d.year != year) continue;
      series[d.month - 1] += t.finalPrice ?? 0;
    }
    return series;
  }

  /// Xếp hạng môi giới: số GD hoàn thành, doanh số, hoa hồng thực nhận, KPI.
  ///
  /// KPI = số GD x 10 + doanh số x 2 + hoa hồng thực nhận x 5.
  static List<BrokerRanking> brokerRankings(
    List<Broker> brokers,
    List<TransactionRecord> transactions,
  ) {
    final rankings = <BrokerRanking>[];
    for (final b in brokers) {
      if (b.deletedAt != null) continue;
      final rid = b.remoteId;
      var deals = 0;
      var sales = 0.0;
      var comm = 0.0;
      for (final t in transactions) {
        if (!_isCompleted(t)) continue;
        if (t.brokerId != rid) continue;
        deals++;
        sales += t.finalPrice ?? 0;
        comm += brokerNetCommission(t);
      }
      rankings.add(BrokerRanking(
        broker: b,
        dealCount: deals,
        salesValue: sales,
        commissionEarned: comm,
        kpiScore: deals * 10 + sales * 2 + comm * 5,
      ));
    }
    rankings.sort((a, b) => b.kpiScore.compareTo(a.kpiScore));
    return rankings;
  }

  // ================= DASHBOARD (PRD mục 4.1) =================

  /// Chỉ số dashboard: tổng BĐS, khách mua/bán, GD hôm nay/tháng, doanh thu,
  /// hoa hồng, phí sàn, lợi nhuận (toàn bộ dữ liệu hiện có).
  static Map<String, double> dashboardMetrics({
    required List<BdsProperty> properties,
    required List<Customer> customers,
    required List<TransactionRecord> transactions,
    required List<FloorFee> fees,
    DateTime? now,
  }) {
    final n = now ?? DateTime.now();
    final activeProps =
        properties.where((p) => p.deletedAt == null).length.toDouble();
    final buyers = customers
        .where((c) => c.deletedAt == null && c.type == CustomerType.buyer)
        .length
        .toDouble();
    final sellers = customers
        .where((c) => c.deletedAt == null && c.type == CustomerType.seller)
        .length
        .toDouble();

    var todayTx = 0.0;
    var monthTx = 0.0;
    var revenue = 0.0;
    var commission = 0.0;
    var floorFee = 0.0;
    for (final t in transactions) {
      // GD đã hủy không tính vào "số giao dịch hôm nay/tháng".
      if (t.deletedAt != null || t.status == TransactionStatus.cancelled) {
        continue;
      }
      final d = t.transactionDate;
      if (d != null) {
        final isToday =
            d.year == n.year && d.month == n.month && d.day == n.day;
        final isMonth = d.year == n.year && d.month == n.month;
        if (isToday) todayTx++;
        if (isMonth) monthTx++;
      }
      if (_isCompleted(t)) {
        revenue += (t.floorFee ?? 0) + (t.commission ?? 0);
        commission += t.commission ?? 0;
        floorFee += t.floorFee ?? 0;
      }
    }
    for (final f in fees) {
      if (f.deletedAt == null && !f.feeType.isExpense) revenue += f.amount ?? 0;
    }
    final report = profitReport(transactions, fees);

    return {
      'totalProperties': activeProps,
      'totalBuyers': buyers,
      'totalSellers': sellers,
      'todayTransactions': todayTx,
      'monthTransactions': monthTx,
      'revenue': revenue,
      'commission': commission,
      'floorFee': floorFee,
      'profit': report.profit,
    };
  }

  // ================= BÁO CÁO KHÁCH HÀNG (PRD mục 15) =================

  static CustomerReport customerReport(
    List<Customer> customers,
    List<TransactionRecord> transactions, {
    DateTime? now,
  }) {
    final n = now ?? DateTime.now();
    var newBuyers = 0;
    var newSellers = 0;
    var vip = 0;
    for (final c in customers) {
      if (c.deletedAt != null) continue;
      if (c.updatedAt != null &&
          c.updatedAt!.year == n.year &&
          c.updatedAt!.month == n.month) {
        if (c.type == CustomerType.buyer) {
          newBuyers++;
        } else {
          newSellers++;
        }
      }
      if (c.isVip) vip++;
    }
    final activeBuyerIds = transactions
        .where((t) =>
            t.deletedAt == null &&
            (t.status == TransactionStatus.negotiating ||
                t.status == TransactionStatus.deposited ||
                t.status == TransactionStatus.notarized))
        .map((t) => t.buyerId)
        .whereType<String>()
        .toSet();
    final inTx = customers
        .where((c) =>
            c.deletedAt == null &&
            c.type == CustomerType.buyer &&
            c.remoteId != null &&
            activeBuyerIds.contains(c.remoteId))
        .length;
    return CustomerReport(
      newBuyersThisMonth: newBuyers,
      newSellersThisMonth: newSellers,
      buyersInTransaction: inTx,
      vipCount: vip,
    );
  }

  // ================= TIỆN ÍCH HIỂN THỊ =================

  /// Định dạng tiền theo đơn vị TỶ: >=1 tỷ "x,x tỷ", ngược lại "yyy triệu".
  static String formatMoney(double? ty) {
    if (ty == null) return '-';
    if (ty.abs() >= 1) {
      final v = ty.toStringAsFixed(1);
      final trimmed = v.endsWith('.0') ? v.substring(0, v.length - 2) : v;
      return '$trimmed tỷ';
    }
    return '${(ty * 1000).round()} triệu';
  }

  static bool _eq(String? a, String? b) =>
      a != null && b != null && a.trim().toLowerCase() == b.trim().toLowerCase();
}
