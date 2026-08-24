import '../models/vantai_ticket.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_driver.dart';

/// Logic nghiệp vụ thuần của module Vận Tải & Vé (không phụ thuộc DB).
class VantaiBusinessLogic {
  // ---------------------------------------------------------------------------
  // PRD mục 8: Sơ đồ ghế
  // ---------------------------------------------------------------------------

  /// Sinh danh sách ghế theo loại xe.
  ///
  /// Giường nằm (SLEEPER): 2 tầng, mỗi tầng 3 dãy (A/B/C), đánh số
  /// [A01D..AxxD, B01D..] tầng dưới và [A01T..] tầng trên. Tổng số ghế sinh ra
  /// LUÔN ĐÚNG BẰNG totalSeats (không mất ghế như bản cũ).
  /// Còn lại (SEAT/LIMOUSINE/TRUCK): 4 ghế một hàng A01..A04...
  static List<String> generateSeatMap(VehicleType type, int totalSeats) {
    final seats = <String>[];
    if (totalSeats <= 0) return seats;

    if (type == VehicleType.SLEEPER && totalSeats >= 6) {
      final perFloor = (totalSeats / 2).floor();
      final floors = {'D': perFloor};
      if (totalSeats - perFloor > 0) floors['T'] = totalSeats - perFloor;
      for (final entry in floors.entries) {
        final suffix = entry.key;
        final count = entry.value;
        final fullRows = count ~/ 3;
        final remainder = count % 3;
        var n = 0;
        for (var col = 0; col < fullRows; col++) {
          for (var row = 0; row < 3; row++) {
            seats.add(
                '${String.fromCharCode(65 + row)}${(col + 1).toString().padLeft(2, '0')}$suffix');
            n++;
          }
        }
        for (var row = 0; row < remainder; row++) {
          seats.add(
              '${String.fromCharCode(65 + row)}${(fullRows + 1).toString().padLeft(2, '0')}$suffix');
          n++;
        }
        assert(n == count);
      }
      return seats;
    }

    for (var i = 0; i < totalSeats; i++) {
      seats.add(
          '${String.fromCharCode(65 + (i ~/ 4))}${((i % 4) + 1).toString().padLeft(2, '0')}');
    }
    return seats;
  }

  /// Ghế còn bán được = chưa bị RESERVED/PAID (vé CANCELLED nhả ghế).
  static bool isSeatAvailable(List<VantaiTicket> tripTickets, String seat) {
    return !tripTickets.any((t) =>
        t.seatNumber == seat &&
        (t.status == TicketStatus.RESERVED || t.status == TicketStatus.PAID));
  }

  // ---------------------------------------------------------------------------
  // PRD mục 12: Điều xe
  // ---------------------------------------------------------------------------

  /// Xe khả dụng: đang hoạt động + không trùng giờ chuyến khác (±2 tiếng).
  static bool isVehicleFreeForSlot({
    required VantaiVehicle vehicle,
    required DateTime departure,
    required List<({VantaiTrip trip, VantaiVehicle? vehicle})> booked,
    Duration buffer = const Duration(hours: 2),
  }) {
    if (vehicle.status != VehicleStatus.ACTIVE) return false;
    for (final b in booked) {
      final v = b.vehicle;
      final dep = b.trip.departureTime;
      if (v == null || dep == null) continue;
      if (v.vehicleId != vehicle.vehicleId) continue;
      final diff = dep.difference(departure).abs();
      if (diff < buffer * 2) return false; // khung ±buffer quanh giờ chạy
    }
    return true;
  }

  /// Tài xế/phụ xe rảnh trong khung giờ tương tự.
  static bool isDriverFreeForSlot({
    required VantaiDriver driver,
    required DateTime departure,
    required List<({VantaiTrip trip, VantaiDriver? driver})> booked,
    Duration buffer = const Duration(hours: 2),
  }) {
    for (final b in booked) {
      final d = b.driver;
      final dep = b.trip.departureTime;
      if (d == null || dep == null) continue;
      if (d.driverId != driver.driverId) continue;
      final diff = dep.difference(departure).abs();
      if (diff < buffer * 2) return false;
    }
    return true;
  }

  /// Kết quả đề xuất phân xe tự động cho 1 tuyến.
  static ({VantaiVehicle vehicle, VantaiDriver driver, VantaiDriver? assistant})?
      proposeAssignment({
    required List<VantaiVehicle> vehicles,
    required List<VantaiDriver> drivers,
    required List<VantaiVehicle> busyVehicles,
    required List<VantaiDriver> busyDrivers,
    required DateTime departure,
    int minSeats = 1,
  }) {
    VantaiVehicle? pickVehicle;
    for (final v in vehicles) {
      // Kiểm tra trạng thái/sức chở TRƯỚC (bản cũ đặt trong every() nên
      // khi không có chuyến nào bận thì xe bảo dưỡng vẫn được chọn).
      if (v.status != VehicleStatus.ACTIVE) continue;
      if (v.totalSeats < minSeats) continue;
      final busy =
          busyVehicles.any((b) => b.vehicleId == v.vehicleId);
      if (!busy) {
        pickVehicle = v;
        break;
      }
    }
    if (pickVehicle == null) return null;

    VantaiDriver? pickDriver;
    VantaiDriver? pickAssistant;
    for (final d in drivers) {
      final busy = busyDrivers.any((b) => b.driverId == d.driverId);
      if (busy) continue;
      if (d.role == DriverRole.DRIVER && pickDriver == null) {
        pickDriver = d;
      } else if (d.role == DriverRole.ASSISTANT && pickAssistant == null) {
        pickAssistant = d;
      }
    }
    if (pickDriver == null) return null;
    return (vehicle: pickVehicle, driver: pickDriver, assistant: pickAssistant);
  }

  // ---------------------------------------------------------------------------
  // PRD mục 10: Hàng hóa — gợi ý cước phí
  // ---------------------------------------------------------------------------

  /// Cước = 20.000đ + 3.000đ/kg + 150đ/km, làm tròn lên bội 1.000đ.
  static double suggestShipmentFee(double weightKg, double distanceKm) {
    if (weightKg <= 0 || distanceKm <= 0) return 0;
    final raw = 20000.0 + weightKg * 3000 + distanceKm * 150;
    return (raw / 1000).ceilToDouble() * 1000;
  }

  /// Doanh thu thuần từ hàng hóa: cước phí các đơn không hủy.
  /// Thu hộ COD là tiền pass-through (thu rồi trả lại người gửi),
  /// KHÔNG tính vào doanh thu công ty.
  static double netShipmentRevenue(
      Iterable<({double shippingFee, bool cancelled})> shipments) {
    return shipments.fold<double>(
        0, (s, x) => x.cancelled ? s : s + x.shippingFee);
  }

  // ---------------------------------------------------------------------------
  // Cảnh báo giấy tờ (PRD mục 3-4)
  // ---------------------------------------------------------------------------

  static bool expiringSoon(DateTime? expiry, DateTime now,
      {int withinDays = 30}) {
    if (expiry == null) return false;
    final diff = expiry.difference(now).inDays;
    return diff <= withinDays;
  }

  static bool licenseExpiringSoon(VantaiDriver driver, DateTime now,
          {int withinDays = 30}) =>
      expiringSoon(driver.licenseExpiry, now, withinDays: withinDays);

  // ---------------------------------------------------------------------------
  // PRD mục 18: Quỹ
  // ---------------------------------------------------------------------------

  static double cashBalance(Iterable<({bool isThu, double amount})> txs) {
    return txs.fold<double>(0, (s, t) => s + (t.isThu ? t.amount : -t.amount));
  }

  // ---------------------------------------------------------------------------
  // Tiện ích
  // ---------------------------------------------------------------------------

  /// Mã vé ngắn dễ đọc: VT-yymmdd-XXXX
  static String newTicketCode(DateTime now, String seedHex) {
    final ymd =
        '${now.year.toString().substring(2)}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
    return 'VT-$ymd-${seedHex.substring(0, 4).toUpperCase()}';
  }
}
