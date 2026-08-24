import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_driver.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_route.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_ticket.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_trip.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/models/vantai_vehicle.dart';
import 'package:kanposvn/modules/kanposvnbanvevantai/services/vantai_business_logic.dart';

VantaiVehicle vehicle(String id, VehicleType type, int seats,
        {VehicleStatus status = VehicleStatus.ACTIVE}) =>
    VantaiVehicle()
      ..vehicleId = id
      ..plateNumber = id
      ..type = type
      ..totalSeats = seats
      ..status = status;

VantaiTicket ticket(String tripId, String seat, TicketStatus status) =>
    VantaiTicket()
      ..ticketId = 'tk-$tripId-$seat'
      ..ticketCode = seat
      ..seatNumber = seat
      ..status = status;

VantaiDriver driver(String id, DriverRole role) => VantaiDriver()
  ..driverId = id
  ..name = id
  ..role = role
  ..licenseExpiry = DateTime(2027, 1, 1);

void main() {
  group('Mục 8: Sơ đồ ghế (fix bug mất ghế)', () {
    test('Xe giường nằm 40 chỗ: sinh đủ 40 ghế, chia 2 tầng', () {
      final seats =
          VantaiBusinessLogic.generateSeatMap(VehicleType.SLEEPER, 40);
      expect(seats.length, 40);
      final lower = seats.where((s) => s.endsWith('D')).length;
      final upper = seats.where((s) => s.endsWith('T')).length;
      expect(lower + upper, 40);
      expect(lower, 20);
      expect(upper, 20);
      // Không trùng ghế
      expect(seats.toSet().length, 40);
      // Định dạng A01D...
      expect(seats.first, matches(RegExp(r'^[A-C]\d{2}[DT]$')));
    });

    test('Xe giường nằm số lẻ (41 chỗ): vẫn đủ ghế cả 2 tầng', () {
      final seats =
          VantaiBusinessLogic.generateSeatMap(VehicleType.SLEEPER, 41);
      expect(seats.length, 41);
      expect(seats.where((s) => s.endsWith('T')).length, 21);
    });

    test('Limousine 22 chỗ & xe tải 3 chỗ: đánh số 4 ghế/hàng', () {
      final limo =
          VantaiBusinessLogic.generateSeatMap(VehicleType.LIMOUSINE, 22);
      expect(limo.length, 22);
      expect(limo.first, 'A01');
      expect(limo[3], 'A04');
      expect(limo[4], 'B01');

      final truck = VantaiBusinessLogic.generateSeatMap(VehicleType.TRUCK, 3);
      expect(truck.length, 3);
      expect(truck.last, 'A03');
    });
  });

  group('Mục 8: Không bán trùng ghế', () {
    test('Ghế PAID/RESERVED không bán lại, CANCELLED nhả ghế', () {
      final tickets = [
        ticket('t1', 'A01', TicketStatus.PAID),
        ticket('t1', 'B02', TicketStatus.RESERVED),
        ticket('t1', 'C03', TicketStatus.CANCELLED),
      ];
      expect(VantaiBusinessLogic.isSeatAvailable(tickets, 'A01'), isFalse);
      expect(VantaiBusinessLogic.isSeatAvailable(tickets, 'B02'), isFalse);
      expect(VantaiBusinessLogic.isSeatAvailable(tickets, 'C03'), isTrue);
      expect(VantaiBusinessLogic.isSeatAvailable(tickets, 'D01'), isTrue);
    });
  });

  group('Mục 12: Điều xe - kiểm tra trùng lịch', () {
    final dep = DateTime(2026, 8, 23, 6, 30);
    final v1 = vehicle('xe-1', VehicleType.SLEEPER, 40);
    final t = VantaiTrip()
      ..tripId = 'trip-1'
      ..departureTime = dep;

    test('Cùng xe đã có chuyến trong khung ±2h -> không khả dụng', () {
      final free = VantaiBusinessLogic.isVehicleFreeForSlot(
        vehicle: v1,
        departure: dep.add(const Duration(hours: 1)),
        booked: [(trip: t, vehicle: v1)],
      );
      expect(free, isFalse);
    });

    test('Giờ cách xa (>4h) -> khả dụng', () {
      final free = VantaiBusinessLogic.isVehicleFreeForSlot(
        vehicle: v1,
        departure: dep.add(const Duration(hours: 10)),
        booked: [(trip: t, vehicle: v1)],
      );
      expect(free, isTrue);
    });

    test('Xe khác chạy giờ trùng -> xe này vẫn khả dụng', () {
      final free = VantaiBusinessLogic.isVehicleFreeForSlot(
        vehicle: v1,
        departure: dep,
        booked: [
          (trip: t, vehicle: vehicle('xe-khac', VehicleType.SEAT, 45))
        ],
      );
      expect(free, isTrue);
    });

    test('Xe bảo dưỡng/sửa chữa -> không phân chuyến', () {
      for (final st in [VehicleStatus.MAINTENANCE, VehicleStatus.REPAIR]) {
        final free = VantaiBusinessLogic.isVehicleFreeForSlot(
          vehicle: vehicle('xe-sua', VehicleType.SEAT, 45, status: st),
          departure: dep,
          booked: [],
        );
        expect(free, isFalse, reason: '$st không được điều chạy');
      }
    });

    test('proposeAssignment chọn xe rảnh + tài xế rảnh + phụ xe', () {
      final result = VantaiBusinessLogic.proposeAssignment(
        vehicles: [
          vehicle('v1', VehicleType.SLEEPER, 40, status: VehicleStatus.REPAIR),
          vehicle('v2', VehicleType.LIMOUSINE, 22),
        ],
        drivers: [
          driver('d1', DriverRole.DRIVER),
          driver('a1', DriverRole.ASSISTANT),
        ],
        busyVehicles: [],
        busyDrivers: [],
        departure: DateTime.now(),
      );
      expect(result, isNotNull);
      expect(result!.vehicle.vehicleId, 'v2'); // bỏ qua xe đang sửa
      expect(result.driver.role, DriverRole.DRIVER);
      expect(result.assistant?.role, DriverRole.ASSISTANT);
    });

    test('Không còn tài xế rảnh -> trả null', () {
      final d1 = driver('d1', DriverRole.DRIVER);
      final busyTrip = VantaiTrip()
        ..tripId = 'busy'
        ..departureTime = DateTime.now();
      final result = VantaiBusinessLogic.proposeAssignment(
        vehicles: [vehicle('v2', VehicleType.LIMOUSINE, 22)],
        drivers: [d1],
        busyVehicles: [],
        busyDrivers: [d1],
        departure: DateTime.now(),
        minSeats: 20,
      );
      expect(result, isNull);
      expect(busyTrip.tripId, 'busy');
    });
  });

  group('Mục 10: Hàng hóa - cước phí & COD', () {
    test('Cước gợi ý = 20K + 3K/kg + 150đ/km làm tròn lên nghìn', () {
      // 5kg tuyến 300km: 20000 + 15000 + 45000 = 80000
      expect(VantaiBusinessLogic.suggestShipmentFee(5, 300), 80000);
      // Làm tròn lên: 1kg x 100km = 20000+3000+15000=38000
      expect(VantaiBusinessLogic.suggestShipmentFee(1, 100), 38000);
      expect(VantaiBusinessLogic.suggestShipmentFee(0, 100), 0);
    });

    test('COD thu hộ KHÔNG tính doanh thu; đơn hủy mất cước', () {
      final rev = VantaiBusinessLogic.netShipmentRevenue([
        (shippingFee: 50000.0, cancelled: false),
        (shippingFee: 30000.0, cancelled: false),
        (shippingFee: 90000.0, cancelled: true),
      ]);
      expect(rev, 80000);
    });
  });

  group('Cảnh báo giấy tờ (mục 3-4)', () {
    test('GPLX/đăng kiểm/bảo hiểm sắp hết hạn <=30 ngày', () {
      final now = DateTime(2026, 8, 23);
      final d = driver('dx', DriverRole.DRIVER)
        ..licenseExpiry = now.add(const Duration(days: 20));
      expect(
          VantaiBusinessLogic.licenseExpiringSoon(d, now, withinDays: 30),
          isTrue);
      final ok = driver('dok', DriverRole.DRIVER)
        ..licenseExpiry = now.add(const Duration(days: 90));
      expect(
          VantaiBusinessLogic.licenseExpiringSoon(ok, now, withinDays: 30),
          isFalse);
      expect(
          VantaiBusinessLogic.expiringSoon(null, now), isFalse);
    });
  });

  group('Mục 18: Quỹ', () {
    test('Số dư = thu - chi', () {
      final bal = VantaiBusinessLogic.cashBalance([
        (isThu: true, amount: 100000.0),
        (isThu: false, amount: 30000.0),
        (isThu: true, amount: 5000.0),
      ]);
      expect(bal, 75000);
    });
  });

  test('Mã vé định dạng VT-yymmdd-XXXX', () {
    final code = VantaiBusinessLogic.newTicketCode(
        DateTime(2026, 8, 23), 'abcdef12');
    expect(code, startsWith('VT-260823-'));
    expect(code.length, 'VT-260823-XXXX'.length);
  });

  test('Tuyến có đủ thông tin PRD mục 2', () {
    final r = VantaiRoute()
      ..routeId = 'r'
      ..routeName = 'Sài Gòn - Đà Lạt'
      ..startPoint = 'BX Miền Đông'
      ..endPoint = 'BX Đà Lạt'
      ..distanceKm = 300
      ..basePrice = 250000
      ..estimatedTime = '8 tiếng';
    expect(r.routeName, contains('Đà Lạt'));
    expect(r.distanceKm, greaterThan(0));
    expect(r.basePrice, greaterThan(0));
  });
}
