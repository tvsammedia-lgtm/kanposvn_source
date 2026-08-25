import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_booking.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_driver.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_ops_models.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_transaction.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_trip.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_user.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_vehicle_type.dart';
import 'package:kanposvn/modules/kanposvnride/providers/ride_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnride/services/ride_business_logic.dart';
import 'package:kanposvn/modules/kanposvnride/services/ride_seed_data.dart';
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
  late List<KanRideVehicleType> types;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('ride_logic_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    db = await RideDatabaseSetup.init();
    await RideSeedData.seedIfEmpty(db);
    types = await db.kanRideVehicleTypes.where().findAll();
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  KanRideVehicleType vt(String id) =>
      types.firstWhere((t) => t.vehicleTypeId == id);

  group('Seed dữ liệu mẫu theo kanposvnride.md', () {
    test('§7+§14 Loại xe & bảng giá', () async {
      expect(types.length, 5);
      final moto = vt('motorBike');
      expect(moto.baseFare, 10000);
      expect(moto.pricePerKm, 3500);
    });
    test('§18 Khuyến mãi đủ 3 loại', () async {
      final promos = await db.kanRidePromotions.where().findAll();
      expect(promos.map((p) => p.type).toSet(),
          containsAll(['percent', 'fixedAmount', 'freeFirstRide']));
    });
    test('§3 Người dùng + tài xế + trạng thái đa dạng', () async {
      expect(await db.rideUsers.count(), 4);
      expect(
          (await db.rideUsers.filter().statusEqualTo(UserStatus.blocked).count()),
          1); // §33 blacklist
      expect(await db.rideDrivers.count(), 5);
      expect(
          (await db.rideDrivers.filter().statusEqualTo(DriverStatus.online).count()),
          greaterThanOrEqualTo(2));
      expect((await db.rideDrivers.filter().statusEqualTo(DriverStatus.busy).count()), 1);
    });
    test('§24 Chuyến seed: hoàn thành + hủy + đang chờ', () async {
      expect(
          (await db.rideBookings.filter().statusEqualTo(BookingStatus.completed).count()),
          greaterThanOrEqualTo(40)); // 14 ngày x ~3 chuyến
      expect(
          (await db.rideBookings.filter().statusEqualTo(BookingStatus.cancelled).count()),
          3);
      expect(
          (await db.rideBookings.filter().statusEqualTo(BookingStatus.findingDriver).count()),
          1);
    });
  });

  group('§14+§30. Giá cước & giá động', () {
    test('Xe máy 6km giờ thường: 10k + 21k = 31k', () {
      final q = RideBusinessLogic.quoteFare(
        type: vt('motorBike'),
        distanceKm: 6,
      );
      // Không dùng surge mặc định.
      expect(q.baseFare, 10000);
      expect(q.distanceFare, 21000);
      expect(q.total, 31000);
    });

    test('Mưa + cao điểm: surge 1.5x', () {
      final normal = RideBusinessLogic.quoteFare(
        type: vt('car4Seats'), distanceKm: 10,
      );
      final storm = RideBusinessLogic.quoteFare(
        type: vt('car4Seats'),
        distanceKm: 10,
        isRaining: true,
        isRushHour: true,
      );
      expect(storm.surgeMultiplier, 1.5);
      expect(storm.total, closeTo(normal.baseFare * 1.5 + normal.distanceFare * 1.5, 0.01));
    });

    test('Ngày lễ surge 1.25', () {
      final q = RideBusinessLogic.quoteFare(
        type: vt('motorBike'),
        distanceKm: 5,
        isHoliday: true,
      );
      expect(q.surgeMultiplier, 1.25);
    });

    test('Phụ phí cầu đường + sân bay cộng vào cuối', () {
      final q = RideBusinessLogic.quoteFare(
        type: vt('car4Seats'),
        distanceKm: 8,
        bridgeToll: 15000,
        airportSurcharge: 40000,
      );
      expect(q.surcharge, 55000);
      expect(q.total, (22000 + 92000) + 55000);
    });

    test('Ghép chuyến §12 giảm 20%', () {
      final solo = RideBusinessLogic.quoteFare(type: vt('motorBike'), distanceKm: 8);
      final shared = RideBusinessLogic.quoteFare(
          type: vt('motorBike'), distanceKm: 8, isSharedRide: true);
      expect(shared.sharedDiscount, closeTo(solo.total * 0.20 * 100 / 100 / 0.8 * 0.8, 0.01));
      expect(shared.total, lessThan(solo.total));
    });

    test('Voucher KAN20 giảm 20% chặn trần 25k', () {
      final promo =
          KanRidePromotion()
            ..code = 'X'
            ..type = 'percent'
            ..value = 20
            ..maxDiscount = 25000
            ..minFare = 40000
            ..active = true;
      final small = RideBusinessLogic.quoteFare(
          type: vt('motorBike'), distanceKm: 12, promotion: promo);
      expect(small.promoDiscount, lessThanOrEqualTo(25000));
      final big = RideBusinessLogic.quoteFare(
          type: vt('car4Seats'), distanceKm: 30, promotion: promo);
      expect(big.promoDiscount, 25000); // chạm trần
    });
  });

  group('§13+§9-10. Điều xe & luồng đặt xe', () {
    test('Tìm xe gần nhất trong tài xế online đúng loại xe', () async {
      // Q1 (10.776,106.700) -> drv_son gần nhất loại motorBike.
      final d = await RideBusinessLogic.findNearestDriver(db,
          pickupLat: 10.776,
          pickupLng: 106.700,
          vehicleType: VehicleType.motorBike);
      expect(d!.uuid, 'drv_son');
      // Không có tài xế online loại delivery.
      final none = await RideBusinessLogic.findNearestDriver(db,
          pickupLat: 10.78, pickupLng: 106.7, vehicleType: VehicleType.delivery);
      expect(none, isNull);
    });

    test('Đặt xe -> findingDriver + giá ước tính đúng bảng giá', () async {
      final user = await db.rideUsers.filter().uuidEqualTo('user_hoa').findFirst();
      final b = await RideBusinessLogic.createBooking(db,
          passenger: user!,
          pickupAddress: 'Q1',
          pickupLat: 10.78,
          pickupLng: 106.70,
          dropoffAddress: 'Q7',
          dropoffLat: 10.73,
          dropoffLng: 106.72,
          distanceKm: 6,
          vehicleType: VehicleType.motorBike,
          types: types);
      expect(b.status, BookingStatus.findingDriver);
      expect(b.finalPrice, 31000);
      // Dọn state để dashboard đếm đúng đơn chờ.
      await RideBusinessLogic.cancelBooking(db, b.uuid!, reason: 'dọn');
    });

    test('Đủ luồng accepted → arrived → inProgress → completed', () async {
      final user = await db.rideUsers.filter().uuidEqualTo('user_binh').findFirst();
      var b = await RideBusinessLogic.createBooking(db,
          passenger: user!,
          pickupAddress: 'A',
          pickupLat: 10.79,
          pickupLng: 106.71,
          dropoffAddress: 'B',
          dropoffLat: 10.80,
          dropoffLng: 106.73,
          distanceKm: 5,
          vehicleType: VehicleType.motorBike, // 27.5k < ví 50k
          paymentMethod: 'wallet',
          types: types);
      final driver =
          await RideBusinessLogic.findNearestDriver(db,
              pickupLat: 10.79,
              pickupLng: 106.71,
              vehicleType: VehicleType.motorBike);
      await XeOmAssignShim.assign(db, b, driver!);

      for (final expected in [
        BookingStatus.arrived,
        BookingStatus.inProgress,
        BookingStatus.completed,
      ]) {
        b = await RideBusinessLogic.advanceStatus(db, b.uuid!);
        expect(b.status, expected);
      }

      // Ví khách bị trừ tiền, có transaction payment âm.
      final uAfter =
          await db.rideUsers.filter().uuidEqualTo('user_binh').findFirst();
      expect(uAfter!.walletBalance, lessThan(50000));
      final payTx = await db.rideTransactions
          .filter()
          .userUuidEqualTo('user_binh')
          .typeEqualTo(TransactionType.payment)
          .sortByCreatedAtDesc()
          .findFirst();
      expect(payTx, isNotNull);
      expect(payTx!.amount, lessThan(0));

      // Trip ghi nhận hoàn thành + hoa hồng 15%.
      final trip = await db.kanRideTrips.filter().bookingIdEqualTo(b.uuid!).findFirst();
      expect(trip, isNotNull);
      expect(trip!.finalPrice, b.finalPrice);
      expect(b.commission, closeTo(b.finalPrice * 0.15, 0.01));
      expect(b.driverEarnings, closeTo(b.finalPrice * 0.85, 0.01));

      // Tài xế busy -> online sau khi xong.
      final dAfter =
          await db.rideDrivers.filter().uuidEqualTo(driver.uuid).findFirst();
      expect(dAfter!.status, DriverStatus.online);
    });

    test('Hủy chuyến trả tài xế về online', () async {
      final user = await db.rideUsers.filter().uuidEqualTo('user_giang').findFirst();
      var b = await RideBusinessLogic.createBooking(db,
          passenger: user!,
          pickupAddress: 'P',
          pickupLat: 10.78,
          pickupLng: 106.70,
          dropoffAddress: 'D',
          dropoffLat: 10.81,
          dropoffLng: 106.74,
          distanceKm: 4,
          vehicleType: VehicleType.motorBike,
          types: types);
      final driver = await RideBusinessLogic.findNearestDriver(db,
          pickupLat: 10.78, pickupLng: 106.70, vehicleType: VehicleType.motorBike);
      await XeOmAssignShim.assign(db, b, driver!);
      await RideBusinessLogic.cancelBooking(db, b.uuid!, reason: 'đổi ý');
      final dAfter =
          await db.rideDrivers.filter().uuidEqualTo(driver.uuid).findFirst();
      expect(dAfter!.status, DriverStatus.online);
      expect(() => RideBusinessLogic.advanceStatus(db, b.uuid!),
          throwsException);
    });
  });

  group('§16-17+§19-20. Ví / rút tiền / giới thiệu / đánh giá', () {
    test('Rút tiền ví tài xế: trừ đúng số dư + tạo giao dịch withdraw', () async {
      final d = await db.rideDrivers.filter().uuidEqualTo('drv_quang').findFirst();
      final before = d!.driverWalletBalance;
      final balanceAfter =
          await RideBusinessLogic.driverWithdraw(db, 'drv_quang', 200000);
      expect(balanceAfter, before - 200000);
      final wd = await db.rideTransactions
          .filter()
          .userUuidEqualTo('drv_quang')
          .sortByCreatedAtDesc()
          .findFirst();
      expect(wd!.type, TransactionType.withdraw);
      expect(() => RideBusinessLogic.driverWithdraw(db, 'drv_quang', 999999999),
          throwsException);
    });

    test('Giới thiệu bạn bè §19: cả hai bên được thưởng', () async {
      final newUser = RideUser()
        ..uuid = 'user_new_ref'
        ..fullName = 'Người mới'
        ..phone = '0933000999'
        ..referralCode = 'REF-NEW99'
        ..createdAt = DateTime.now();
      await db.writeTxn(() async => db.rideUsers.put(newUser));

      await RideBusinessLogic.applyReferral(db, newUser, 'REF-HOA01');

      expect(newUser.walletBalance, 30000);
      final inviterAfter =
          await db.rideUsers.filter().uuidEqualTo('user_hoa').findFirst();
      expect(inviterAfter!.walletBalance, 150000 + 30000);
      expect(inviterAfter.rewardPoints, 60 + 300);
    });

    test('Đánh giá §20: cập nhật averageRating của tài xế', () async {
      await RideBusinessLogic.submitRating(db,
          bookingUuid: 'rb_seed_1', stars: 1, comment: 'Chậm', isComplaint: true);
      final rating = await db.rideRatings
          .filter()
          .bookingUuidEqualTo('rb_seed_1')
          .findFirst();
      expect(rating!.stars, 1);
      final b = await db.rideBookings.filter().uuidEqualTo('rb_seed_1').findFirst();
      final d = await db.rideDrivers.filter().uuidEqualTo(b!.driverUuid!).findFirst();
      expect(d!.averageRating, lessThan(4.8)); // đã hạ trung bình
      expect(() => RideBusinessLogic.submitRating(db, bookingUuid: 'rb_seed_2', stars: 9),
          throwsException);
    });
  });

  group('§24-28. Báo cáo & Dashboard', () {
    final from = DateTime(2020);
    final to = DateTime(2100);

    test('Báo cáo tài chính §27: hoa hồng/lãi/doanh thu/khuyến mãi', () async {
      final r = await RideBusinessLogic.report(db, from, to);
      expect(r['revenue'], greaterThan(0));
      expect(r['commission'], closeTo((r['revenue'] as double) * 0.15, 1));
      expect(r['profit'],
          (r['commission'] as double) - (r['promoCost'] as double));
      final byDay = r['byDay'] as Map<String, double>;
      expect(byDay.isNotEmpty, isTrue);
    });

    test('Báo cáo khách §25 + báo cáo tài xế §26', () async {
      final cr =
          await RideBusinessLogic.customerReport(db, 'user_hoa', from, to);
      expect(cr['tripCount'], greaterThanOrEqualTo(1));
      expect(cr['spend'], greaterThan(0));
      expect(cr['points'], greaterThanOrEqualTo(60)); // 60 seed + thưởng giới thiệu

      final dr =
          await RideBusinessLogic.driverReport(db, 'drv_son', from, to);
      expect(dr['tripCount'], greaterThanOrEqualTo(1));
      expect(dr['km'], greaterThan(0));
      // drv_son không bị chấm 1 sao (rb_seed_1 thuộc drv_quang) -> giữ 4.8.
      expect(dr['averageRating'], 4.8);
      final quang =
          await RideBusinessLogic.driverReport(db, 'drv_quang', from, to);
      expect(quang['averageRating'] < 4.5, isTrue); // bị 1 sao hạ trung bình
    });

    test('Dashboard §28 đủ chỉ số', () async {
      final dash = await RideBusinessLogic.dashboardSummary(db);
      expect(dash['revenueToday'], greaterThanOrEqualTo(0));
      expect(dash['revenueMonth'], greaterThan(0));
      expect(dash['driversOnline'], greaterThanOrEqualTo(2));
      expect(dash['pendingBookings'], 1); // rb_pending seed
      expect(dash['cancelledBookings'], greaterThanOrEqualTo(3));
      expect(dash['completedBookings'], greaterThanOrEqualTo(40));
      expect(dash['newCustomersThisMonth'], greaterThanOrEqualTo(1)); // giang
      expect(dash['newDriversThisMonth'], 1); // drv_nam
    });
  });

  group('XXXI. Sao lưu', () {
    test('Module KanRide đăng ký backup chung (CRM)', () {
      expect(ModuleBackupService.modules.any((m) => m.id == 'ride'), isTrue);
    });
  });
}

/// Shim nhỏ để không phụ thuộc tên hàm assign của logic (assignDriver).
class XeOmAssignShim {
  static Future<void> assign(Isar db, RideBooking b, RideDriver d) =>
      RideBusinessLogic.assignDriver(db, b, d);
}
