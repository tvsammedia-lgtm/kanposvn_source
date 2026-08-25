import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnxeom/models/booking.dart';
import 'package:kanposvn/modules/kanposvnxeom/models/customer.dart';
import 'package:kanposvn/modules/kanposvnxeom/models/driver.dart';
import 'package:kanposvn/modules/kanposvnxeom/models/ops_models.dart';
import 'package:kanposvn/modules/kanposvnxeom/models/payment.dart';
import 'package:kanposvn/modules/kanposvnxeom/models/payment.dart' as pay;
import 'package:kanposvn/modules/kanposvnxeom/models/vehicle.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
import 'package:kanposvn/modules/kanposvnxeom/providers/xeom_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnxeom/services/xeom_business_logic.dart';
import 'package:kanposvn/modules/kanposvnxeom/services/xeom_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// Stub path_provider để mở Isar trong môi trường test.
class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late Isar db;
  late List<XeOmTariff> tariffs;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('xeom_logic_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    db = await XeOmDatabaseSetup.init();
    await XeOmSeedData.seedIfEmpty(db);
    tariffs = await db.xeOmTariffs.where().findAll();
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('Seed dữ liệu mẫu theo kanxeom.md', () {
    test('§6 Tài xế đủ trạng thái + GPLX sắp hết hạn', () async {
      final drivers = await db.xeOmDrivers.where().findAll();
      expect(drivers.length, 5);
      expect(drivers.any((d) => d.status == DriverStatus.online), isTrue);
      expect(drivers.any((d) => d.status == DriverStatus.busy), isTrue);
      expect(drivers.any((d) => d.status == DriverStatus.offline), isTrue);
      expect(drivers.any((d) => d.status == DriverStatus.suspended), isTrue);
    });
    test('§7 Xe đủ 5 loại, có xe hết bảo hiểm/bảo dưỡng', () async {
      final vehicles = await db.xeOmVehicles.where().findAll();
      expect(vehicles.map((v) => v.type.name).toSet().length, 5);
      expect(
          vehicles.any((v) =>
              v.insuranceExpiry != null && v.insuranceExpiry!.isBefore(DateTime.now())),
          isTrue);
      expect(vehicles.any((v) => v.status == VehicleStatus.maintenance), isTrue);
    });
    test('§13 Bảng giá 6 loại xe + §14 3 loại khuyến mãi', () async {
      expect(await db.xeOmTariffs.count(), 6);
      final promos = await db.xeOmPromotions.where().findAll();
      expect(promos.map((p) => p.type).toSet(),
          containsAll(['percent', 'fixedAmount', 'freeFirstKm']));
    });
    test('§9 Chuyến seed: hoàn thành + đang chạy + đã hủy', () async {
      expect(
          await db.xeOmBookings
              .filter()
              .statusEqualTo(BookingStatus.completed)
              .count(),
          39); // 13 ngày x 3 chuyến
      expect(
          await db.xeOmBookings
              .filter()
              .statusEqualTo(BookingStatus.inProgress)
              .count(),
          2);
      expect(
          await db.xeOmBookings
              .filter()
              .statusEqualTo(BookingStatus.cancelled)
              .count(),
          3);
    });
    test('§18 Chi phí 7 nhóm', () async {
      final exps = await db.xeOmExpenses.where().findAll();
      expect(exps.map((e) => e.category).toSet().length, 7);
    });
  });

  group('§13-14. Giá cước & khuyến mãi', () {
    test('Xe ôm 5km giờ thường: 10k + 20k = 30k', () {
      final wed10h = DateTime(2026, 8, 19, 10); // ngoài giờ cao điểm
      final q = XeOmBusinessLogic.quoteFare(
        tariff: tariffs.firstWhere((t) => t.vehicleType == 'motorbike'),
        distanceKm: 5,
        at: wed10h,
      );
      expect(q.baseFare, 10000);
      expect(q.distanceFare, 20000);
      expect(q.total, 30000);
    });

    test('Giờ cao điểm 17h: cộng phụ phí 20% trên tiền km', () {
      final wed17h30 = DateTime(2026, 8, 19, 17, 30);
      final q = XeOmBusinessLogic.quoteFare(
        tariff: tariffs.firstWhere((t) => t.vehicleType == 'motorbike'),
        distanceKm: 5,
        at: wed17h30,
      );
      expect(q.peakExtra, closeTo(4000, 0.01)); // 20% x 20k
      expect(q.total, closeTo(34000, 0.01));
    });

    test('Sân bay taxi 4 chỗ: cộng phụ phí 40k', () {
      final q = XeOmBusinessLogic.quoteFare(
        tariff: tariffs.firstWhere((t) => t.vehicleType == 'taxi4Seats'),
        distanceKm: 8,
        isAirportTrip: true,
        at: DateTime(2026, 8, 19, 10),
      );
      expect(q.airportSurcharge, 40000);
    });

    test('Ngày lễ: cộng phụ phí lễ', () {
      final q = XeOmBusinessLogic.quoteFare(
        tariff: tariffs.firstWhere((t) => t.vehicleType == 'motorbike'),
        distanceKm: 5,
        isHoliday: true,
        at: DateTime(2026, 8, 19, 10),
      );
      expect(q.holidaySurcharge, 10000);
    });

    test('Voucher giảm 20% tối đa 30k (SALE20)', () {
      final promo =
          XeOmPromotion()
            ..code = 'T'
            ..type = 'percent'
            ..value = 20
            ..maxDiscount = 30000
            ..active = true;
      // Đơn 100k -> giảm 20k (dưới trần).
      final q1 = XeOmBusinessLogic.quoteFare(
        tariff: tariffs.firstWhere((t) => t.vehicleType == 'taxi4Seats'),
        distanceKm: 6.67,
        at: DateTime(2026, 8, 19, 10),
        promotion: promo,
      );
      expect(q1.discount, lessThan(30000));
      // Đơn lớn -> chặn trần 30k.
      final q2 = XeOmBusinessLogic.quoteFare(
        tariff: tariffs.firstWhere((t) => t.vehicleType == 'taxi4Seats'),
        distanceKm: 50,
        at: DateTime(2026, 8, 19, 10),
        promotion: promo,
      );
      expect(q2.discount, 30000);
    });

    test('Voucher FREE2KM miễn phí km đầu', () {
      final promo = XeOmPromotion()
        ..code = 'FREE2KM'
        ..type = 'freeFirstKm'
        ..value = 2
        ..active = true;
      final q = XeOmBusinessLogic.quoteFare(
        tariff: tariffs.firstWhere((t) => t.vehicleType == 'motorbike'),
        distanceKm: 5,
        at: DateTime(2026, 8, 19, 10),
        promotion: promo,
      );
      // Trừ đúng 2km x 4k = 8k.
      expect(q.discount, closeTo(8000, 0.01));
      expect(q.distanceFare, closeTo(12000, 0.01));
    });
  });

  group('§9-10. Luồng chuyến & phân quyền điều hành', () {
    test('Tạo chuyến: searchingDriver + giá theo bảng + đếm voucher',
        () async {
      final cust =
          await db.xeOmCustomers.filter().uuidEqualTo('kh_mai').findFirst();
      final usageBefore = await db.xeOmPromotions
          .filter()
          .codeEqualTo('GIAM20K')
          .findFirst();
      final count0 = usageBefore!.usageCount;

      final b = await XeOmBusinessLogic.createBooking(db,
          customer: cust!,
          pickupAddress: 'Q1',
          dropoffAddress: 'Q7',
          distanceKm: 9,
          vehicleType: 'taxi4Seats',
          tariffs: tariffs,
          promotionCode: 'GIAM20K',
          at: DateTime.now());
      expect(b.status, BookingStatus.searchingDriver);
      expect(b.price!, greaterThan(0));
      expect(b.discount, greaterThan(0));
      final usageAfter =
          await db.xeOmPromotions.filter().codeEqualTo('GIAM20K').findFirst();
      expect(usageAfter!.usageCount, count0 + 1);
    });

    test('Điều xe gán tài xế rồi đi đủ luồng §10 tới hoàn thành', () async {
      final cust =
          await db.xeOmCustomers.filter().uuidEqualTo('kh_cuong').findFirst();
      final driver =
          await db.xeOmDrivers.filter().uuidEqualTo('tx_minh').findFirst();
      final vehicle =
          await db.xeOmVehicles.filter().uuidEqualTo('vh_innova').findFirst();

      var b = await XeOmBusinessLogic.createBooking(db,
          customer: cust!,
          pickupAddress: 'A',
          dropoffAddress: 'B',
          distanceKm: 7,
          vehicleType: 'taxi7Seats',
          tariffs: tariffs);
      await XeOmBusinessLogic.assignDriver(db, b.uuid!, driver!, vehicle!);

      for (final expected in [
        BookingStatus.driverAccepted,
        BookingStatus.driverArriving, // §10: Đang đến
        BookingStatus.pickedUp,
        BookingStatus.inProgress,
        BookingStatus.completed,
      ]) {
        b = await XeOmBusinessLogic.advanceStatus(db, b.uuid!);
        expect(b.status, expected);
      }
      // Tài xế busy khi nhận -> online lại khi xong.
      final dAfter =
          await db.xeOmDrivers.filter().uuidEqualTo('tx_minh').findFirst();
      expect(dAfter!.status, DriverStatus.online);
      // Thanh toán tự sinh, hoa hồng 20%.
      final p = await db.xeOmPayments
          .filter()
          .bookingUuidEqualTo(b.uuid)
          .findFirst();
      expect(p!.amount, b.price);
      expect(p.driverCommission,
          closeTo((b.price ?? 0) * 0.20, 0.01));
      // Khách được cập nhật lượt + doanh thu.
      final cAfter =
          await db.xeOmCustomers.filter().uuidEqualTo('kh_cuong').findFirst();
      expect(cAfter!.totalBookings, greaterThanOrEqualTo(1));
    });

    test('Không gán tài xế đang bận / xe bảo dưỡng / sai loại xe', () async {
      final cust =
          await db.xeOmCustomers.filter().uuidEqualTo('kh_my').findFirst();
      final busyDriver =
          await db.xeOmDrivers.filter().uuidEqualTo('tx_lan').findFirst(); // busy
      final maintVehicle =
          await db.xeOmVehicles.filter().uuidEqualTo('vh_truck').findFirst();
      final wrongTypeVehicle =
          await db.xeOmVehicles.filter().uuidEqualTo('vh_wave').findFirst();

      var b = await XeOmBusinessLogic.createBooking(db,
          customer: cust!,
          pickupAddress: 'A',
          dropoffAddress: 'B',
          distanceKm: 3,
          vehicleType: 'taxi7Seats',
          tariffs: tariffs);
      expect(
        () => XeOmBusinessLogic.assignDriver(db, b.uuid!, busyDriver!, maintVehicle!),
        throwsException,
      );
      expect(
        () => XeOmBusinessLogic.assignDriver(db, b.uuid!, busyDriver!, wrongTypeVehicle!),
        throwsException,
      );
      await XeOmBusinessLogic.cancelBooking(db, b.uuid!, reason: 'test');
    });

    test('Hủy chuyến -> tài xế trả về online + tính tỷ lệ hủy §19', () async {
      final cust =
          await db.xeOmCustomers.filter().uuidEqualTo('kh_mai').findFirst();
      final driver =
          await db.xeOmDrivers.filter().uuidEqualTo('tx_hung').findFirst();
      final vehicle =
          await db.xeOmVehicles.filter().uuidEqualTo('vh_vios').findFirst();
      var b = await XeOmBusinessLogic.createBooking(db,
          customer: cust!,
          pickupAddress: 'A',
          dropoffAddress: 'B',
          distanceKm: 5,
          vehicleType: 'taxi4Seats',
          tariffs: tariffs);
      await XeOmBusinessLogic.assignDriver(db, b.uuid!, driver!, vehicle!);
      await XeOmBusinessLogic.advanceStatus(db, b.uuid!); // accepted -> busy
      await XeOmBusinessLogic.cancelBooking(db, b.uuid!, reason: 'Khách hủy');

      final dAfter =
          await db.xeOmDrivers.filter().uuidEqualTo('tx_hung').findFirst();
      expect(dAfter!.status, DriverStatus.online);

      // Không advance tiếp được trên chuyến hủy.
      expect(() => XeOmBusinessLogic.advanceStatus(db, b.uuid!),
          throwsException);
    });
  });

  group('§12+15+16. Thanh toán / công nợ / hoa hồng', () {
    test('Chuyến công nợ (doanh nghiệp): payment pending + nợ ghi nhận',
        () async {
      final cust = await db.xeOmCustomers
          .filter()
          .uuidEqualTo('kh_doanhnghiep')
          .findFirst();
      final revenueBefore = cust!.totalRevenue;

      var b = await XeOmBusinessLogic.createBooking(db,
          customer: cust,
          pickupAddress: 'KCNC',
          dropoffAddress: 'Q1',
          distanceKm: 12,
          vehicleType: 'taxi4Seats',
          paymentMethod: PaymentMethod.debt,
          tariffs: tariffs);
      for (int i = 0; i < 5 && b.status != BookingStatus.completed; i++) {
        b = await XeOmBusinessLogic.advanceStatus(db, b.uuid!);
      }

      final debt = await XeOmBusinessLogic.customerOutstandingDebt(
          db, 'kh_doanhnghiep');
      expect(debt, greaterThan(0));
      expect(b.debtAmount, debt);

      // Thu nợ -> completed + doanh số khách tăng.
      final collected = await XeOmBusinessLogic.collectDebt(
          db, 'kh_doanhnghiep');
      expect(collected, debt);
      expect(
          await XeOmBusinessLogic.customerOutstandingDebt(db, 'kh_doanhnghiep'),
          0);
      final cAfter = await db.xeOmCustomers
          .filter()
          .uuidEqualTo('kh_doanhnghiep')
          .findFirst();
      expect(cAfter!.totalRevenue, greaterThan(revenueBefore));
    });

    test('Điểm thưởng: 10.000đ = 1 điểm', () async {
      final pointsBefore =
          (await db.xeOmCustomers.filter().uuidEqualTo('kh_my').findFirst())!
              .rewardPoints;
      final myCust =
          await db.xeOmCustomers.filter().uuidEqualTo('kh_my').findFirst();
      var b = await XeOmBusinessLogic.createBooking(db,
          customer: myCust!,
          pickupAddress: 'A',
          dropoffAddress: 'B',
          distanceKm: 3,
          vehicleType: 'motorbike', // ~22k -> 2 điểm
          tariffs: tariffs);
      for (int i = 0; i < 5 && b.status != BookingStatus.completed; i++) {
        b = await XeOmBusinessLogic.advanceStatus(db, b.uuid!);
      }
      final after =
          (await db.xeOmCustomers.filter().uuidEqualTo('kh_my').findFirst())!;
      expect(after.rewardPoints - pointsBefore, greaterThanOrEqualTo(1));
    });
  });

  group('§17+§19. Doanh thu & báo cáo', () {
    final from = DateTime(2020);
    final to = DateTime(2100);

    test('Doanh thu nhóm theo tài xế/loại xe/tuyến/ngày', () async {
      final rev = await XeOmBusinessLogic.revenueReport(db, from, to);
      expect(rev['revenue'], greaterThan(0));
      final byDriver = rev['byDriver'] as Map<String, double>;
      expect(byDriver.keys.toSet(), containsAll(['tx_tuan', 'tx_hung']));
      final byType = rev['byVehicleType'] as Map<String, double>;
      expect(byType.containsKey('motorbike'), isTrue);
      final byRoute = rev['byRoute'] as Map<String, double>;
      expect(byRoute.isNotEmpty, isTrue);
    });

    test('Chi phí + lợi nhuận = doanh thu - chi phí', () async {
      final s = await XeOmBusinessLogic.summaryReport(db, from, to);
      expect(s['expense'], greaterThan(0));
      expect(s['profit'],
          (s['revenue'] as double) - (s['expense'] as double));
      final byCat = s['expenseByCategory'] as Map<String, double>;
      expect(byCat.containsKey('FUEL'), isTrue);
      expect(byCat.containsKey('SALARY'), isTrue);
    });

    test('Tỷ lệ hủy > 0 và top khách hàng có Công Ty ABC', () async {
      final s = await XeOmBusinessLogic.summaryReport(db, from, to);
      expect(s['cancelRatePercent'], greaterThan(0));
      final topCus = (s['topCustomers'] as List).cast<Map>();
      expect(topCus.first['name'].toString(), contains('ABC'));
    });
  });

  group('§5. Dashboard', () {
    test('Đủ chỉ số hôm nay/tháng/hoa hồng/tài xế online', () async {
      final d = await XeOmBusinessLogic.dashboardSummary(db);
      expect(d['totalBookingsToday'], greaterThanOrEqualTo(0));
      expect(d['runningBookings'], greaterThanOrEqualTo(2)); // 2 chuyến seed
      expect(d['driversOnline'], greaterThanOrEqualTo(1));
      expect(d['revenueMonth'], greaterThan(0));
      expect(d['commissionMonth'], greaterThan(0));
    });
  });

  group('XXXI. Sao lưu', () {
    test('Module Xe Ôm đăng ký backup chung (CRM)', () {
      final registered =
          ModuleBackupService.modules.any((m) => m.id == 'xeom');
      expect(registered, isTrue);
    });
  });
}
