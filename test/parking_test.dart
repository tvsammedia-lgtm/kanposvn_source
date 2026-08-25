import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnparking/models/camera.dart';
import 'package:kanposvn/modules/kanposvnparking/models/monthly_ticket.dart';
import 'package:kanposvn/modules/kanposvnparking/models/parking_area.dart';
import 'package:kanposvn/modules/kanposvnparking/models/parking_finance.dart';
import 'package:kanposvn/modules/kanposvnparking/models/parking_tariff.dart';
import 'package:kanposvn/modules/kanposvnparking/models/parking_ticket.dart';
import 'package:kanposvn/modules/kanposvnparking/models/parking_customer.dart';
import 'package:kanposvn/modules/kanposvnparking/models/rental.dart';
import 'package:kanposvn/modules/kanposvnparking/models/vehicle.dart';
import 'package:kanposvn/modules/kanposvnparking/services/parking_business_logic.dart';
import 'package:kanposvn/modules/kanposvnparking/services/parking_isar_service.dart';
import 'package:kanposvn/modules/kanposvnparking/services/parking_seed_data.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
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
  late ParkingIsarService service;
  late Isar db;
  late List<ParkingTariff> tariffs;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('parking_logic_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    service = ParkingIsarService();
    db = await service.db;
    await ParkingSeedData.seedIfEmpty(db);
    tariffs = await db.parkingTariffs.where().findAll();
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('Seed dữ liệu mẫu theo kanposvnparking.md', () {
    test('§5 Khu bãi + chỗ trống', () async {
      final areas = await db.parkingAreas.where().findAll();
      expect(areas.length, 3);
      final total = areas.fold<int>(0, (s, a) => s + a.totalSpots);
      expect(total, 650); // 200 + 300 + 150
    });
    test('§6 Bảng giá 4 loại xe', () async {
      expect(tariffs.length, 4);
      final moto = tariffs.firstWhere((t) => t.vehicleType == 'motorbike');
      expect(moto.firstHourPrice, 5000);
      expect(moto.nextHourPrice, 3000);
      expect(moto.dailyMaxPrice, 30000);
    });
    test('§11 Camera (1 offline để test cảnh báo)', () async {
      final cams = await db.parkingCameras.where().findAll();
      expect(cams.length, 4);
      expect(cams.where((c) => c.status == 'offline').length, 1);
    });
    test('§7 Vé tháng/quý/năm: active + sắp hết hạn + hết hạn', () async {
      expect(await db.parkingMonthlyTickets.count(), 3);
      expect(
          await db.parkingMonthlyTickets.filter().statusEqualTo('active').count(),
          2);
    });
    test('§8 Thuê xe: renting + returned + overdue', () async {
      expect(await db.parkingRentals.count(), 3);
      expect(await db.parkingRentals.filter().statusEqualTo('renting').count(), 1);
      expect(await db.parkingRentals.filter().statusEqualTo('overdue').count(), 1);
    });
    test('§6 Vé lẻ seed: 15 lượt đã trả + 8 đang gửi', () async {
      expect(
          await db.parkingTickets.filter().statusEqualTo('checked_out').count(),
          15);
      expect(
          await db.parkingTickets.filter().statusEqualTo('parking').count(), 8);
      // Doanh thu phiếu thu khớp số vé lẻ đã trả.
      final fees = await db.parkingTickets
          .filter()
          .statusEqualTo('checked_out')
          .feeAmountGreaterThan(0)
          .findAll();
      expect(fees.length, 14); // 14 vé tính phí + 1 vé tháng miễn phí
    });
  });

  ParkingTariff tariffOf(String type) =>
      tariffs.firstWhere((t) => t.vehicleType == type);

  group('§6. Tính tiền gửi xe', () {
    test('Xe máy 95 phút -> giờ đầu 5k + 1h tiếp 3k = 8k', () {
      final fee = ParkingBusinessLogic.calcParkingFee(
        checkIn: DateTime(2026, 8, 20, 8),
        checkOut: DateTime(2026, 8, 20, 9, 35),
        tariff: tariffOf('motorbike'),
      );
      expect(fee, 8000);
    });
    test('Ô tô 2h10 -> 15k + 10k + 10k = 35k', () {
      final fee = ParkingBusinessLogic.calcParkingFee(
        checkIn: DateTime(2026, 8, 20, 7),
        checkOut: DateTime(2026, 8, 20, 9, 10),
        tariff: tariffOf('car'),
      );
      expect(fee, 35000);
    });
    test('Chặn trần ngày: đúng 3 ngày ô tô = 240k (80k x 3)', () {
      final fee = ParkingBusinessLogic.calcParkingFee(
        checkIn: DateTime(2026, 8, 18, 7),
        checkOut: DateTime(2026, 8, 21, 7),
        tariff: tariffOf('car'),
      );
      expect(fee, 240000);
    });
    test('Gửi vài giây vẫn tối thiểu 1 giờ (không bị 0đ)', () {
      final base = DateTime(2026, 8, 20, 10);
      final fee = ParkingBusinessLogic.calcParkingFee(
        checkIn: base,
        checkOut: base.add(const Duration(seconds: 20)),
        tariff: tariffOf('motorbike'), // giờ đầu 5k
      );
      expect(fee, 5000);
    });
    test('Cùng phút -> 0đ', () {
      expect(
          ParkingBusinessLogic.calcParkingFee(
            checkIn: DateTime(2026, 8, 20, 8),
            checkOut: DateTime(2026, 8, 20, 8),
            tariff: tariffOf('car'),
          ),
          0);
    });
  });

  group('§6. Nhận xe / trả xe tại trạm gác', () {
    test('Nhận xe mới -> vé parking + xe tự đăng ký vào hệ thống', () async {
      final ticket = await ParkingBusinessLogic.checkIn(db,
          licensePlate: '75H1-001.19',
          vehicleType: 'motorbike',
          cameraId: 'cam_vao_1',
          staffId: 'nv_baove01',
          areaId: 'khu_b');
      expect(ticket.status, 'parking');
      final vh = await db.parkingVehicles
          .filter()
          .licensePlateEqualTo('75H1-001.19')
          .findFirst();
      expect(vh, isNotNull);
    });

    test('Không nhận 2 lần cùng biển đang trong bãi', () async {
      expect(
        () => ParkingBusinessLogic.checkIn(db,
            licensePlate: '75H1-001.19', areaId: 'khu_b'),
        throwsException,
      );
    });

    test('BLACKLIST -> chặn nhận xe và báo động khi quét', () async {
      expect(
        () => ParkingBusinessLogic.checkIn(db,
            licensePlate: '51K-999.99', areaId: 'khu_b'),
        throwsException,
      );
      final scan = await ParkingBusinessLogic.scanCamera(db,
          plate: '51K-999.99', isEntry: true);
      expect(scan.action, 'blocked_alarm');
    });

    test('Trả xe tính đúng tiền theo bảng giá + tạo phiếu thu + trả chỗ',
        () async {
      final before = await db.parkingFinanceTxs.count();
      final open = await db.parkingTickets
          .filter()
          .licensePlateEqualTo('75H1-001.19')
          .statusEqualTo('parking')
          .findFirst();
      final fee = ParkingBusinessLogic.calcParkingFee(
        checkIn: open!.checkInTime,
        checkOut: DateTime.now(),
        tariff: tariffOf('motorbike'),
      );
      final done = await ParkingBusinessLogic.checkOut(db,
          ticket: open,
          paymentMethod: 'cash',
          staffId: 'nv_thungan01',
          tariffs: tariffs);
      expect(done.status, 'checked_out');
      expect(done.feeAmount, fee);
      expect(done.paymentStatus, 'paid');
      expect(await db.parkingFinanceTxs.count(), before + 1);
      // Không thể trả 2 lần.
      expect(
        () => ParkingBusinessLogic.checkOut(db,
            ticket: done, paymentMethod: 'cash', tariffs: tariffs),
        throwsException,
      );
    });
  });

  group('§12-13. Quét camera tự động', () {
    test('Quét làn vào: xe thường -> tạo vé; xe vé tháng -> monthly_pass',
        () async {
      final r1 = await ParkingBusinessLogic.scanCamera(db,
          plate: '72B1-456.78', isEntry: true, areaId: 'khu_b');
      expect(r1.action, 'allowed');
      expect(r1.createdTicket!.status, 'parking');

      // Xe có vé tháng còn hạn (29A-123.45) nhưng KHÔNG có vé đang gửi
      // sau seed? Seed đã trả vé monthly_card rồi -> quét vào sẽ pass.
      final r2 = await ParkingBusinessLogic.scanCamera(db,
          plate: '29A-123.45', isEntry: true, areaId: 'khu_b');
      expect(r2.action, 'monthly_pass');
      expect(r2.monthlyTicket, isNotNull);
    });

    test('Quét làn ra xe thường: tự checkout theo bảng giá', () async {
      // Đảm bảo xe đang trong bãi (tự nhận vào nếu chưa).
      var open = await db.parkingTickets
          .filter()
          .licensePlateEqualTo('72B1-456.78')
          .statusEqualTo('parking')
          .findFirst();
      open ??= await ParkingBusinessLogic.scanCamera(db,
          plate: '72B1-456.78', isEntry: true, areaId: 'khu_b')
          .then((r) => r.createdTicket);
      final r = await ParkingBusinessLogic.scanCamera(db,
          plate: '72B1-456.78', isEntry: false, tariffs: tariffs);
      expect(r.action, 'allowed');
      expect(r.createdTicket!.status, 'checked_out');
      expect(r.createdTicket!.feeAmount, greaterThan(0));
    });

    test('Quét làn ra xe vé tháng: 0đ + monthly_pass', () async {
      // Đưa xe vé tháng vào bãi nếu chưa có vé đang mở.
      var open = await db.parkingTickets
          .filter()
          .licensePlateEqualTo('29A-123.45')
          .statusEqualTo('parking')
          .findFirst();
      if (open == null) {
        final inResult = await ParkingBusinessLogic.scanCamera(db,
            plate: '29A-123.45', isEntry: true, areaId: 'khu_b');
        open = inResult.createdTicket;
      }
      expect(open!.paymentMethod, 'monthly_card');
      final r = await ParkingBusinessLogic.scanCamera(db,
          plate: '29A-123.45', isEntry: false, tariffs: tariffs);
      expect(r.action, 'monthly_pass');
      expect(r.createdTicket!.feeAmount, 0);
    });
  });

  group('§7. Vé tháng / quý / năm + cảnh báo', () {
    test('Mua vé quý: hạn +3 tháng, thu phí x3, tạo phiếu thu', () async {
      final txBefore = await db.parkingFinanceTxs.count();
      final t = await ParkingBusinessLogic.createMonthlyTicket(db,
          customerName: 'Đỗ F',
          customerPhone: '0956667788',
          licensePlate: '60G1-111.22',
          feeAmount: 90000,
          period: 'quarter',
          staffId: 'nv_thungan01');
      expect(t.endDate.difference(t.startDate).inDays, greaterThanOrEqualTo(88));
      expect(t.feeAmount, 270000);
      expect(await db.parkingFinanceTxs.count(), txBefore + 1);
    });

    test('Sắp hết hạn <=7 ngày: bắt được vé quý của Trần Thị B', () async {
      final soon = await ParkingBusinessLogic.expiringSoon(db, days: 7);
      expect(soon.map((t) => t.ticketId), contains('mt_thib_quy'));
    });

    test('Gia hạn vé sắp hết hạn -> hết cảnh báo', () async {
      final t = await db.parkingMonthlyTickets
          .filter()
          .ticketIdEqualTo('mt_thib_quy')
          .findFirst();
      await ParkingBusinessLogic.renewMonthlyTicket(db, t!, months: 3);
      expect(t.status, 'active');
      expect(t.endDate.isAfter(DateTime.now().add(const Duration(days: 80))),
          isTrue);
      final soon = await ParkingBusinessLogic.expiringSoon(db, days: 7);
      expect(soon.map((x) => x.ticketId), isNot(contains('mt_thib_quy')));
    });

    test('markExpiredTickets chuyển vé quá hạn', () async {
      await ParkingBusinessLogic.markExpiredTickets(db);
      expect(
        await db.parkingMonthlyTickets.filter().statusEqualTo('expired').count(),
        1, // vé mt_cu_han trong seed
      );
    });
  });

  group('§8-9. Thuê xe & hợp đồng', () {
    test('Tạo đơn thuê: xe chuyển rented, ghi doanh thu cọc+thuê', () async {
      final vh =
          await db.parkingVehicles.filter().vehicleIdEqualTo('vh_thue_wave').findFirst();
      final cust = await db.parkingCustomers
          .filter()
          .customerIdEqualTo('kh_lec')
          .findFirst();
      final txBefore = await db.parkingFinanceTxs
          .filter()
          .noteStartsWith('Thuê xe')
          .count();

      final r = await ParkingBusinessLogic.createRental(db,
          customer: cust!,
          vehicle: vh!,
          rentEnd: DateTime.now().add(const Duration(days: 2)),
          depositAmount: 2000000,
          rentalFee: 140000,
          contractNo: 'HD-2026-099');
      expect(r.status, 'renting');
      expect((await db.parkingVehicles.get(vh.isarId))!.status, 'rented');
      expect(
        await db.parkingFinanceTxs.filter().noteContains('HD-2026-099').count(),
        1,
      );
      expect(
        await db.parkingFinanceTxs.filter().noteStartsWith('Thuê xe').count(),
        txBefore + 1,
      );

      // Trả xe -> active lại.
      await ParkingBusinessLogic.returnRental(db, r);
      expect(r.status, 'returned');
      expect((await db.parkingVehicles.get(vh.isarId))!.status, 'active');
    });

    test('Không cho thuê xe đang được thuê', () async {
      // rt_seed_1 đang thuê wave... nhưng wave vừa được trả ở test trên.
      // Dùng chính xe đó: tạo thuê mới rồi thử thuê tiếp.
      final vh = await db.parkingVehicles
          .filter()
          .vehicleIdEqualTo('vh_thue_wave')
          .findFirst();
      final cust = await db.parkingCustomers
          .filter()
          .customerIdEqualTo('kh_vana')
          .findFirst();
      final r = await ParkingBusinessLogic.createRental(db,
          customer: cust!,
          vehicle: vh!,
          rentEnd: DateTime.now().add(const Duration(days: 1)),
          depositAmount: 1000000,
          rentalFee: 70000);
      expect(() {
        return ParkingBusinessLogic.createRental(db,
            customer: cust,
            vehicle: vh,
            rentEnd: DateTime.now(),
            depositAmount: 0,
            rentalFee: 0);
      }, throwsException);
      // Dọn trạng thái cho các test khác.
      await ParkingBusinessLogic.returnRental(db, r);
    });

    test('markOverdueRentals bắt đơn quá hạn chưa trả', () async {
      // Tạo đơn mới có ngày trả trong quá khứ.
      final vh = await db.parkingVehicles
          .filter()
          .vehicleIdEqualTo('vh_thue_vinfast')
          .findFirst();
      final cust = await db.parkingCustomers
          .filter()
          .customerIdEqualTo('kh_lec')
          .findFirst();
      final r = await ParkingBusinessLogic.createRental(db,
          customer: cust!,
          vehicle: vh!,
          rentEnd: DateTime.now().subtract(const Duration(hours: 5)),
          depositAmount: 5000000,
          rentalFee: 300000);
      expect(r.status, 'renting');
      final overdue = await ParkingBusinessLogic.markOverdueRentals(db);
      expect(overdue.map((x) => x.rentalId), contains(r.rentalId));
      expect((await db.parkingRentals.get(r.isarId))!.status, 'overdue');
    });
  });

  group('§14. Báo cáo', () {
    final from = DateTime(2020);
    final to = DateTime(2100);

    test('Doanh thu tổng hợp không đếm trùng (vé lẻ/tháng/thuê/khác)', () async {
      final rev = await ParkingBusinessLogic.revenueReport(db, from, to);
      expect(rev['hourly']!, greaterThan(0));
      expect(rev['monthly']!, greaterThan(0)); // bán vé quý trong test
      expect(rev['rental']!, greaterThan(0)); // 2 đơn thuê tạo phiếu thu
      expect(rev['total']!,
          rev['hourly']! + rev['monthly']! + rev['rental']! + rev['other']!);
    });

    test('Báo cáo gửi xe: lượt + theo loại + theo nhân viên', () async {
      final rp = await ParkingBusinessLogic.parkingReport(db, from, to);
      expect(rp['totalTurns'], greaterThanOrEqualTo(24)); // 15+8 seed + test
      final byType = rp['byType'] as Map<String, int>;
      expect(byType['motorbike'], greaterThan(0));
      final byStaff = rp['byStaff'] as Map<String, int>;
      expect(byStaff.containsKey('nv_baove01'), isTrue);
      expect(rp['revenue'], greaterThan(0));
    });

    test('Báo cáo thuê xe: đang/đã trả/quá hạn + cọc', () async {
      final rr = await ParkingBusinessLogic.rentalReport(db);
      expect(rr['returned'], greaterThanOrEqualTo(3));
      expect(rr['overdue'], 2); // rt_seed_3 + đơn quá hạn tạo trong test
      expect(rr['deposits'], greaterThan(0));
    });

    test('Chi phí 6 nhóm từ seed + lãi lỗ = doanh thu - chi phí', () async {
      final exp = await ParkingBusinessLogic.expenseReport(db, from, to);
      for (final key in [
        'ELECTRICITY', 'WATER', 'RENT', 'CAMERA', 'SALARY', 'MAINTENANCE'
      ]) {
        expect(exp[key], isNotNull, reason: 'Thiếu chi phí $key');
      }
      final profit = await ParkingBusinessLogic.profitReport(db, from, to);
      expect(profit['profit'],
          profit['revenue']! - profit['expense']!);
    });
  });

  group('§2 + §16. Dashboard & cảnh báo', () {
    test('Đủ chỉ số: xe gửi/đã ra/chỗ trống/doanh thu/camera/cảnh báo', () async {
      final d = await ParkingBusinessLogic.dashboardSummary(db);
      expect(d['parkingCount'], greaterThanOrEqualTo(8)); // 8 xe seed còn trong bãi
      expect(d['checkedOutToday'], greaterThanOrEqualTo(2));
      expect(d['totalSpots'], 650);
      expect(d['freeSpots'], lessThan(650));
      expect(d['camerasOnline'], 3);
      expect(d['camerasTotal'], 4);
      final alerts = d['alerts'] as List;
      // Phải có cảnh báo camera offline + vé tháng sắp hết hạn/hết hạn + xe quá hạn.
      expect(alerts.any((a) => '$a'.contains('OFFLINE')), isTrue);
      expect(alerts.any((a) => '$a'.contains('QUÁ HẠN')), isTrue);
    });
  });

  group('XXXI. Sao lưu', () {
    test('Module Parking đăng ký backup chung (CRM)', () {
      expect(ModuleBackupService.modules.any((m) => m.id == 'parking'), isTrue);
    });
  });
}
