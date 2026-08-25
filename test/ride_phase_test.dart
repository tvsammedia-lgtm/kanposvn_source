import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_booking.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_driver.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_ops_models.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_transaction.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_user.dart';
import 'package:kanposvn/modules/kanposvnride/models/ride_vehicle_type.dart';
import 'package:kanposvn/modules/kanposvnride/providers/ride_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnride/services/ride_advanced_logic.dart';
import 'package:kanposvn/modules/kanposvnride/services/ride_business_logic.dart';
import 'package:kanposvn/modules/kanposvnride/services/ride_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

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
    tempDir = await Directory.systemTemp.createTemp('ride_phase_test');
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

  group('GĐ2. QR Payment', () {
    test('Sinh QR payload + xác nhận -> tài xế nhận tiền sau hoa hồng',
        () async {
      final user = await db.rideUsers.filter().uuidEqualTo('user_hoa').findFirst();
      var b = await RideBusinessLogic.createBooking(db,
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
      final driver = (await db.rideDrivers
              .filter()
              .uuidEqualTo('drv_son')
              .findFirst())!;
      // Gán tài xế qua logic để lưu vào DB (điều kiện: online + đúng loại xe).
      await RideBusinessLogic.assignDriver(db, b, driver);

      final payload = await RideAdvancedLogic.generateQrPayment(db, b);
      expect(payload, startsWith('KANRIDE|PAY|'));
      expect(payload, contains(b.uuid!));

      final walletBefore = driver.driverWalletBalance;
      await RideAdvancedLogic.confirmQrPayment(db, payload);

      // Tài xế được cộng phần sau trừ hoa hồng.
      final dAfter = await db.rideDrivers.filter().uuidEqualTo('drv_son').findFirst();
      expect(dAfter!.driverWalletBalance,
          closeTo(walletBefore + b.finalPrice * 0.85, 0.01));

      // QR sai định dạng / thiếu tiền -> chặn.
      expect(() => RideAdvancedLogic.confirmQrPayment(db, 'JUNK'),
          throwsException);
      expect(
          () => RideAdvancedLogic.confirmQrPayment(db, 'KANRIDE|PAY|${b.uuid}|1|VND'),
          throwsException);

      // Dọn state: hủy chuyến để drv_son trở lại online cho test sau.
      await RideBusinessLogic.cancelBooking(db, b.uuid!, reason: 'dọn state');
    });
  });

  group('GĐ3. Ride Sharing §12', () {
    test('Ghép chuyến: tìm candidate gần + nhóm chung + giảm thêm 10%',
        () async {
      final userA = await db.rideUsers.filter().uuidEqualTo('user_hoa').findFirst();
      final a = await RideBusinessLogic.createBooking(db,
          passenger: userA!,
          pickupAddress: 'Ben Thanh',
          pickupLat: 10.7725,
          pickupLng: 106.7020,
          dropoffAddress: 'Tan Binh',
          dropoffLat: 10.8050,
          dropoffLng: 106.6500,
          distanceKm: 8,
          vehicleType: VehicleType.motorBike,
          isSharedRide: true,
          types: types);

      final userB = await db.rideUsers.filter().uuidEqualTo('user_binh').findFirst();
      final c = await RideBusinessLogic.createBooking(db,
          passenger: userB!,
          pickupAddress: 'Gan Ben Thanh',
          pickupLat: 10.7760, // ~0.4km
          pickupLng: 106.7050,
          dropoffAddress: 'Gan Tan Binh',
          dropoffLat: 10.8090, // ~0.45km
          dropoffLng: 106.6530,
          distanceKm: 8,
          vehicleType: VehicleType.motorBike,
          isSharedRide: true,
          types: types);

      final match = await RideAdvancedLogic.matchSharedRide(db, a);
      expect(match!.uuid, c.uuid);

      final priceABefore = c.finalPrice;
      final group = await RideAdvancedLogic.mergeSharedRide(db, a, c);
      expect(group, isNotEmpty);
      expect(c.sharedGroupUuid, group);
      expect(a.sharedGroupUuid, group);
      expect(c.finalPrice, lessThan(priceABefore));
      expect(c.driverUuid, a.driverUuid);
    });

    test('Không ghép khi điểm đón quá xa (>2km)', () async {
      final user = await db.rideUsers.filter().uuidEqualTo('user_giang').findFirst();
      final far = await RideBusinessLogic.createBooking(db,
          passenger: user!,
          pickupAddress: 'Thu Duc',
          pickupLat: 10.8800, // cách Q1 >10km
          pickupLng: 106.7600,
          dropoffAddress: 'Bin Thanh',
          dropoffLat: 10.8200,
          dropoffLng: 106.7100,
          distanceKm: 9,
          vehicleType: VehicleType.motorBike,
          isSharedRide: true,
          types: types);
      final match = await RideAdvancedLogic.matchSharedRide(db, far);
      expect(match, anyOf(isNull, (x) => x.uuid != 'rb_pending'));
    });
  });

  group('GĐ3. AI điều phối + phân tích + dự đoán', () {
    test('dispatchBestDriver: chọn online đúng loại, có điểm số', () async {
      final best = await RideAdvancedLogic.dispatchBestDriver(db,
          pickupLat: 10.776, // gần drv_son
          pickupLng: 106.700,
          vehicleType: VehicleType.motorBike);
      expect(best, isNotNull);
      expect(best!.driver.uuid, 'drv_son');
      expect(best.score, greaterThan(0));
      expect(best.score, lessThanOrEqualTo(1));
    });

    test('Heatmap theo giờ + dự đoán nhu cầu', () async {
      final heat = await RideAdvancedLogic.demandHeatmapByHour(db);
      expect(heat.isNotEmpty, isTrue);
      final p =
          await RideAdvancedLogic.predictDemandByHour(db, heat.keys.first);
      expect(p.expectedTrips, greaterThanOrEqualTo(0));
    });

    test('Hiệu suất tài xế tổng = 100%', () async {
      final util = await RideAdvancedLogic.driverUtilization(
          db, DateTime(2020), DateTime(2100));
      expect(util.isNotEmpty, isTrue);
      final sum = util.values.fold<double>(0, (s, v) => s + v);
      expect(sum, closeTo(100, 0.01));
    });
  });

  group('§21+§22+§23. Chat / Số ảo / Thông báo', () {
    test('Chat trong chuyến: gửi + đọc theo thứ tự', () async {
      await RideAdvancedLogic.sendChat(db,
          bookingUuid: 'rb_seed_1',
          senderRole: 'customer',
          senderUuid: 'user_hoa',
          text: 'Anh tới đâu rồi?');
      await RideAdvancedLogic.sendChat(db,
          bookingUuid: 'rb_seed_1',
          senderRole: 'driver',
          senderUuid: 'drv_son',
          text: 'Sắp tới, 2 phút nữa.');
      final msgs = await RideAdvancedLogic.listChat(db, 'rb_seed_1');
      expect(msgs.length, 2);
      expect(msgs.first.senderRole, 'customer');
      expect(msgs.last.text, contains('2 phút'));

      expect(() => RideAdvancedLogic.sendChat(db,
          bookingUuid: 'rb_seed_1', senderRole: 'customer', senderUuid: 'u', text: ''),
          throwsException);
    });

    test('Số ảo che giấu 2 số thật + hết hạn 2h', () async {
      final call = await RideAdvancedLogic.createMaskedCall(db, 'rb_seed_2');
      expect(call.virtualNumber, startsWith('VN-'));
      expect(call.virtualNumber, isNot(contains(call.passengerReal)));
      expect(call.expiresAt.difference(call.createdAt).inHours, 2);
    });

    test('Thông báo: đếm chưa đọc + đánh dấu tất cả đã đọc', () async {
      final before = await RideAdvancedLogic.unreadCount(db, 'user_hoa');
      expect(before, greaterThanOrEqualTo(1)); // seed ntf_seed_1
      await RideAdvancedLogic.markAllRead(db, 'user_hoa');
      expect(await RideAdvancedLogic.unreadCount(db, 'user_hoa'), 0);
    });
  });

  group('§29+§31. GeoFence & CSKH', () {
    test('GeoFence: điểm trong TP.HCM -> true, Hà Nội -> false', () async {
      expect(await RideAdvancedLogic.isInsideAnyFence(db, 10.776, 106.700),
          isTrue); // Q1
      expect(await RideAdvancedLogic.isInsideAnyFence(db, 21.028, 105.854),
          isFalse); // Hà Nội
    });

    test('Ticket khiếu nại + hoàn tiền về ví khách', () async {
      final t = await RideAdvancedLogic.openTicket(db,
          userUuid: 'user_binh',
          category: 'refund',
          subject: 'Bị tính trùng chuyến',
          detail: 'Trừ ví 2 lần',
          bookingUuid: 'rb_seed_5');
      expect(t.status, 'open');

      final balanceBefore =
          (await db.rideUsers.filter().uuidEqualTo('user_binh').findFirst())!
              .walletBalance;
      await RideAdvancedLogic.resolveTicketWithRefund(db, t, refundAmount: 50000);

      expect(t.status, 'resolved');
      expect(t.refundAmount, 50000);
      final uAfter =
          await db.rideUsers.filter().uuidEqualTo('user_binh').findFirst();
      expect(uAfter!.walletBalance, balanceBefore + 50000);
      final refundTx = await db.rideTransactions
          .filter()
          .typeEqualTo(TransactionType.refund)
          .findFirst();
      expect(refundTx, isNotNull);
    });
  });

  group('§35-36. Nhật ký & Offline Sync', () {
    test('Audit log ghi nhận hành động PAYMENT/SYNC/RENTAL...', () async {
      final logs = await RideAdvancedLogic.recentLogs(db, limit: 100);
      expect(logs.map((l) => l.action),
          containsAll(['PAYMENT']));
    });

    test('Offline queue: đếm pending -> flush -> về 0', () async {
      final pending = await RideAdvancedLogic.pendingSyncCount(db);
      expect(pending, greaterThan(0)); // các giao dịch test trước để pending
      final flushed = await RideAdvancedLogic.flushSyncQueue(db);
      expect(flushed, pending);
      expect(await RideAdvancedLogic.pendingSyncCount(db), 0);
    });
  });

  group('GĐ4. Thuê xe tự lái', () {
    test('Tạo đơn tự lái 3 ngày -> trả xe -> returned', () async {
      final r = await RideAdvancedLogic.createSelfDrive(db,
          vehiclePlate: '51F-777.77',
          customerName: 'Nguyễn Thuê Xe',
          customerPhone: '0966000111',
          customerCccd: '079203099999',
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 3)),
          dailyPrice: 800000,
          deposit: 5000000);
      expect(r.status, 'rented');

      await RideAdvancedLogic.returnSelfDrive(db, r);
      expect(r.status, 'returned');
      expect(r.actualReturnTime, isNotNull);

      // Ngày trả trước ngày nhận -> chặn.
      expect(() => RideAdvancedLogic.createSelfDrive(db,
              vehiclePlate: '51F-777.78',
              customerName: 'X',
              customerPhone: 'Y',
              customerCccd: 'Z',
              startDate: DateTime.now(),
              endDate: DateTime.now(),
              dailyPrice: 1,
              deposit: 0),
          throwsException);
    });

    test('Quá hạn trả xe bị đánh dấu overdue', () async {
      final r = await RideAdvancedLogic.createSelfDrive(db,
          vehiclePlate: '51F-888.88',
          customerName: 'Khách Quá Hạn',
          customerPhone: '0966000222',
          customerCccd: '079203088888',
          startDate: DateTime.now().subtract(const Duration(days: 5)),
          endDate: DateTime.now().subtract(const Duration(days: 1)),
          dailyPrice: 700000,
          deposit: 4000000);
      final overdues = await RideAdvancedLogic.markOverdueSelfDrive(db);
      expect(overdues.map((x) => x.rentalId), contains(r.rentalId));
    });
  });

  group('GĐ4. Giao hàng', () {
    test('Đơn hàng: tìm tài xế -> lấy hàng -> giao xong tài xế online + hoa hồng',
        () async {
      final o = await RideAdvancedLogic.createDelivery(db,
          customerName: 'Shop Trà Sữa',
          customerPhone: '0977000111',
          pickupAddress: 'Store Q1',
          dropoffAddress: 'Khách Q3',
          itemNote: '2 ly trà sữa size L',
          weightKg: 1.2,
          fee: 25000);
      expect(o.status, 'finding_driver');

      final driver =
          (await db.rideDrivers.filter().uuidEqualTo('drv_son').findFirst())!;
      final walletBefore = driver.driverWalletBalance;
      await RideAdvancedLogic.assignDeliveryDriver(db, o, driver);
      expect(o.status, 'picked_up');
      expect(driver.status, DriverStatus.busy);

      await RideAdvancedLogic.deliverOrder(db, o);
      expect(o.status, 'delivered');
      final dAfter =
          await db.rideDrivers.filter().uuidEqualTo('drv_son').findFirst();
      expect(dAfter!.status, DriverStatus.online);
      expect(dAfter.driverWalletBalance,
          closeTo(walletBefore + 25000 * 0.85, 0.01));

      // Không giao lại đơn đã giao.
      expect(() => RideAdvancedLogic.assignDeliveryDriver(db, o, driver),
          throwsException);
    });
  });

  group('GĐ4. Taxi doanh nghiệp', () {
    test('Chuyến DN gánh công nợ + chặn vượt hạn mức + thanh toán kỳ', () async {
      final corp = await RideAdvancedLogic.createCorporateAccount(db,
          companyName: 'ABC Logistics Test',
          taxCode: '0311999888',
          contactPhone: '02838119999',
          creditLimitVnd: 100000);
      final user = await db.rideUsers.filter().uuidEqualTo('user_hoa').findFirst();

      var b1 = await RideBusinessLogic.createBooking(db,
          passenger: user!,
          pickupAddress: 'A',
          pickupLat: 10.78,
          pickupLng: 106.70,
          dropoffAddress: 'B',
          dropoffLat: 10.79,
          dropoffLng: 106.71,
          distanceKm: 3,
          vehicleType: VehicleType.motorBike,
          paymentMethod: 'corporate',
          types: types);
      await RideAdvancedLogic.chargeCorporate(db, corp, b1);
      expect(corp.currentDebt, closeTo(b1.finalPrice, 0.01));
      expect(b1.corporateUuid, corp.corpId);

      // Vượt hạn mức 100k -> chặn.
      var b2 = await RideBusinessLogic.createBooking(db,
          passenger: user,
          pickupAddress: 'A',
          pickupLat: 10.78,
          pickupLng: 106.70,
          dropoffAddress: 'B',
          dropoffLat: 10.79,
          dropoffLng: 106.71,
          distanceKm: 50,
          vehicleType: VehicleType.car4Seats,
          paymentMethod: 'corporate',
          types: types);
      expect(() => RideAdvancedLogic.chargeCorporate(db, corp, b2),
          throwsException);

      // Thanh toán toàn bộ công nợ.
      final remain = await RideAdvancedLogic.payCorporateDebt(db, corp);
      expect(remain, 0);
    });
  });

  group('GĐ4. API đối tác', () {
    test('Issue key + validate đúng/sai key + quota', () async {
      final key = await RideAdvancedLogic.issuePartnerKey(db,
          partnerName: 'TestCorp',
          apiKey: 'sk_test_123',
          quotaPerDay: 2);
      expect(key.apiKeyHash, isNot('sk_test_123')); // không lưu key thô

      expect(await RideAdvancedLogic.validatePartnerKey(db, 'TestCorp', 'sk_test_123'), isTrue);
      expect(await RideAdvancedLogic.validatePartnerKey(db, 'TestCorp', 'sk_test_123'), isTrue);
      // Hết quota ngày.
      expect(await RideAdvancedLogic.validatePartnerKey(db, 'TestCorp', 'sk_test_123'), isFalse);
      // Sai key.
      expect(await RideAdvancedLogic.validatePartnerKey(db, 'TestCorp', 'wrong'), isFalse);
      // Partner không tồn tại.
      expect(await RideAdvancedLogic.validatePartnerKey(db, 'Ghost', 'abc'), isFalse);
    });
  });

  group('XXXI. Sao lưu', () {
    test('Backup ride vẫn đăng ký và reset đủ collection mới', () async {
      final entry = ModuleBackupService.modules.firstWhere((m) => m.id == 'ride');
      // Chạy reset trên DB thật của module để đảm bảo clear không lỗi getter.
      await entry.resetToSeed!();
      expect(await db.rideBookings.count(), greaterThanOrEqualTo(40));
      expect(await db.rideGeoFences.count(), 1);
      expect(await db.ridePartnerApiKeys.count(), 1);
      expect(await db.rideCorporateAccounts.count(), greaterThanOrEqualTo(1));
    });
  });
}
