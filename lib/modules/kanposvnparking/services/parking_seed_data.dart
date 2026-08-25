import 'package:isar/isar.dart';
import '../models/camera.dart';
import '../models/monthly_ticket.dart';
import '../models/parking_area.dart';
import '../models/parking_customer.dart';
import '../models/parking_finance.dart';
import '../models/parking_tariff.dart';
import '../models/parking_ticket.dart';
import '../models/rental.dart';
import '../models/vehicle.dart';

/// Bộ dữ liệu mẫu Kan Parking theo kanposvnparking.md.
class ParkingSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.parkingAreas.count() > 0) return;
    final now = DateTime.now();

    await db.writeTxn(() async {
      // ── §5. Quản lý bãi xe ──────────────────────────────────────
      final areas = <ParkingArea>[
        ParkingArea()
          ..areaId = 'khu_a'
          ..name = 'Khu A - Ô tô (Tầng trệt)'
          ..areaCode = 'A'
          ..totalSpots = 200
          ..usedSpots = 0
          ..allowedVehicleTypes = 'car,electric_car',
        ParkingArea()
          ..areaId = 'khu_b'
          ..name = 'Khu B - Xe máy'
          ..areaCode = 'B'
          ..totalSpots = 300
          ..usedSpots = 0
          ..allowedVehicleTypes = 'motorbike,electric_bike,bicycle',
        ParkingArea()
          ..areaId = 'ham_b1'
          ..name = 'Tầng hầm B1 - Ô tô'
          ..areaCode = 'HB1'
          ..totalSpots = 150
          ..usedSpots = 0
          ..allowedVehicleTypes = 'car,electric_car',
      ];
      await db.parkingAreas.putAll(areas);

      // ── §6. Bảng giá trông giữ ──────────────────────────────────
      await db.parkingTariffs.putAll([
        ParkingTariff()
          ..tariffId = 'gia_motorbike'
          ..vehicleType = 'motorbike'
          ..firstHourPrice = 5000
          ..nextHourPrice = 3000
          ..dailyMaxPrice = 30000
          ..note = 'Xe máy',
        ParkingTariff()
          ..tariffId = 'gia_car'
          ..vehicleType = 'car'
          ..firstHourPrice = 15000
          ..nextHourPrice = 10000
          ..dailyMaxPrice = 80000
          ..note = 'Ô tô',
        ParkingTariff()
          ..tariffId = 'gia_electric_bike'
          ..vehicleType = 'electric_bike'
          ..firstHourPrice = 5000
          ..nextHourPrice = 3000
          ..dailyMaxPrice = 25000,
        ParkingTariff()
          ..tariffId = 'gia_electric_car'
          ..vehicleType = 'electric_car'
          ..firstHourPrice = 15000
          ..nextHourPrice = 10000
          ..dailyMaxPrice = 80000,
      ]);

      // ── §11. Camera quan sát ────────────────────────────────────
      await db.parkingCameras.putAll([
        ParkingCamera()
          ..cameraId = 'cam_vao_1'
          ..name = 'Camera cổng vào 1'
          ..ipAddress = '192.168.1.101'
          ..rtspUrl = 'rtsp://192.168.1.101/stream1'
          ..type = 'in'
          ..status = 'active',
        ParkingCamera()
          ..cameraId = 'cam_ra_1'
          ..name = 'Camera cổng ra 1'
          ..ipAddress = '192.168.1.102'
          ..rtspUrl = 'rtsp://192.168.1.102/stream1'
          ..type = 'out'
          ..status = 'active',
        ParkingCamera()
          ..cameraId = 'cam_bai_b'
          ..name = 'Camera khu B'
          ..ipAddress = '192.168.1.103'
          ..rtspUrl = 'rtsp://192.168.1.103/stream1'
          ..type = 'area'
          ..status = 'active',
        ParkingCamera()
          ..cameraId = 'cam_vp'
          ..name = 'Camera văn phòng'
          ..ipAddress = '192.168.1.104'
          ..rtspUrl = ''
          ..type = 'area'
          ..status = 'offline', // §16 -> cảnh báo camera offline
      ]);

      // ── §4. Phương tiện ─────────────────────────────────────────
      final vehicles = <ParkingVehicle>[
        ParkingVehicle()
          ..vehicleId = 'vh_29a12345'
          ..licensePlate = '29A-123.45'
          ..vehicleType = 'motorbike'
          ..brand = 'Honda'
          ..model = 'Vision'
          ..color = 'Trắng'
          ..status = 'active'
          ..customerId = 'kh_vana',
        ParkingVehicle()
          ..vehicleId = 'vh_59x1ab123'
          ..licensePlate = '59X1-AB123'
          ..vehicleType = 'car'
          ..brand = 'Toyota'
          ..model = 'Vios'
          ..color = 'Bạc'
          ..status = 'active'
          ..customerId = 'kh_thib',
        ParkingVehicle()
          ..vehicleId = 'vh_51k99999'
          ..licensePlate = '51K-999.99'
          ..vehicleType = 'motorbike'
          ..brand = 'Yamaha'
          ..model = 'Exciter'
          ..color = 'Đen'
          ..status = 'blocked', // §12 blacklist -> báo động
        // Xe dành cho thuê (§8).
        ParkingVehicle()
          ..vehicleId = 'vh_thue_wave'
          ..licensePlate = '60C1-777.77'
          ..vehicleType = 'motorbike'
          ..brand = 'Honda'
          ..model = 'Wave Alpha'
          ..color = 'Đỏ'
          ..status = 'active',
        ParkingVehicle()
          ..vehicleId = 'vh_thue_vinfast'
          ..licensePlate = '60D1-888.88'
          ..vehicleType = 'electric_car'
          ..brand = 'VinFast'
          ..model = 'VF e34'
          ..color = 'Xanh'
          ..status = 'active',
      ];
      await db.parkingVehicles.putAll(vehicles);

      // ── §3. Khách hàng ──────────────────────────────────────────
      await db.parkingCustomers.putAll([
        ParkingCustomer()
          ..customerId = 'kh_vana'
          ..name = 'Nguyễn Văn A'
          ..cccd = '079203001234'
          ..phone = '0901112233'
          ..email = 'vana@gmail.com'
          ..address = '12 Nguyễn Trãi, Q.5, TP.HCM'
          ..licensePlate = '29A-123.45'
          ..createdAt = now.subtract(const Duration(days: 90)),
        ParkingCustomer()
          ..customerId = 'kh_thib'
          ..name = 'Trần Thị B'
          ..cccd = '079203005678'
          ..phone = '0912223344'
          ..email = 'thib@gmail.com'
          ..address = '34 Lý Thường Kiệt, Q.10, TP.HCM'
          ..licensePlate = '59X1-AB123'
          ..debtBalance = 0
          ..createdAt = now.subtract(const Duration(days: 60)),
        ParkingCustomer()
          ..customerId = 'kh_lec'
          ..name = 'Lê Văn C'
          ..cccd = '079203009012'
          ..phone = '0923334455'
          ..email = ''
          ..address = '56 Cách Mạng Tháng 8, Q.3, TP.HCM'
          ..note = 'Khách thuê xe dài hạn'
          ..createdAt = now.subtract(const Duration(days: 30)),
      ]);

      // ── §7. Vé tháng / quý / năm ────────────────────────────────
      await db.parkingMonthlyTickets.putAll([
        ParkingMonthlyTicket()
          ..ticketId = 'mt_vana'
          ..customerName = 'Nguyễn Văn A'
          ..customerPhone = '0901112233'
          ..licensePlate = '29A-123.45'
          ..vehicleType = 'motorbike'
          ..startDate = now.subtract(const Duration(days: 20))
          ..endDate = now.add(const Duration(days: 10)) // còn hạn
          ..feeAmount = 90000 * 1
          ..status = 'active',
        ParkingMonthlyTicket()
          ..ticketId = 'mt_thib_quy'
          ..customerName = 'Trần Thị B'
          ..customerPhone = '0912223344'
          ..licensePlate = '59X1-AB123'
          ..vehicleType = 'car'
          ..startDate = now.subtract(const Duration(days: 85))
          ..endDate = now.add(const Duration(days: 5)) // §16 sắp hết hạn
          ..feeAmount = 700000 * 3
          ..status = 'active',
        ParkingMonthlyTicket()
          ..ticketId = 'mt_cu_han'
          ..customerName = 'Phạm D'
          ..customerPhone = '0934445566'
          ..licensePlate = '43H1-555.55'
          ..vehicleType = 'motorbike'
          ..startDate = now.subtract(const Duration(days: 70))
          ..endDate = now.subtract(const Duration(days: 10)) // đã hết hạn
          ..feeAmount = 90000
          ..status = 'expired',
      ]);

      // ── §6. Vé gửi xe: 15 lượt đã trả trong tuần + 8 đang gửi ───
      var seq = 0;
      Future<void> addPaidTicket({
        required String plate,
        required String type,
        required double fee,
        required int hoursAgoIn,
        required int stayMinutes,
        required String staffId,
        String method = 'cash',
      }) async {
        seq++;
        final checkOut = now.subtract(Duration(hours: hoursAgoIn ~/ 24 * 24));
        final inTime =
            now.subtract(Duration(hours: hoursAgoIn + stayMinutes ~/ 60));
        await db.parkingTickets.put(ParkingTicket()
          ..ticketId = 'TK_SEED_${seq}_$plate'
          ..vehicleId = 'vh_seed_$plate'
          ..licensePlate = plate
          ..checkInTime = inTime
          ..checkInStaffId = staffId
          ..checkOutTime = checkOut
          ..checkOutStaffId = staffId
          ..feeAmount = fee
          ..paymentMethod = method
          ..paymentStatus = 'paid'
          ..status = 'checked_out');
        await db.parkingFinanceTxs.put(ParkingFinanceTx()
          ..financeId = 'inc_TK_SEED_${seq}_$plate'
          ..isIncome = true
          ..amount = fee
          ..incomeCategory = ParkingIncomeCategory.OTHER_INCOME.name
          ..note = 'Tiền gửi xe $plate'
          ..createdAt = checkOut);
      }

      // Doanh thu tuần qua (theo bảng giá xe máy/ô tô).
      for (int d = 1; d <= 7; d++) {
        await addPaidTicket(
            plate: '50S-$d${d}A.${d}1', type: 'motorbike', fee: 8000,
            hoursAgoIn: d * 2, stayMinutes: 95, staffId: 'nv_baove01');
        await addPaidTicket(
            plate: '51F-$d${d}B.${d}2', type: 'car', fee: 25000,
            hoursAgoIn: d * 2 + 1, stayMinutes: 130, staffId: 'nv_thungan01',
            method: d % 2 == 0 ? 'qr_code' : 'cash');
      }
      await addPaidTicket(
          plate: '29A-123.45', type: 'motorbike', fee: 0, hoursAgoIn: 8,
          stayMinutes: 240, staffId: 'nv_baove01', method: 'monthly_card');

      // 8 xe đang gửi trong bãi.
      for (int i = 1; i <= 8; i++) {
        await db.parkingTickets.put(ParkingTicket()
          ..ticketId = 'TK_OPEN_$i'
          ..vehicleId = 'vh_open_$i'
          ..licensePlate = '60M$i-$i${i}C.1$i'          ..checkInTime = now.subtract(Duration(hours: i))
          ..checkInStaffId = i % 2 == 0 ? 'nv_baove01' : 'nv_thungan01'
          ..status = 'parking'
          ..paymentStatus = 'unpaid');
      }
      // Đếm chỗ đang dùng cho 2 khu mẫu.
      areas[1].usedSpots = 8; // Khu B có 8 xe máy đang gửi
      await db.parkingAreas.put(areas[1]);

      // ── §8. Thuê xe ─────────────────────────────────────────────
      await db.parkingRentals.putAll([
        ParkingRental()
          ..rentalId = 'rt_seed_1'
          ..customerName = 'Lê Văn C'
          ..customerPhone = '0923334455'
          ..customerCccd = '079203009012'
          ..vehicleId = 'vh_thue_wave'
          ..licensePlate = '60C1-777.77'
          ..rentStartTime = now.subtract(const Duration(days: 2))
          ..rentEndTime = now.add(const Duration(days: 3))
          ..depositAmount = 2000000
          ..rentalFee = 350000 // 5 ngày x 70k
          ..status = 'renting',
        ParkingRental()
          ..rentalId = 'rt_seed_2'
          ..customerName = 'Trần Thị B'
          ..customerPhone = '0912223344'
          ..customerCccd = '079203005678'
          ..vehicleId = 'vh_thue_vinfast'
          ..licensePlate = '60D1-888.88'
          ..rentStartTime = now.subtract(const Duration(days: 40))
          ..rentEndTime = now.subtract(const Duration(days: 38))
          ..actualReturnTime = now.subtract(const Duration(days: 38))
          ..depositAmount = 10000000
          ..rentalFee = 1800000
          ..status = 'returned',
        ParkingRental()
          ..rentalId = 'rt_seed_3' // QUÁ HẠN chưa trả (§16)
          ..customerName = 'Hoàng E'
          ..customerPhone = '0945556677'
          ..customerCccd = '079203003456'
          ..vehicleId = 'vh_thue_wave'
          ..licensePlate = '60C1-777.77'
          ..rentStartTime = now.subtract(const Duration(days: 6))
          ..rentEndTime = now.subtract(const Duration(days: 1))
          ..depositAmount = 2000000
          ..rentalFee = 420000
          ..status = 'overdue',
      ]);

      // ── §14. Chi phí vận hành bãi xe trong tháng ────────────────
      final monthStart = DateTime(now.year, now.month, 1);
      await db.parkingFinanceTxs.putAll([
        ParkingFinanceTx()
          ..financeId = 'chi_dien'
          ..isIncome = false
          ..amount = 3200000
          ..expenseCategory = ParkingExpenseCategory.ELECTRICITY.name
          ..note = 'Tiền điện bãi xe (thắp sáng + trụ sạc)'
          ..createdAt = monthStart.add(const Duration(days: 2)),
        ParkingFinanceTx()
          ..financeId = 'chi_nuoc'
          ..isIncome = false
          ..amount = 380000
          ..expenseCategory = ParkingExpenseCategory.WATER.name
          ..note = 'Tiền nước rửa xe'
          ..createdAt = monthStart.add(const Duration(days: 2)),
        ParkingFinanceTx()
          ..financeId = 'chi_thue_matbang'
          ..isIncome = false
          ..amount = 15000000
          ..expenseCategory = ParkingExpenseCategory.RENT.name
          ..note = 'Thuê mặt bằng bãi xe tháng này'
          ..createdAt = monthStart.add(const Duration(days: 1)),
        ParkingFinanceTx()
          ..financeId = 'chi_camera'
          ..isIncome = false
          ..amount = 1200000
          ..expenseCategory = ParkingExpenseCategory.CAMERA.name
          ..note = 'Bảo trì hệ thống camera + NVR'
          ..createdAt = monthStart.add(const Duration(days: 5)),
        ParkingFinanceTx()
          ..financeId = 'chi_luong'
          ..isIncome = false
          ..amount = 18000000
          ..expenseCategory = ParkingExpenseCategory.SALARY.name
          ..note = 'Lương bảo vệ + thu ngân tháng này'
          ..createdAt = monthStart.add(const Duration(days: 6)),
        ParkingFinanceTx()
          ..financeId = 'chi_baotri'
          ..isIncome = false
          ..amount = 850000
          ..expenseCategory = ParkingExpenseCategory.MAINTENANCE.name
          ..note = 'Sơn lại vạch khev + sửa barrier'
          ..createdAt = monthStart.add(const Duration(days: 8)),
      ]);
    });
  }
}

/// Interface tối thiểu để test nhúng được (tránh phụ thuộc vòng).
abstract class ParkingIsarServiceLike {
  Future<Isar> get db;
}
