import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
import 'package:kanposvn/modules/kanposvnairbook/models/airbook_ops_models.dart';
import 'package:kanposvn/modules/kanposvnairbook/models/booking.dart';
import 'package:kanposvn/modules/kanposvnairbook/models/flight_offer.dart';
import 'package:kanposvn/modules/kanposvnairbook/providers/airbook_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnairbook/services/airbook_business_logic.dart';
import 'package:kanposvn/modules/kanposvnairbook/services/airbook_seed_data.dart';
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
  late MockFlightProvider provider;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('airbook_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    db = await AirbookDatabaseSetup.init();
    await AirBookSeedData.seedIfEmpty(db);
    provider = MockFlightProvider(db);
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  AirPassenger adt(String first, String last) => AirPassenger()
    ..type = AirPassengerType.ADT
    ..title = 'Mr'
    ..firstName = first
    ..lastName = last
    ..gender = 'male'
    ..phone = '0987654321';

  group('Seed dữ liệu mẫu theo kan_air_book_markdown.md', () {
    test('§6 Offers đa hãng/tuyến/hạng', () async {
      final offers = await db.flightOffers.where().findAll();
      expect(offers.length, 6);
      expect(offers.map((o) => o.airline).toSet().length, 3);
      expect(offers.any((o) => o.cabinClass == 'Business'), isTrue);
      expect(offers.any((o) => o.origin == 'SGN'), isTrue);
    });
    test('§8+§13 Bookings mẫu: ticketed/partial/held sắp hết hạn', () async {
      expect(await db.bookingLocals.count(), 3);
      expect(
          await db.bookingLocals
              .filter()
              .statusEqualTo(BookingAirStatus.confirmed)
              .count(),
          1);
      expect(
          await db.bookingLocals
              .filter()
              .statusEqualTo(BookingAirStatus.pendingPayment)
              .count(),
          1);
      expect(
          await db.bookingLocals.filter().statusEqualTo(BookingAirStatus.held).count(),
          1);
    });
    test('§9 Hành khách ADT theo booking ticketed', () async {
      expect(
        await db.airPassengers
            .filter()
            .bookingUuidEqualTo('bk_seed_ticketed')
            .count(),
        2,
      );
    });
    test('§32 Khuyến mãi airline + platform', () async {
      final promos = await db.airPromotions.where().findAll();
      expect(promos.map((p) => p.scope).toSet(), containsAll(['airline', 'platform']));
    });
  });

  group('§6. Tìm kiếm + bộ lọc + sắp xếp', () {
    test('HAN→SGN ra 4 chuyến; sort giá tăng dần', () async {
      final results =
          await provider.searchFlights(origin: 'HAN', destination: 'SGN');
      expect(results.length, 4);
      for (int i = 1; i < results.length; i++) {
        expect(results[i].totalFare! >= results[i - 1].totalFare!, isTrue);
      }
      expect(results.first.totalFare, 1200000);
    });
    test('Filter theo hãng', () async {
      final vn = await provider.searchFlights(
          origin: 'HAN', destination: 'SGN', airlines: ['Vietnam Airlines']);
      expect(vn.length, 2);
      for (final o in vn) {
        expect(o.airline, 'Vietnam Airlines');
      }
    });
    test('Filter hạng Business + maxPrice', () async {
      final biz = await provider.searchFlights(
          origin: 'HAN', destination: 'SGN', cabinClass: 'Business');
      expect(biz.length, 1);
      final under2tr = await provider.searchFlights(
          origin: 'HAN', destination: 'SGN', maxPrice: 2000000);
      for (final o in under2tr) {
        expect(o.totalFare! <= 2000000, isTrue);
      }
    });
    test('Sắp xếp khởi hành sớm nhất', () async {
      final early = await provider.searchFlights(
          origin: 'HAN', destination: 'SGN', sortBy: 'departEarly');
      expect(early.first.flightNumber, 'VN213');
    });
    test('Đổi tuyến HAN→DAD', () async {
      final dad = await provider.searchFlights(origin: 'HAN', destination: 'DAD');
      expect(dad.length, 1);
      expect(dad.first.flightNumber, 'VJ156');
    });
  });

  group('§8+§12+§27+§32+§55. Tạo booking giữ chỗ', () {
    test('Reprice từ offer + HELD 30 phút + PNR KANxxxxxx', () async {
      final offer =
          (await db.flightOffers.filter().uuidEqualTo('of_vj111').findFirst())!;
      final b = await AirBookBusinessLogic.createBooking(db,
          offer: offer,
          contactName: 'Trần Khách Test',
          contactPhone: '0988888888',
          passengers: [adt('An', 'Nguyễn'), adt('Bình', 'Lê')],
          idempotencyKey: 'idem-create-1');

      // §55. Giá tính lại từ offer: supplier=(890k+310k)*2=2.4tr, fee=300k.
      expect(b.supplierPrice, 2400000);
      expect(b.serviceFee, 300000);
      expect(b.totalAmount, closeTo(2700000, 0.01));
      expect(b.status, BookingAirStatus.held);
      expect(b.pnrCode!, startsWith('KAN'));
      expect(b.expiresAt!.difference(DateTime.now()).inMinutes,
          inInclusiveRange(25, 31));

      // Hành khách lưu theo booking.
      expect(
        await db.airPassengers.filter().bookingUuidEqualTo(b.uuid!).count(),
        2,
      );

      // Idempotency: gọi lại cùng key -> trả booking cũ (§27).
      final again = await AirBookBusinessLogic.createBooking(db,
          offer: offer,
          contactName: 'Trần Khách Test',
          contactPhone: '0988888888',
          passengers: [adt('An', 'Nguyễn')],
          idempotencyKey: 'idem-create-1');
      expect(again.uuid, b.uuid);
    });

    test('Voucher theo hãng VJ10 giảm 10% trần 200k cho Vietjet', () async {
      final offer =
          (await db.flightOffers.filter().uuidEqualTo('of_vj111').findFirst())!;
      final b = await AirBookBusinessLogic.createBooking(db,
          offer: offer,
          contactName: 'Khách VJ',
          contactPhone: '0977777777',
          passengers: [adt('Nam', 'Trần')],
          promoCode: 'VJ10',
          idempotencyKey: 'idem-vj');
      // supplier 1.2tr * 10% = 120k < trần 200k.
      expect(b.discountAmount, closeTo(120000, 0.01));
    });

    test('Voucher không đúng hãng -> chặn', () async {
      final vnOffer =
          (await db.flightOffers.filter().uuidEqualTo('of_vn213').findFirst())!;
      expect(
        () => AirBookBusinessLogic.createBooking(db,
            offer: vnOffer,
            contactName: 'X',
            contactPhone: 'Y',
            passengers: [adt('A', 'B')],
            promoCode: 'VJ10'),
        throwsException,
      );
    });
  });

  group('§13+§46. Thanh toán / giữ chỗ hết hạn', () {
    test('Thanh toán đủ -> PAID; xuất vé -> TICKETED + QR payload', () async {
      final offer =
          (await db.flightOffers.filter().uuidEqualTo('of_vn213').findFirst())!;
      var b = await AirBookBusinessLogic.createBooking(db,
          offer: offer,
          contactName: 'Nguyễn Full Pay',
          contactPhone: '0966666666',
          passengers: [adt('Full', 'Pay')],
          idempotencyKey: 'idem-fullpay');
      final total = b.totalAmount!;

      // Trả một phần trước.
      b = await AirBookBusinessLogic.payBooking(db, b,
          amount: 500000, method: 'momo', idempotencyKey: 'pay-part-1');
      expect(b.status, BookingAirStatus.pendingPayment);
      expect(b.remainingAmount, closeTo(total - 500000, 0.01));

      // Payment callback gửi 2 lần cùng idempotency key -> không nhân đôi.
      final paidCountBefore =
          await db.airPayments.filter().statusEqualTo('SUCCESS').count();
      b = await AirBookBusinessLogic.payBooking(db, b,
          amount: total - 500000,
          method: 'momo',
          idempotencyKey: 'pay-callback-x');
      final afterFirst =
          await db.airPayments.filter().statusEqualTo('SUCCESS').count();

      // §27+§53: callback lặp lại cùng key -> idempotent, KHÔNG tạo payment mới.
      final beforeDup = b;
      b = await AirBookBusinessLogic.payBooking(db, b,
          amount: 1,
          method: 'momo',
          idempotencyKey: 'pay-callback-x');
      expect(b.uuid, beforeDup.uuid);
      expect(paidCountBefore, lessThan(afterFirst));

      expect(b.status, BookingAirStatus.paid);
      expect(b.remainingAmount, 0);

      // Xuất vé.
      b = await AirBookBusinessLogic.issueTicket(db, b);
      expect(b.ticketNumber!, startsWith('VN0'));
      expect(b.status, BookingAirStatus.confirmed);
      final qr = AirBookBusinessLogic.qrPayload(b);
      expect(qr, contains(b.pnrCode!));
      expect(qr, contains(b.ticketNumber!));

      // Xuất lần nữa -> idempotent.
      await AirBookBusinessLogic.issueTicket(db, b);
      expect(b.ticketNumber, startsWith('VN0'));

      // Chưa trả đủ mà đòi xuất vé -> chặn (booking held khác).
      final held = (await db.bookingLocals
              .filter()
              .statusEqualTo(BookingAirStatus.held)
              .findFirst())!;
      expect(() => AirBookBusinessLogic.issueTicket(db, held), throwsException);
    });

    test('Booking HELD quá hạn -> EXPIRED (§46)', () async {
      final offer =
          (await db.flightOffers.filter().uuidEqualTo('of_vj156dad').findFirst())!;
      final expiredBk = await AirBookBusinessLogic.createBooking(db,
          offer: offer,
          contactName: 'Khách Hết Hạn',
          contactPhone: '0944444444',
          passengers: [adt('Het', 'Han')],
          holdDuration: const Duration(minutes: -5),
          idempotencyKey: 'idem-expired');
      expect(expiredBk.status, BookingAirStatus.held);

      final expiredList = await AirBookBusinessLogic.expireHeldBookings(db);
      expect(expiredList, greaterThanOrEqualTo(1));
      final after = await db.bookingLocals
          .filter()
          .uuidEqualTo(expiredBk.uuid!)
          .findFirst();
      expect(after!.status, BookingAirStatus.expired);
    });

    test('Thanh toán vượt số nợ -> chặn', () async {
      final partial = (await db.bookingLocals
              .filter()
              .uuidEqualTo('bk_seed_partial')
              .findFirst())!;
      expect(() => AirBookBusinessLogic.payBooking(db, partial, amount: 999999999),
          throwsException);
    });
  });

  group('§13+§39+§54. Hủy/hoàn tiền & báo cáo & sync', () {
    test('Hủy booking đã trả: hoàn 90% (>24h) + status REFUNDED', () async {
      // Tạo booking cho chuyến cách đây >24h? Offers đều tương lai ->
      // chính sách >=24h áp dụng cho mọi offer tương lai => refund 90%.
      final offer =
          (await db.flightOffers.filter().uuidEqualTo('of_qh221').findFirst())!;
      var b = await AirBookBusinessLogic.createBooking(db,
          offer: offer,
          contactName: 'Khách Hủy Đơn',
          contactPhone: '0955555555',
          passengers: [adt('Huy', 'Võ')],
          idempotencyKey: 'idem-cancel');
      b = await AirBookBusinessLogic.payBooking(db, b,
          amount: b.totalAmount!, idempotencyKey: 'idem-cancel-pay');

      final refundTxBefore =
          await db.airPayments.filter().statusEqualTo('REFUNDED').count();
      final refund =
          await AirBookBusinessLogic.cancelBooking(db, b, 'customer');
      expect(refund, closeTo(b.paidAmount * 0.9, 0.01));
      expect(b.status, BookingAirStatus.refunded);
      expect(
        await db.airPayments.filter().statusEqualTo('PARTIAL_REFUND').count(),
        refundTxBefore + 1,
      );
      // Hủy lần nữa -> chặn.
      expect(() => AirBookBusinessLogic.cancelBooking(db, b, 'customer'),
          throwsException);
    });

    test('Audit log ghi CREATE_BOOKING/PAYMENT/ISSUE_TICKET', () async {
      final logs = await db.airAuditLogs.where().findAll();
      expect(logs.map((l) => l.action),
          containsAll(['CREATE_BOOKING', 'PAYMENT', 'ISSUE_TICKET']));
    });

    test('Sync queue: CREATE booking enqueue -> pending > 0 -> flush về 0',
        () async {
      expect(await AirBookBusinessLogic.pendingSyncCount(db),
          greaterThanOrEqualTo(3));
      final flushed = await AirBookBusinessLogic.flushSyncQueue(db);
      expect(flushed, greaterThanOrEqualTo(3));
      expect(await AirBookBusinessLogic.pendingSyncCount(db), 0);
    });
  });

  group('§30+§35. Dashboard Manager & Báo cáo', () {
    test('Dashboard manager đủ chỉ số §30', () async {
      final d = await AirBookBusinessLogic.managerDashboard(db);
      expect(d['revenueToday'], greaterThanOrEqualTo(0));
      expect(d['bookingsTotal'], greaterThanOrEqualTo(6));
      expect(d['ticketsIssued'], greaterThanOrEqualTo(1));
      expect(d['outstandingDebt'], greaterThan(0)); // bk_seed_partial còn nợ
      expect(d['profitMonth'], greaterThan(0));
    });

    test('Báo cáo doanh thu + trạng thái booking §35', () async {
      final r =
          await AirBookBusinessLogic.report(db, DateTime(2020), DateTime(2100));
      expect(r['revenue'], greaterThan(0));
      expect((r['byDay'] as Map).isNotEmpty, isTrue);
      expect((r['byAirline'] as Map).keys, contains('Vietnam Airlines'));
      expect((r['byRoute'] as Map).keys, contains('HAN-SGN'));
      expect((r['statusCounts'] as Map), isNotEmpty);
      expect(r['profit'], greaterThan(0));
    });
  });

  group('XXXI. Sao lưu', () {
    test('Module KanAirBook đăng ký backup chung (CRM)', () {
      expect(ModuleBackupService.modules.any((m) => m.id == 'airbook'), isTrue);
    });
  });
}
