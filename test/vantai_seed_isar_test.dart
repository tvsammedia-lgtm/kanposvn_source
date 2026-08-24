import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_cashbook.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_customer.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_driver.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_expense.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_route.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_shipment.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_supplier.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_ticket.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_trip.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_vehicle.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/services/vantai_business_logic.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/services/vantai_isar_service.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/services/vantai_seed_data.dart';
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
  late VantaiIsarService service;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('vantai_seed_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  tearDownAll(() async {
    try {
      final isar = await service.db;
      await isar.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('Seed dữ liệu mẫu đầy đủ theo quanlyvantaibanve.md', () async {
    service = VantaiIsarService();
    final db = await service.db;

    await VantaiSeedData.seedIfEmpty(service);

    // ===== Số lượng theo PRD =====
    final routes = await db.vantaiRoutes.where().findAll();
    expect(routes.length, 5,
        reason: 'Mục 1: đủ tuyến ví dụ Bắc Nam/Vũng Tàu/An Giang/Đà Lạt/Cần Thơ');

    final vehicles = await db.vantaiVehicles.where().findAll();
    expect(vehicles.length, greaterThanOrEqualTo(6));
    expect(vehicles.any((v) => v.status == VehicleStatus.MAINTENANCE), isTrue,
        reason: 'Mục 1 Dashboard cần "xe đang bảo dưỡng"');
    expect(vehicles.any((v) => v.status == VehicleStatus.REPAIR), isTrue,
        reason: 'Mục 1 Dashboard cần "xe đang sửa chữa"');
    expect(
        vehicles.any((v) =>
            VantaiBusinessLogic.expiringSoon(
                v.inspectionExpiry, DateTime.now()) ||
            VantaiBusinessLogic.expiringSoon(
                v.insuranceExpiry, DateTime.now())),
        isTrue,
        reason: 'Có xe giấy tờ sắp hết hạn để test cảnh báo');

    final drivers = await db.vantaiDrivers.where().findAll();
    expect(drivers.where((d) => d.role == DriverRole.DRIVER).length,
        greaterThanOrEqualTo(5),
        reason: 'Mục 4: quản lý tài xế');
    expect(drivers.where((d) => d.role == DriverRole.ASSISTANT).length,
        greaterThanOrEqualTo(2),
        reason: 'Mục 5: quản lý phụ xe');
    expect(drivers.any((d) => d.licenseExpiry != null),
        isTrue);

    final customers = await db.vantaiCustomers.where().findAll();
    expect(customers.length, greaterThanOrEqualTo(4));
    expect(customers.any((c) => c.currentDebt > 0), isTrue,
        reason: 'Mục 9+16: khách có công nợ');
    expect(customers.any((c) => c.name.contains('Công Ty') || c.name.contains('Tour')),
        isTrue,
        reason: 'Mục 9: khách doanh nghiệp');

    final suppliers = await db.vantaiSuppliers.where().findAll();
    expect(suppliers.length, greaterThanOrEqualTo(4),
        reason: 'Mục 17: gara/xăng dầu/lốp/phụ tùng');
    expect(suppliers.fold<double>(0, (s, x) => s + x.debt), greaterThan(0));

    final trips = await db.vantaiTrips.where().findAll();
    expect(trips.length, greaterThanOrEqualTo(40),
        reason: '14 ngày qua x 3 chuyến + hôm nay/ngày mai');
    expect(trips.where((t) => t.status == TripStatus.COMPLETED).length,
        greaterThanOrEqualTo(40));
    expect(trips.where((t) => t.status == TripStatus.RUNNING).length, 1,
        reason: 'Mục 1: chuyến đang chạy');
    expect(trips.where((t) => t.status == TripStatus.SCHEDULED).length,
        greaterThanOrEqualTo(2));

    final tickets = await db.vantaiTickets.where().findAll();
    expect(tickets.length, greaterThan(100),
        reason: 'Vé bán ra trải đều các chuyến');
    expect(tickets.map((t) => t.paymentMethod).toSet().length, 4,
        reason: 'Mục 7: đủ tiền mặt/CK/QR/công nợ');
    expect(tickets.any((t) => t.status == TicketStatus.RESERVED), isTrue,
        reason: 'Mục 8: ghế giữ chỗ');

    final shipments = await db.vantaiShipments.where().findAll();
    expect(shipments.length, greaterThanOrEqualTo(10));
    for (final st in [
      ShipmentStatus.PENDING,
      ShipmentStatus.IN_TRANSIT,
      ShipmentStatus.AT_WAREHOUSE,
      ShipmentStatus.DELIVERED
    ]) {
      expect(shipments.any((s) => s.status == st), isTrue,
          reason: 'Mục 10-11: luồng $st');
    }
    expect(shipments.any((s) => s.codAmount > 0), isTrue,
        reason: 'Thu hộ COD');

    final expenses = await db.vantaiExpenses.where().findAll();
    expect(expenses.length, greaterThanOrEqualTo(15));
    expect(expenses.map((e) => e.category).toSet().length,
        greaterThanOrEqualTo(8),
        reason: 'Mục 14: đủ khoản mục chi phí');

    final cashTxs = await db.vantaiCashTxs.where().findAll();
    expect(cashTxs.length, greaterThanOrEqualTo(5));
    expect(cashTxs.any((t) => t.type == CashTxType.THU), isTrue);
    expect(cashTxs.any((t) => t.type == CashTxType.CHI), isTrue);

    // ===== Kiểm tra tính nhất quán =====
    // Mỗi chuyến không có ghế trùng lặp (đã bán/giữ chỗ)
    for (final trip in trips) {
      final tripTickets = tickets
          .where((t) => t.status != TicketStatus.CANCELLED)
          .where((t) => t.seatNumber.isNotEmpty)
          .where((t) =>
              t.departureTime == trip.departureTime &&
              t.vehicle.value?.vehicleId == trip.vehicle.value?.vehicleId)
          .toList();
      final seatSet = tripTickets.map((t) => t.seatNumber).toSet();
      expect(seatSet.length, tripTickets.length,
          reason:
              'Chuyến ${trip.tripId.substring(0, 6)} bị bán trùng ghế: '
              '${tripTickets.map((t) => t.seatNumber).join(",")}');
      // Ghế nằm trong sơ đồ ghế của xe
      if (trip.vehicle.value != null) {
        final map = VantaiBusinessLogic.generateSeatMap(
            trip.vehicle.value!.type, trip.vehicle.value!.totalSeats);
        for (final tk in tripTickets) {
          expect(map.contains(tk.seatNumber), isTrue,
              reason:
                  'Ghế ${tk.seatNumber} không tồn tại trên xe ${trip.vehicle.value!.plateNumber}');
        }
      }
    }

    // Vé công nợ đã cộng nợ vào khách hàng
    final debtFromTickets = tickets
        .where((t) =>
            t.paymentMethod == TicketPaymentMethod.DEBT &&
            t.status == TicketStatus.PAID)
        .fold<double>(0, (s, t) => s + t.price);
    final seededCustomerDebt =
        customers.fold<double>(0, (s, c) => s + c.currentDebt);
    expect(seededCustomerDebt, greaterThanOrEqualTo(debtFromTickets));

    // ===== Seed lại -> idempotent (không nhân đôi) =====
    await VantaiSeedData.seedIfEmpty(service);
    expect(await db.vantaiRoutes.count(), routes.length);
    expect(await db.vantaiTrips.count(), trips.length);
    expect(await db.vantaiTickets.count(), tickets.length);
  });
}
