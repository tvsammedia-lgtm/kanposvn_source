import 'package:uuid/uuid.dart';
import 'vantai_isar_service.dart';
import 'vantai_business_logic.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_expense.dart';
import '../models/vantai_driver.dart';
import '../models/vantai_supplier.dart';
import '../models/vantai_cashbook.dart';

/// Bộ dữ liệu mẫu đầy đủ theo PRD quanlyvantaibanve.md:
/// - Tuyến ví dụ: Bắc Nam, Đồng Nai<->Vũng Tàu, An Giang<->TP.HCM,
///   Sài Gòn<->Đà Lạt, Sài Gòn<->Cần Thơ (mục 1)
/// - Đội xe giường nằm / ghế ngồi / limousine / xe tải, có xe bảo dưỡng &
///   sửa chữa, km chạy, đăng kiểm/bảo hiểm (mục 3)
/// - Tài xế + phụ xe: GPLX, hạng bằng, hạn, lương, phụ cấp (mục 4-5)
/// - Lịch chạy 14 ngày qua + hôm nay đang chạy/sắp chạy (mục 6)
/// - Vé bán đủ phương thức tiền mặt/CK/QR/công nợ, giữ chỗ, hủy (mục 7-8)
/// - Khách hàng cá nhân & doanh nghiệp có công nợ (mục 9)
/// - Hàng hóa COD + luồng kho trung chuyển (mục 10-11)
/// - Chi phí đủ khoản mục (mục 14), quỹ thu/chi (mục 18), NCC công nợ (mục 17)
class VantaiSeedData {
  /// Bộ sinh giả lập xác định (cùng một dữ liệu mỗi lần chạy test).
  static int _rngState = 20260823;
  static int _nextRand() {
    _rngState = (_rngState * 1103515245 + 12345) & 0x7FFFFFFF;
    return _rngState;
  }

  static Future<void> seedIfEmpty(VantaiIsarService service) async {
    final db = await service.db;
    final count = await db.vantaiRoutes.count();
    if (count > 0) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    await db.writeTxn(() async {
      // ================= MỤC 2: TUYẾN XE =================
      VantaiRoute route(String name, String from, String to, double km,
              double price, String time) =>
          VantaiRoute()
            ..routeId = const Uuid().v4()
            ..routeName = name
            ..startPoint = from
            ..endPoint = to
            ..distanceKm = km
            ..basePrice = price
            ..estimatedTime = time;

      final sgDaLat =
          route('Sài Gòn - Đà Lạt', 'BX Miền Đông', 'BX Đà Lạt', 300, 250000, '8 tiếng');
      final sgCanTho =
          route('Sài Gòn - Cần Thơ', 'BX Miền Tây', 'BX CT Trung Tâm', 170, 160000, '4 tiếng');
      final dnVt =
          route('Đồng Nai - Vũng Tàu', 'Biên Hòa', 'BX Vũng Tàu', 100, 120000, '2.5 tiếng');
      final agSg =
          route('An Giang - TP.HCM', 'Long Xuyên', 'BX Miền Tây', 190, 180000, '5 tiếng');
      final bacNam =
          route('Bắc Nam Sài Gòn - Hà Nội', 'BX Miền Đông', 'BX Giáp Bát', 1700, 750000, '30 tiếng');
      final routes = [sgDaLat, sgCanTho, dnVt, agSg, bacNam];
      await db.vantaiRoutes.putAll(routes);

      // ================= MỤC 3: XE =================
      VantaiVehicle vehicle(String plate, VehicleType type, int seats,
              String brand, int year, double km, VehicleStatus status,
              {bool gps = true,
              DateTime? dangKiem,
              DateTime? baoHiem}) =>
          VantaiVehicle()
            ..vehicleId = const Uuid().v4()
            ..plateNumber = plate
            ..type = type
            ..totalSeats = seats
            ..brand = brand
            ..manufactureYear = year
            ..odometerKm = km
            ..gpsEnabled = gps
            ..inspectionExpiry = dangKiem
            ..insuranceExpiry = baoHiem
            ..status = status;

      final v1 = vehicle('51B-123.45', VehicleType.SLEEPER, 40,
          'Thaco Mobihome', 2021, 385000, VehicleStatus.ACTIVE,
          dangKiem: today.add(const Duration(days: 200)),
          baoHiem: today.add(const Duration(days: 120)));
      final v2 = vehicle('51B-678.90', VehicleType.LIMOUSINE, 22,
          'Hyundai Universe Solati', 2022, 210000, VehicleStatus.ACTIVE,
          dangKiem: today.add(const Duration(days: 20)), // sắp hết đăng kiểm
          baoHiem: today.add(const Duration(days: 90)));
      final v3 = vehicle('51B-456.78', VehicleType.SLEEPER, 40,
          'Thaco Mobihome', 2020, 512000, VehicleStatus.MAINTENANCE, // bảo dưỡng
          gps: false,
          dangKiem: today.add(const Duration(days: 300)),
          baoHiem: today.add(const Duration(days: 60)));
      final v4 = vehicle('60C-222.33', VehicleType.SEAT, 45,
          'Hino Liesse II', 2019, 640000, VehicleStatus.REPAIR, // đang sửa
          gps: false,
          dangKiem: today.add(const Duration(days: 45)),
          baoHiem: today.add(const Duration(days: 15))); // sắp hết bảo hiểm
      final v5 = vehicle('51B-999.99', VehicleType.LIMOUSINE, 28,
          'Ford Transit Limousine', 2023, 95000, VehicleStatus.ACTIVE,
          dangKiem: today.add(const Duration(days: 350)),
          baoHiem: today.add(const Duration(days: 250)));
      final v6 = vehicle('70B-015.66', VehicleType.TRUCK, 3,
          'Isuzu NPR', 2021, 158000, VehicleStatus.ACTIVE,
          gps: true,
          dangKiem: today.add(const Duration(days: 150)),
          baoHiem: today.add(const Duration(days: 100)));
      final vehicles = [v1, v2, v3, v4, v5, v6];
      await db.vantaiVehicles.putAll(vehicles);

      // ================= MỤC 4-5: TÀI XẾ & PHỤ XE =================
      VantaiDriver driver(String name, String phone, DriverRole role,
              {String gplx = '',
              String hang = 'E',
              DateTime? hanGplx,
              double luong = 12000000,
              double phuCap = 1500000}) =>
          VantaiDriver()
            ..driverId = const Uuid().v4()
            ..name = name
            ..phone = phone
            ..cccd = '079${_nextRand().toString().substring(0, 9)}'
            ..licenseNumber = gplx
            ..licenseClass = role == DriverRole.ASSISTANT ? 'B2' : hang
            ..licenseExpiry = hanGplx
            ..baseSalary = luong
            ..allowance = phuCap
            ..role = role;

      final d1 = driver('Nguyễn Văn Bình', '0903111222', DriverRole.DRIVER,
          gplx: '901E00123',
          hanGplx: today.add(const Duration(days: 400)));
      final d2 = driver('Trần Văn Cường', '0918222333', DriverRole.DRIVER,
          gplx: '901E00456',
          hanGplx: today.add(const Duration(days: 25))); // sắp hết hạn GPLX
      final d3 = driver('Lê Hoàng Đức', '0977333444', DriverRole.DRIVER,
          gplx: '901E00789',
          hanGplx: today.add(const Duration(days: 700)),
          luong: 13000000);
      final d4 = driver('Phạm Minh Em', '0988444555', DriverRole.DRIVER,
          gplx: '901E01024',
          hanGplx: today.add(const Duration(days: 500)));
      final d5 = driver('Hoàng Văn Phúc', '0968555666', DriverRole.DRIVER,
          gplx: '901E01357',
          hanGplx: today.add(const Duration(days: 320)),
          luong: 12500000);
      final a1 = driver('Ngô Quang Hùng', '0356777888', DriverRole.ASSISTANT,
          luong: 7000000, phuCap: 800000);
      final a2 = driver('Bùi Thanh Hải', '0346888999', DriverRole.ASSISTANT,
          luong: 7000000, phuCap: 800000);
      final drivers = [d1, d2, d3, d4, d5, a1, a2];
      await db.vantaiDrivers.putAll(drivers);

      // ================= MỤC 9: KHÁCH HÀNG =================
      final khDoanh = VantaiCustomer()
        ..customerId = const Uuid().v4()
        ..name = 'Công Ty TNHH Vải Thiết An Phát'
        ..phone = '02838111222'
        ..cccd = ''
        ..currentDebt = 4500000;
      final khDl = VantaiCustomer()
        ..customerId = const Uuid().v4()
        ..name = 'Tour DL Việt Du'
        ..phone = '02838333444'
        ..currentDebt = 2800000;
      final c1 = VantaiCustomer()
        ..customerId = const Uuid().v4()
        ..name = 'Nguyễn Thị Lan'
        ..phone = '0903123456';
      final c2 = VantaiCustomer()
        ..customerId = const Uuid().v4()
        ..name = 'Trần Văn Hòa'
        ..phone = '0918765432';
      final c3 = VantaiCustomer()
        ..customerId = const Uuid().v4()
        ..name = 'Lê Thị Mỹ'
        ..phone = '0977111222';
      final customers = [khDoanh, khDl, c1, c2, c3];
      await db.vantaiCustomers.putAll(customers);

      // ================= MỤC 17: NHÀ CUNG CẤP =================
      VantaiSupplier supplier(String name, String phone, String cat,
              double debt) =>
          VantaiSupplier()
            ..supplierId = const Uuid().v4()
            ..name = name
            ..phone = phone
            ..category = cat
            ..debt = debt;
      final suppliers = [
        supplier('Gara Thanh Phong', '0911333444', 'Gara', 8500000),
        supplier('Xăng Dầu Petrolimex KX-01', '0912555666', 'Xăng dầu', 15200000),
        supplier('Lốp Xe Casumina QL1A', '0913777888', 'Lốp xe', 3600000),
        supplier('Phụ Tùng Hino Việt Nam', '0914999000', 'Phụ tùng', 2100000),
      ];
      await db.vantaiSuppliers.putAll(suppliers);

      // ================= MỤC 6: LỊCH CHạy + MỤC 7-8: VÉ =================
      final trips = <VantaiTrip>[];
      final tickets = <VantaiTicket>[];

      void makeTrip({
        required VantaiRoute r,
        required VantaiVehicle v,
        required VantaiDriver drv,
        VantaiDriver? assistant,
        required DateTime departure,
        required TripStatus status,
        DateTime? arrival,
        int soldSeats = 0,
      }) {
        final t = VantaiTrip()
          ..tripId = const Uuid().v4()
          ..departureTime = departure
          ..arrivalTime = arrival
          ..status = status
          ..driverName = drv.name
          ..assistantName = assistant?.name ?? '';
        t.route.value = r;
        t.vehicle.value = v;
        t.driver.value = drv;
        if (assistant != null) t.assistant.value = assistant;
        trips.add(t);

        // Bán vé trên sơ đồ ghế thật của xe -> không trùng ghế
        if (soldSeats > 0 && status != TripStatus.CANCELLED) {
          final map = VantaiBusinessLogic.generateSeatMap(v.type, v.totalSeats);
          final usable = map.length;
          final payCycle = [
            TicketPaymentMethod.CASH,
            TicketPaymentMethod.QR,
            TicketPaymentMethod.TRANSFER,
            TicketPaymentMethod.CASH,
            TicketPaymentMethod.DEBT,
            TicketPaymentMethod.CASH,
          ];
          // FIX: ghế chỉ trùng trong phạm vi CHUYẾN này (bản cũ so với toàn
          // hệ thống khiến chuyến sau không bán được vé).
          final usedSeats = <String>{};
          var attempts = 0;
          var i = 0;
          while (i < soldSeats && attempts < soldSeats * 20) {
            attempts++;
            final seatIdx = _nextRand() % usable;
            final seat = map[seatIdx];
            if (!usedSeats.add(seat)) continue; // trùng -> chọn ghế khác
            final seatPos = i;
            i++;
            var st = TicketStatus.PAID;
            var pay = payCycle[(seatPos + trips.length) % payCycle.length];
            if (seatPos == 0 && trips.length % 4 == 0) {
              st = TicketStatus.RESERVED;
              pay = TicketPaymentMethod.CASH;
            }
            if (seatPos == 1 && trips.length % 9 == 0) {
              st = TicketStatus.CANCELLED;
            }
            final cust = customers[_nextRand() % customers.length];
            final price =
                r.basePrice * (v.type == VehicleType.LIMOUSINE ? 1.4 : 1.0);
            tickets.add(VantaiTicket()
              ..ticketId = const Uuid().v4()
              ..ticketCode = 'VT-${t.tripId.substring(0, 4).toUpperCase()}'
                  '${seat.replaceAll(RegExp(r'[^A-Z0-9]'), '')}'
              ..departureTime = departure
              ..seatNumber = seat
              ..price = price
              ..status = st
              ..paymentMethod = pay
              ..bookingDate = departure.subtract(const Duration(hours: 5))
              ..passengerName = cust.name
              ..passengerPhone = cust.phone);
            tickets.last.trip.value = t;
            tickets.last.route.value = r;
            tickets.last.vehicle.value = v;
            tickets.last.customer.value = cust;
            // Mục 16: vé công nợ -> cộng thẳng nợ vào đối tượng khách
            // (không đọc lại link trong transaction)
            if (pay == TicketPaymentMethod.DEBT && st == TicketStatus.PAID) {
              cust.currentDebt += price;
            }
          }
        }
      }

      // 14 ngày qua: mỗi ngày 3 chuyến hoàn thành (đủ tuyến/xe/tài xế)
      final activeVehicles = [v1, v2, v5, v6];
      final activeDrivers = [d1, d2, d3, d4, d5];
      for (var dayOffset = 14; dayOffset >= 1; dayOffset--) {
        final day = today.subtract(Duration(days: dayOffset));
        for (var slot = 0; slot < 3; slot++) {
          final r = routes[slot % routes.length];
          final v = activeVehicles[(dayOffset + slot) % activeVehicles.length];
          final drv =
              activeDrivers[(dayOffset * 2 + slot) % activeDrivers.length];
          final asst = slot % 2 == 0 ? a1 : a2;
          final dep = DateTime(day.year, day.month, day.day, 6 + slot * 5, 30);
          makeTrip(
            r: r,
            v: v,
            drv: drv,
            assistant: asst,
            departure: dep,
            arrival: dep.add(Duration(hours: 2 + (slot * 3))),
            status: TripStatus.COMPLETED,
            soldSeats: 4 + ((dayOffset + slot) % 6),
          );
        }
      }

      // Hôm nay: 1 chuyến ĐANG CHẠY + 2 chuyến SẮP CHẠY + 1 hủy
      makeTrip(
          r: sgDaLat,
          v: v1,
          drv: d1,
          assistant: a1,
          departure: now.subtract(const Duration(hours: 1)),
          arrival: now.add(const Duration(hours: 7)),
          status: TripStatus.RUNNING,
          soldSeats: 7);
      makeTrip(
          r: sgCanTho,
          v: v2,
          drv: d3,
          assistant: a2,
          departure: today.add(const Duration(hours: 14)),
          arrival: today.add(const Duration(hours: 18)),
          status: TripStatus.SCHEDULED,
          soldSeats: 5);
      makeTrip(
          r: dnVt,
          v: v5,
          drv: d4,
          departure: today.add(const Duration(hours: 16)),
          arrival: today.add(const Duration(hours: 18, minutes: 30)),
          status: TripStatus.SCHEDULED,
          soldSeats: 3);
      makeTrip(
          r: bacNam,
          v: v1,
          drv: d5,
          assistant: a1,
          departure: today.add(const Duration(hours: 18)),
          status: TripStatus.CANCELLED);

      // Ngày mai: 1 chuyến mở bán trước
      makeTrip(
          r: agSg,
          v: v2,
          drv: d2,
          assistant: a2,
          departure: today.add(const Duration(days: 1, hours: 7)),
          arrival: today.add(const Duration(days: 1, hours: 12)),
          status: TripStatus.SCHEDULED,
          soldSeats: 4);

      await db.vantaiTrips.putAll(trips);
      for (final t in trips) {
        await t.route.save();
        await t.vehicle.save();
        await t.driver.save();
        // KHÔNG đọc .value trong transaction (Isar cấm loadSync lồng nhau) -
        // dùng assistantName làm dấu hiệu có phụ xe.
        if (t.assistantName.isNotEmpty) await t.assistant.save();
      }

      await db.vantaiTickets.putAll(tickets);
      for (final tk in tickets) {
        await tk.trip.save();
        await tk.route.save();
        await tk.vehicle.save();
        await tk.customer.save();
      }
      // Lưu công nợ khách (đã cộng khi tạo vé công nợ)
      await db.vantaiCustomers.putAll(customers);

      // ================= MỤC 10-11: HÀNG HÓA =================
      final shipments = <VantaiShipment>[];
      VantaiShipment shipment(VantaiRoute r, String sender, String sPhone,
          String receiver, String rPhone, double kg, bool cod,
          ShipmentStatus st, DateTime created) {
        return VantaiShipment()
          ..shipmentId = const Uuid().v4()
          ..shipmentCode =
              'SH-${created.difference(today).inDays.abs()}${shipments.length.toString().padLeft(2, '0')}'
          ..senderName = sender
          ..senderPhone = sPhone
          ..receiverName = receiver
          ..receiverPhone = rPhone
          ..weightKg = kg
          ..shippingFee =
              VantaiBusinessLogic.suggestShipmentFee(kg, r.distanceKm)
          ..codAmount = cod ? 500000 + (_nextRand() % 10) * 100000 : 0
          ..status = st
          ..createdAt = created;
      }

      shipmentSender(int i) => customers[i % customers.length];
      for (var i = 0; i < 12; i++) {
        final r = routes[i % routes.length];
        final sender = shipmentSender(i);
        final st = switch (i % 6) {
          0 => ShipmentStatus.PENDING,
          1 => ShipmentStatus.IN_TRANSIT,
          2 => ShipmentStatus.AT_WAREHOUSE,
          _ => ShipmentStatus.DELIVERED,
        };
        final created = today.subtract(Duration(days: 12 - i));
        shipments.add(shipment(
          r,
          sender.name,
          sender.phone,
          'Người nhận ${i + 1}',
          '09${(_nextRand() % 900000000 + 100000000)}',
          2.0 + (i % 5) * 3.5,
          i % 3 == 0,
          st,
          created,
        ));
      }
      shipments[0].route.value = sgDaLat;
      for (var i = 0; i < shipments.length; i++) {
        shipments[i].route.value = routes[i % routes.length];
      }
      await db.vantaiShipments.putAll(shipments);
      for (final s in shipments) {
        await s.route.save();
      }

      // ================= MỤC 14: CHI PHÍ =================
      final expenses = <VantaiExpense>[];
      void expense(ExpenseCategory cat, double amount, String desc,
          DateTime date) {
        expenses.add(VantaiExpense()
          ..expenseId = const Uuid().v4()
          ..category = cat
          ..amount = amount
          ..description = desc
          ..date = date);
      }

      // Dầu & cầu đường theo tuần trong tháng
      for (var w = 3; w >= 0; w--) {
        expense(ExpenseCategory.FUEL, 4200000 + w * 150000,
            'Nhập dầu tuần ${4 - w}', today.subtract(Duration(days: w * 7 + 1)));
        expense(ExpenseCategory.TOLL, 1350000, 'Vé cầu đường cao tốc tuần ${4 - w}',
            today.subtract(Duration(days: w * 7 + 2)));
        expense(ExpenseCategory.DEPOT, 2500000, 'Thuế bến bãi tháng',
            today.subtract(Duration(days: w * 7 + 3)));
      }
      expense(ExpenseCategory.SALARY, 62500000, 'Lương tài xế + phụ xe kỳ 1',
          today.subtract(const Duration(days: 5)));
      expense(ExpenseCategory.SOCIAL_INSURANCE, 9800000, 'BHXH quý này',
          today.subtract(const Duration(days: 8)));
      expense(ExpenseCategory.MAINTENANCE, 12500000, 'Sửa chữa máy Hino 60C-222.33',
          today.subtract(const Duration(days: 3)));
      expense(ExpenseCategory.MAINTENANCE, 3800000, 'Bảo dưỡng định kỳ Thaco 51B-456.78',
          today.subtract(const Duration(days: 2)));
      expense(ExpenseCategory.OFFICE, 2200000, 'Văn phòng phẩm + in ấn vé',
          today.subtract(const Duration(days: 10)));
      expense(ExpenseCategory.UTILITIES, 3400000, 'Điện nước văn phòng + bến',
          today.subtract(const Duration(days: 9)));
      expense(ExpenseCategory.INTERNET, 800000, 'Wifi + GPS sim dữ liệu',
          today.subtract(const Duration(days: 6)));
      expense(ExpenseCategory.MARKETING, 6000000, 'Facebook Ads + banner bến',
          today.subtract(const Duration(days: 4)));
      expense(ExpenseCategory.DEPRECIATION, 28000000, 'Khấu hao đội xe tháng',
          today.subtract(const Duration(days: 12)));
      await db.vantaiExpenses.putAll(expenses);

      // ================= MỤC 18: QUỸ =================
      final cashTxs = <VantaiCashTx>[
        VantaiCashTx()
          ..txId = const Uuid().v4()
          ..type = CashTxType.THU
          ..account = CashAccount.CASH
          ..amount = 50000000
          ..note = 'Số dư quỹ đầu kỳ'
          ..createdAt = today.subtract(const Duration(days: 14)),
        VantaiCashTx()
          ..txId = const Uuid().v4()
          ..type = CashTxType.THU
          ..account = CashAccount.BANK
          ..amount = 120000000
          ..note = 'Tiền gửi ngân hàng đầu kỳ'
          ..createdAt = today.subtract(const Duration(days: 14)),
        VantaiCashTx()
          ..txId = const Uuid().v4()
          ..type = CashTxType.THU
          ..account = CashAccount.CASH
          ..amount = 18500000
          ..note = 'Thu vé tuyến Sài Gòn - Đà Lạt ngày 01'
          ..refCode = 'VE-DALAT'
          ..createdAt = today.subtract(const Duration(days: 6)),
        VantaiCashTx()
          ..txId = const Uuid().v4()
          ..type = CashTxType.CHI
          ..account = CashAccount.CASH
          ..amount = 4200000
          ..note = 'Chi dầu tuần gần nhất'
          ..refCode = 'PC-DAU'
          ..createdAt = today.subtract(const Duration(days: 1)),
        VantaiCashTx()
          ..txId = const Uuid().v4()
          ..type = CashTxType.CHI
          ..account = CashAccount.BANK
          ..amount = 62500000
          ..note = 'Chuyển lương tài xế kỳ 1'
          ..refCode = 'PC-LUONG'
          ..createdAt = today.subtract(const Duration(days: 5)),
      ];
      await db.vantaiCashTxs.putAll(cashTxs);
    });
  }
}
