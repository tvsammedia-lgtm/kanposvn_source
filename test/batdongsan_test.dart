import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/broker.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/customer.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/floor_fee.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/property.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/transaction.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/services/batdongsan_business_logic.dart';

BdsProperty _prop({
  String? code,
  String? title,
  String? province,
  String? district,
  String? ward,
  double? price,
  double? areaSize,
  String? type,
  String? legal,
  String? direction,
  String? frontage,
  PropertyStatus status = PropertyStatus.available,
}) =>
    BdsProperty()
      ..propertyCode = code
      ..title = title
      ..province = province
      ..district = district
      ..ward = ward
      ..price = price
      ..areaSize = areaSize
      ..propertyType = type
      ..legalStatus = legal
      ..direction = direction
      ..frontage = frontage
      ..status = status;

Customer _buyer({
  String? city,
  String? district,
  String? ward,
  double? priceFrom,
  double? priceTo,
  double? areaFrom,
  double? areaTo,
  String? type,
  String? direction,
  String? frontage,
  String? legal,
}) =>
    Customer()
      ..name = 'Khách test'
      ..type = CustomerType.buyer
      ..demandCity = city
      ..demandDistrict = district
      ..demandWard = ward
      ..demandPriceFrom = priceFrom
      ..demandPriceTo = priceTo
      ..demandAreaFrom = areaFrom
      ..demandAreaTo = areaTo
      ..demandPropertyType = type
      ..demandDirection = direction
      ..demandFrontage = frontage
      ..demandLegalStatus = legal;

void main() {
  // ================= PHÂN LOẠI =================
  group('propertyCategory (PRD §8)', () {
    test('map đúng 4 nhóm', () {
      expect(BdsBusinessLogic.propertyCategory('Đất nền'), 'Đất');
      expect(BdsBusinessLogic.propertyCategory('Nhà mặt phố'), 'Nhà');
      expect(
          BdsBusinessLogic.propertyCategory('Chung cư 3PN'), 'Chung cư');
      expect(BdsBusinessLogic.propertyCategory('Shophouse'), 'Mặt bằng');
      expect(BdsBusinessLogic.propertyCategory(null), 'Khác');
    });

    test('đủ danh sách subtype theo PRD', () {
      expect(BdsBusinessLogic.landTypes.length, 4);
      expect(BdsBusinessLogic.houseTypes.length, 4);
      expect(BdsBusinessLogic.apartmentTypes.length, 4);
      expect(BdsBusinessLogic.premisesTypes.length, 3);
      expect(
        BdsBusinessLogic.allPropertyTypes.toSet().length,
        BdsBusinessLogic.allPropertyTypes.length,
        reason: 'Không trùng lặp loại BĐS',
      );
    });
  });

  // ================= SO KHỚP TỰ ĐỘNG §11 =================
  group('matchScore / matchPropertiesForBuyer', () {
    test('khớp hoàn hảo đạt điểm cao nhất', () {
      final buyer = _buyer(
        city: 'TP. Hồ Chí Minh',
        district: 'Thủ Đức',
        ward: 'Phường Linh Xuân',
        priceFrom: 2.0,
        priceTo: 3.0,
        areaFrom: 90,
        areaTo: 110,
        type: 'Đất nền',
        direction: 'Đông',
        frontage: 'Hẻm xe hơi',
        legal: 'Sổ đỏ',
      );
      final p = _prop(
        province: 'TP. Hồ Chí Minh',
        district: 'Thủ Đức',
        ward: 'Phường Linh Xuân',
        price: 2.6,
        areaSize: 100,
        type: 'Đất nền',
        direction: 'Đông',
        frontage: 'Hẻm xe hơi',
        legal: 'Sổ đỏ',
      );
      expect(BdsBusinessLogic.matchScore(buyer, p), 100);
    });

    test('lệch hoàn toàn thì 0 điểm', () {
      final buyer = _buyer(city: 'Hà Nội', district: 'Hoàn Kiếm');
      final p = _prop(province: 'TP. Hồ Chí Minh', district: 'Quận 7');
      expect(BdsBusinessLogic.matchScore(buyer, p), 0);
    });

    test('giá ngoài khoảng gần biên được nửa điểm', () {
      final buyer =
          _buyer(priceFrom: 1.5, priceTo: 3.0);
      final inRange = _prop(price: 2.6);
      final slightlyAbove = _prop(price: 3.4); // <= 3*1.2
      final wayAbove = _prop(price: 5.0);
      expect(BdsBusinessLogic.matchScore(buyer, inRange), 25);
      expect(BdsBusinessLogic.matchScore(buyer, slightlyAbove), 12);
      expect(BdsBusinessLogic.matchScore(buyer, wayAbove), 0);
    });

    test('loại cùng nhóm được nửa điểm (§8)', () {
      final buyer = _buyer(type: 'Đất nền');
      final sameCat = _prop(type: 'Đất thổ cư');
      final otherCat = _prop(type: 'Biệt thự');
      expect(BdsBusinessLogic.matchScore(buyer, sameCat), 5);
      expect(BdsBusinessLogic.matchScore(buyer, otherCat), 0);
    });

    test('gợi ý sắp xếp theo % giảm dần + loại BĐS đã bán', () {
      final buyer = _buyer(
        city: 'TP. Hồ Chí Minh',
        district: 'Quận 1',
        priceFrom: 1,
        priceTo: 20,
        areaFrom: 50,
        areaTo: 120,
      );
      final best = _prop(
          code: 'B1',
          province: 'TP. Hồ Chí Minh',
          district: 'Quận 1',
          ward: 'P.Bến Nghé',
          price: 8.0,
          areaSize: 80,
          type: 'Nhà mặt phố',
          direction: 'Tây',
          frontage: 'Góc 2 mặt tiền',
          legal: 'Sổ đỏ');
      final mid = _prop(
          code: 'B2',
          province: 'TP. Hồ Chí Minh',
          district: 'Bình Thạnh',
          price: 9.0,
          areaSize: 80); // 10 TP + 25 giá + 15 DT = 50 điểm
      final soldBest = _prop(
          code: 'B3',
          province: 'TP. Hồ Chí Minh',
          district: 'Quận 1',
          ward: 'P.Bến Nghé',
          price: 8.5,
          areaSize: 85,
          type: 'Nhà mặt phố',
          direction: 'Tây',
          frontage: 'Góc 2 mặt tiền',
          legal: 'Sổ đỏ',
          status: PropertyStatus.sold);

      final results = BdsBusinessLogic.matchPropertiesForBuyer(
          buyer, [mid, best, soldBest]);
      expect(results.map((r) => r.property.propertyCode).toList(),
          ['B1', 'B2'],
          reason: 'BĐS đã bán bị loại, còn lại giảm dần theo %');
      expect(results.first.score >= results.last.score, true);
    });

    test('minScore lọc gợi ý yếu', () {
      final buyer = _buyer(district: 'Quận 1');
      final weak = _prop(district: 'Củ Chi', province: 'TP. Hồ Chí Minh');
      expect(
        BdsBusinessLogic.matchPropertiesForBuyer(buyer, [weak])
            .isEmpty,
        true,
      );
    });
  });

  // ================= MÃ TỰ ĐỘNG =================
  group('sinh mã GD/BĐS/phí', () {
    TransactionRecord tx(String? c) => TransactionRecord()..transactionCode = c;

    test('next mã = max + 1', () {
      expect(
        BdsBusinessLogic.nextTransactionCode([tx('GD0001'), tx('GD0007')]),
        'GD0008',
      );
      expect(
        BdsBusinessLogic.nextTransactionCode([tx(null), tx('abc')]),
        'GD0001',
      );
    });

    test('mã BĐS & phí sàn', () {
      expect(
        BdsBusinessLogic.nextPropertyCode([
          BdsProperty()..propertyCode = 'BDS0012'
        ]),
        'BDS0013',
      );
      expect(
        BdsBusinessLogic.nextFeeCode([]),
        'PFS0001',
      );
    });
  });

  // ================= LUỒNG TRẠNG THÁI §12 =================
  group('luồng trạng thái giao dịch', () {
    test('đúng trình tự đàm phán → cọc → công chứng → hoàn thành', () {
      expect(
        BdsBusinessLogic.canTransition(
            TransactionStatus.negotiating, TransactionStatus.deposited),
        true,
      );
      expect(
        BdsBusinessLogic.canTransition(
            TransactionStatus.deposited, TransactionStatus.notarized),
        true,
      );
      expect(
        BdsBusinessLogic.canTransition(
            TransactionStatus.notarized, TransactionStatus.completed),
        true,
      );
    });

    test('không nhảy cóc', () {
      expect(
        BdsBusinessLogic.canTransition(
            TransactionStatus.negotiating, TransactionStatus.completed),
        false,
      );
      expect(
        BdsBusinessLogic.canTransition(
            TransactionStatus.deposited, TransactionStatus.negotiating),
        false,
      );
    });

    test('hủy được từ mọi trạng thái chưa kết thúc; kết thúc không chuyển nữa', () {
      for (final s in [
        TransactionStatus.negotiating,
        TransactionStatus.deposited,
        TransactionStatus.notarized,
      ]) {
        expect(
          BdsBusinessLogic.canTransition(
              s, TransactionStatus.cancelled),
          true,
        );
      }
      expect(
        BdsBusinessLogic.canTransition(TransactionStatus.completed,
            TransactionStatus.cancelled),
        false,
      );
      expect(
        BdsBusinessLogic.nextStatuses(TransactionStatus.completed),
        isEmpty,
      );
      expect(
        BdsBusinessLogic.nextStatuses(TransactionStatus.cancelled),
        isEmpty,
      );
    });

    test('nextStatuses trả bước kế tiếp + Hủy', () {
      expect(BdsBusinessLogic.nextStatuses(TransactionStatus.negotiating),
          [TransactionStatus.deposited, TransactionStatus.cancelled]);
      expect(BdsBusinessLogic.nextStatuses(TransactionStatus.notarized),
          [TransactionStatus.completed, TransactionStatus.cancelled]);
    });
  });

  // ================= HOA HỒNG §13 =================
  group('hoa hồng môi giới', () {
    TransactionRecord t(double comm,
            {double? rate, double? bonus, double? ded}) =>
        TransactionRecord()
          ..commission = comm
          ..commissionRate = rate
          ..brokerBonus = bonus
          ..brokerDeduction = ded;

    test('thực nhận = base x % + thưởng - khấu trừ', () {
      expect(
        BdsBusinessLogic.brokerNetCommission(t(0.1, rate: 40)),
        closeTo(0.04, 1e-9),
      );
      expect(
        BdsBusinessLogic.brokerNetCommission(
            t(0.1, rate: 40, bonus: 0.01, ded: 0.005)),
        closeTo(0.045, 1e-9),
      );
    });

    test('âm thì kẹp về 0', () {
      expect(
        BdsBusinessLogic.brokerNetCommission(t(0.1, rate: 10, ded: 0.05)),
        0,
      );
    });

    test('công ty giữ phần còn lại', () {
      final x = t(0.1, rate: 40);
      expect(
        BdsBusinessLogic.companyCommissionShare(x) +
            BdsBusinessLogic.brokerNetCommission(x),
        closeTo(0.1, 1e-9),
      );
    });
  });

  // ================= DOANH THU / LỢI NHUẬN =================
  group('profitReport', () {
    late List<TransactionRecord> txs;
    late List<FloorFee> fees;
    final d = DateTime.now();

    setUp(() {
      TransactionRecord mk(
              double fee, double comm, TransactionStatus st) =>
          TransactionRecord()
            ..transactionDate = d
            ..floorFee = fee
            ..commission = comm
            ..status = st;
      txs = [
        mk(0.039, 0.078, TransactionStatus.completed),
        mk(0.065, 0.130, TransactionStatus.completed),
        // Chưa hoàn thành → KHÔNG tính doanh thu.
        mk(0.5, 0.5, TransactionStatus.deposited),
        mk(0.5, 0.5, TransactionStatus.cancelled),
      ];
      FloorFee f(FloorFeeType t, double a) => FloorFee()
        ..feeType = t
        ..amount = a
        ..feeDate = d;
      fees = [
        f(FloorFeeType.transaction, 0.039),
        f(FloorFeeType.advertising, 0.02),
        f(FloorFeeType.service, 0.015),
        f(FloorFeeType.document, 0.005),
        f(FloorFeeType.other, 0.012), // chi
      ];
    });

    test('doanh thu = GD hoàn thành + phí thu; chi phí riêng biệt', () {
      // Gán rate để kiểm tra payout.
      txs[0].commissionRate = 40;
      txs[1].commissionRate = 45;

      final r = BdsBusinessLogic.profitReport(txs, fees);
      expect(r.transactionIncome, closeTo(0.039 + 0.078 + 0.065 + 0.130, 1e-9));
      expect(r.feeIncome, closeTo(0.039 + 0.02 + 0.015 + 0.005, 1e-9));
      expect(r.revenue, closeTo(0.312 + 0.079, 1e-9));
      expect(
          r.brokerPayout,
          closeTo((0.078 * 0.4) + (0.130 * 0.45), 1e-9));
      expect(r.otherExpense, closeTo(0.012, 1e-9));
      // Payout .0312 + .0585 ; chi khác .012
      expect(r.expense, closeTo(0.0897 + 0.012, 1e-9));
      expect(r.profit, closeTo(r.revenue - r.expense, 1e-9));
    });

    test('GD hủy/chưa chốt không tạo doanh thu', () {
      final r = BdsBusinessLogic.profitReport(txs.sublist(2), []);
      expect(r.revenue, 0);
      expect(r.profit, 0);
    });
  });

  group('monthlyTransactionReport & monthlySalesSeries', () {
    test('đếm tổng/thành công/hủy đúng tháng', () {
      final now = DateTime.now();
      TransactionRecord mk(int day, double v, TransactionStatus st) =>
          TransactionRecord()
            ..transactionDate = DateTime(now.year, now.month, day)
            ..finalPrice = v
            ..status = st;
      final txs = [
        mk(1, 2.0, TransactionStatus.completed),
        mk(2, 3.0, TransactionStatus.deposited),
        mk(3, 1.0, TransactionStatus.cancelled),
      ];
      final r = BdsBusinessLogic.monthlyTransactionReport(
          txs, now.year, now.month);
      expect(r.total, 3);
      expect(r.successCount, 1);
      expect(r.cancelledCount, 1);
      expect(r.totalValue, closeTo(5.0, 1e-9),
          reason: 'Giá trị không tính GD hủy');
    });

    test('series 12 tháng, bỏ GD hủy', () {
      TransactionRecord mk(int month, double v, TransactionStatus st) =>
          TransactionRecord()
            ..transactionDate = DateTime(2026, month, 15)
            ..finalPrice = v
            ..status = st;
      final series = BdsBusinessLogic.monthlySalesSeries([
        mk(1, 1.0, TransactionStatus.completed),
        mk(1, 0.5, TransactionStatus.deposited),
        mk(1, 99.0, TransactionStatus.cancelled),
        mk(12, 2.0, TransactionStatus.notarized),
      ], 2026);
      expect(series.length, 12);
      expect(series[0], closeTo(1.5, 1e-9));
      expect(series[11], closeTo(2.0, 1e-9));
      expect(series[5], 0);
    });
  });

  // ================= XẾP HẠNG MÔI GIỚI =================
  group('brokerRankings (KPI)', () {
    test('chỉ đếm GD hoàn thành của đúng MG, xếp giảm dần KPI', () {
      final b1 = Broker()
        ..remoteId = 'MB1'
        ..fullName = 'Một';
      final b2 = Broker()
        ..remoteId = 'MB2'
        ..fullName = 'Hai';

      TransactionRecord tx(String brokerId, double price, double comm,
              {required bool completed}) =>
          TransactionRecord()
            ..brokerId = brokerId
            ..finalPrice = price
            ..commission = comm
            ..commissionRate = 100
            ..status = completed
                ? TransactionStatus.completed
                : TransactionStatus.deposited;

      final rankings = BdsBusinessLogic.brokerRankings([
        b1,
        b2,
      ], [
        tx('MB1', 2.0, 0.1, completed: true),
        tx('MB2', 10.0, 0.5, completed: true),
        tx('MB2', 5.0, 0.2, completed: false), // bỏ qua
        tx('MB1', 3.0, 0.1, completed: true),
      ]);

      expect(rankings.length, 2);
      // MB2: 1x10 + 10x2 + 0.5x5 = 32.5 ; MB1: 2x10 + 5x2 + 0.2x5 = 31
      expect(rankings.first.broker.remoteId, 'MB2');
      expect(rankings.first.kpiScore, closeTo(32.5, 1e-9));
      expect(rankings.last.kpiScore, closeTo(31.0, 1e-9));
    });
  });

  // ================= DASHBOARD §4.1 =================
  group('dashboardMetrics', () {
    test('đủ 9 chỉ số, đếm GD hôm nay/tháng, doanh thu gồm phí sàn', () {
      final now = DateTime.now();
      final props = [
        _prop(status: PropertyStatus.sold),
        _prop(status: PropertyStatus.available),
        BdsProperty()
          ..deletedAt = DateTime.now(), // đã xóa mềm → không đếm
      ];
      final customers = [
        Customer()..type = CustomerType.buyer,
        Customer()..type = CustomerType.buyer,
        Customer()..type = CustomerType.seller,
        Customer()..deletedAt = DateTime.now()..type = CustomerType.seller,
      ];
      TransactionRecord tx(DateTime? dt, double fee, double comm,
              {TransactionStatus st = TransactionStatus.completed}) =>
          TransactionRecord()
            ..transactionDate = dt
            ..floorFee = fee
            ..commission = comm
            ..status = st;
      final txs = [
        tx(now, 0.1, 0.2), // hôm nay
        tx(now.subtract(const Duration(days: 1)), 0.1, 0.2), // tháng này
        tx(DateTime(now.year, now.month - 1, 5), 0.1, 0.2), // tháng trước
        tx(now, 0.5, 0.5, st: TransactionStatus.cancelled), // không tính
      ];
      final fees = [
        FloorFee()
          ..feeDate = now
          ..amount = 0.03
          ..feeType = FloorFeeType.advertising,
        FloorFee()
          ..feeDate = now
          ..amount = 0.07
          ..feeType = FloorFeeType.other,
      ];

      final m = BdsBusinessLogic.dashboardMetrics(
          properties: props,
          customers: customers,
          transactions: txs,
          fees: fees,
          now: now);

      expect(m['totalProperties'], 2);
      expect(m['totalBuyers'], 2);
      expect(m['totalSellers'], 1);
      expect(m['todayTransactions'], 1);
      expect(m['monthTransactions'], 2);
      // Doanh thu = (0.1+0.2)*3 hoàn thành + phí quảng cáo 0.03 = 0.93
      expect(m['revenue'], closeTo(0.93, 1e-9));
      expect(m['commission'], closeTo(0.6, 1e-9));
      expect(m['floorFee'], closeTo(0.3, 1e-9));
      // Lợi nhuận = doanh thu 0.93 - chi phí (chi khác 0.07 + trả MG 0 vì rate=0)
      expect(m['profit'], closeTo(0.86, 1e-9));
    });
  });

  // ================= BÁO CÁO KHÁCH HÀNG =================
  group('customerReport', () {
    test('mới tháng này / đang GD / VIP', () {
      final now = DateTime.now();
      final buyers = [
        Customer()
          ..type = CustomerType.buyer
          ..remoteId = 'K1'
          ..updatedAt = now
          ..isVip = true,
        Customer()
          ..type = CustomerType.buyer
          ..remoteId = 'K2'
          ..updatedAt = DateTime(now.year, now.month - 1, 1),
        Customer()
          ..type = CustomerType.seller
          ..remoteId = 'K3'
          ..updatedAt = now
          ..isVip = true,
      ];
      final txs = [
        TransactionRecord()
          ..buyerId = 'K1'
          ..status = TransactionStatus.negotiating
          ..transactionDate = now,
        TransactionRecord()
          ..buyerId = 'K2'
          ..status = TransactionStatus.completed
          ..transactionDate = now,
      ];
      final r = BdsBusinessLogic.customerReport(buyers, txs, now: now);
      expect(r.newBuyersThisMonth, 1);
      expect(r.newSellersThisMonth, 1);
      expect(r.buyersInTransaction, 1);
      expect(r.vipCount, 2);
    });
  });

  // ================= ĐỊNH DẠNG TIỀN =================
  group('formatMoney', () {
    test('tỷ và triệu', () {
      expect(BdsBusinessLogic.formatMoney(2.6), '2.6 tỷ');
      expect(BdsBusinessLogic.formatMoney(8), '8 tỷ');
      expect(BdsBusinessLogic.formatMoney(0.15), '150 triệu');
      expect(BdsBusinessLogic.formatMoney(null), '-');
    });
  });
}
