import 'package:isar/isar.dart';
import '../models/booking.dart';
import '../models/customer.dart';
import '../models/driver.dart';
import '../models/ops_models.dart';
import '../models/payment.dart';
import '../models/vehicle.dart';
import 'xeom_business_logic.dart';

/// Bộ dữ liệu mẫu Kan Xe Ôm / Taxi theo kanxeom.md.
class XeOmSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.xeOmDrivers.count() > 0) return;
    final now = DateTime.now();
    final rnd = now.millisecondsSinceEpoch;

    await db.writeTxn(() async {
      // ── §13. Bảng giá cước theo loại xe ─────────────────────────
      await db.xeOmTariffs.putAll([
        XeOmTariff()
          ..uuid = 'tariff_motorbike'
          ..vehicleType = 'motorbike'
          ..baseFare = 10000
          ..pricePerKm = 4000
          ..pricePerMinute = 0
          ..peakSurchargePercent = 20
          ..airportSurcharge = 15000
          ..holidaySurcharge = 10000,
        XeOmTariff()
          ..uuid = 'tariff_taxi4'
          ..vehicleType = 'taxi4Seats'
          ..baseFare = 20000
          ..pricePerKm = 12000
          ..pricePerMinute = 300
          ..peakSurchargePercent = 15
          ..airportSurcharge = 40000
          ..holidaySurcharge = 20000,
        XeOmTariff()
          ..uuid = 'tariff_taxi7'
          ..vehicleType = 'taxi7Seats'
          ..baseFare = 25000
          ..pricePerKm = 15000
          ..peakSurchargePercent = 10
          ..airportSurcharge = 50000
          ..holidaySurcharge = 25000,
        XeOmTariff()
          ..uuid = 'tariff_ev'
          ..vehicleType = 'evTaxi'
          ..baseFare = 18000
          ..pricePerKm = 11000
          ..peakSurchargePercent = 10
          ..airportSurcharge = 40000,
        XeOmTariff()
          ..uuid = 'tariff_truck'
          ..vehicleType = 'truck'
          ..baseFare = 60000
          ..pricePerKm = 20000
          ..peakSurchargePercent = 0
          ..holidaySurcharge = 50000,
        XeOmTariff()
          ..uuid = 'tariff_delivery'
          ..vehicleType = 'delivery'
          ..baseFare = 15000
          ..pricePerKm = 5000
          ..peakSurchargePercent = 10,
      ]);

      // ── §14. Khuyến mãi ─────────────────────────────────────────
      await db.xeOmPromotions.putAll([
        XeOmPromotion()
          ..code = 'SALE20'
          ..description = 'Giảm 20% tối đa 30k, đơn từ 50k'
          ..type = 'percent'
          ..value = 20
          ..maxDiscount = 30000
          ..minFare = 50000
          ..validFrom = now.subtract(const Duration(days: 30))
          ..validTo = now.add(const Duration(days: 60))
          ..active = true,
        XeOmPromotion()
          ..code = 'GIAM20K'
          ..description = 'Giảm thẳng 20.000đ'
          ..type = 'fixedAmount'
          ..value = 20000
          ..minFare = 40000
          ..validFrom = now.subtract(const Duration(days: 15))
          ..validTo = now.add(const Duration(days: 45))
          ..active = true,
        XeOmPromotion()
          ..code = 'FREE2KM'
          ..description = 'Miễn phí 2 km đầu cho khách mới'
          ..type = 'freeFirstKm'
          ..value = 2
          ..validFrom = now.subtract(const Duration(days: 60))
          ..validTo = now.add(const Duration(days: 90))
          ..active = true,
      ]);

      // ── §6. Tài xế ──────────────────────────────────────────────
      final drivers = <XeOmDriver>[
        XeOmDriver()
          ..uuid = 'tx_tuan'
          ..fullName = 'Nguyễn Văn Tú'
          ..cccd = '079203001111'
          ..driverLicense = 'B2-12345678'
          ..driverLicenseExpiry = now.add(const Duration(days: 700))
          ..phone = '0903111222'
          ..address = 'Q1, TP.HCM'
          ..dateOfBirth = DateTime(1990, 5, 12)
          ..status = DriverStatus.online,
        XeOmDriver()
          ..uuid = 'tx_hung'
          ..fullName = 'Trần Quốc Hùng'
          ..cccd = '079203002222'
          ..driverLicense = 'B1-87654321'
          ..driverLicenseExpiry =
              now.add(const Duration(days: 5)) // GPLX sắp hết hạn
          ..phone = '0903222333'
          ..status = DriverStatus.online,
        XeOmDriver()
          ..uuid = 'tx_lan'
          ..fullName = 'Lê Thị Lan'
          ..cccd = '079203003333'
          ..driverLicense = 'A1-11223344'
          ..driverLicenseExpiry = now.add(const Duration(days: 900))
          ..phone = '0903333444'
          ..status = DriverStatus.busy, // đang chạy chuyến seed cuối
        XeOmDriver()
          ..uuid = 'tx_minh'
          ..fullName = 'Phạm Đức Minh'
          ..cccd = '079203004444'
          ..driverLicense = 'B2-99887766'
          ..driverLicenseExpiry = now.add(const Duration(days: 450))
          ..phone = '0903444555'
          ..status = DriverStatus.offline,
        XeOmDriver()
          ..uuid = 'tx_dat'
          ..fullName = 'Võ Thanh Đạt'
          ..cccd = '079203005555'
          ..driverLicense = 'A1-55667788'
          ..driverLicenseExpiry = now.add(const Duration(days: 300))
          ..phone = '0903555666'
          ..status = DriverStatus.suspended, // bị đình chỉ
      ];
      await db.xeOmDrivers.putAll(drivers);

      // ── §7. Xe ──────────────────────────────────────────────────
      await db.xeOmVehicles.putAll([
        XeOmVehicle()
          ..uuid = 'vh_wave'
          ..driverUuid = 'tx_tuan'
          ..licensePlate = '59X1-111.11'
          ..type = VehicleType.motorbike
          ..brand = 'Honda'
          ..color = 'Đỏ đen'
          ..manufactureYear = 2022
          ..insuranceExpiry = now.add(const Duration(days: 200))
          ..registrationExpiry = now.add(const Duration(days: 300))
          ..hasGps = true
          ..status = VehicleStatus.active,
        XeOmVehicle()
          ..uuid = 'vh_vios'
          ..driverUuid = 'tx_hung'
          ..licensePlate = '51A-222.22'
          ..type = VehicleType.taxi4Seats
          ..brand = 'Toyota'
          ..color = 'Trắng'
          ..manufactureYear = 2021
          ..insuranceExpiry = now.add(const Duration(days: 100))
          ..registrationExpiry = now.add(const Duration(days: 150))
          ..hasGps = true
          ..status = VehicleStatus.active,
        XeOmVehicle()
          ..uuid = 'vh_innova'
          ..driverUuid = 'tx_minh'
          ..licensePlate = '51B-333.33'
          ..type = VehicleType.taxi7Seats
          ..brand = 'Toyota'
          ..color = 'Xanh ngọc'
          ..manufactureYear = 2020
          ..insuranceExpiry = now.add(const Duration(days: 80))
          ..registrationExpiry = now.add(const Duration(days: 120))
          ..hasGps = true
          ..status = VehicleStatus.active,
        XeOmVehicle()
          ..uuid = 'vh_vinfast'
          ..driverUuid = 'tx_lan'
          ..licensePlate = '30K-444.44'
          ..type = VehicleType.evTaxi
          ..brand = 'VinFast'
          ..color = 'Xanh dương'
          ..manufactureYear = 2023
          ..insuranceExpiry = now.add(const Duration(days: 350))
          ..registrationExpiry = now.add(const Duration(days: 360))
          ..hasGps = true
          ..status = VehicleStatus.active,
        XeOmVehicle()
          ..uuid = 'vh_truck'
          ..driverUuid = 'tx_dat'
          ..licensePlate = '60C-555.55'
          ..type = VehicleType.truck
          ..brand = 'Hino'
          ..color = 'Trắng xanh'
          ..manufactureYear = 2019
          ..insuranceExpiry = now.subtract(const Duration(days: 10)) // hết BH!
          ..registrationExpiry = now.add(const Duration(days: 60))
          ..hasGps = false
          ..status = VehicleStatus.maintenance, // đang bảo dưỡng
      ]);

      // ── §8. Khách hàng ──────────────────────────────────────────
      await db.xeOmCustomers.putAll([
        XeOmCustomer()
          ..uuid = 'kh_mai'
          ..fullName = 'Ngô Thu Mai'
          ..phone = '0912000111'
          ..email = 'mai@gmail.com'
          ..address = 'Quận 3, TP.HCM'
          ..rewardPoints = 85
          ..totalBookings = 42
          ..totalRevenue = 2450000,
        XeOmCustomer()
          ..uuid = 'kh_cuong'
          ..fullName = 'Đinh Hoàng Cường'
          ..phone = '0912000222'
          ..address = 'Quận 7, TP.HCM'
          ..rewardPoints = 20
          ..totalBookings = 9
          ..totalRevenue = 720000,
        XeOmCustomer()
          ..uuid = 'kh_doanhnghiep'
          ..fullName = 'Công Ty ABC (tài khoản doanh nghiệp)'
          ..phone = '02838889999'
          ..email = 'abc@company.vn'
          ..address = 'Khu công nghệ cao, TP.HCM'
          ..notes = 'Thanh toán công nợ cuối tháng' // §15 đối tác DN
          ..rewardPoints = 210
          ..totalBookings = 130
          ..totalRevenue = 15600000,
        XeOmCustomer()
          ..uuid = 'kh_my'
          ..fullName = 'Hà Ngọc Mỹ'
          ..phone = '0912000333'
          ..rewardPoints = 0
          ..totalBookings = 0
          ..totalRevenue = 0,
      ]);

      // ── §9-§17. Chuyến đi mẫu trong 14 ngày qua ─────────────────
      final routes = [
        ['Ben Thanh, Q1', 'Tan Son Nhat Airport, Tan Binh', 8.5],
        ['Vincom Dong Khoi, Q1', 'Phu My Hung, Q7', 9.2],
        ['Cho Ben Thanh, Q1', 'Dai hoc Bach Khoa, Q10', 4.3],
        ['Landmark 81, Binh Thanh', 'Lotte Mart Q7', 7.1],
        ['Ben xe Mien Dong', 'Khu Cong Nghe Cao, Q9', 6.4],
      ];

      double fareOf(String type, double km) {
        switch (type) {
          case 'taxi4Seats':
            return 20000 + km * 12000;
          case 'taxi7Seats':
            return 25000 + km * 15000;
          case 'evTaxi':
            return 18000 + km * 11000;
          default:
            return 10000 + km * 4000;
        }
      }

      final driverTypes = {
        'tx_tuan': 'motorbike',
        'tx_hung': 'taxi4Seats',
        'tx_lan': 'evTaxi',
        'tx_minh': 'taxi7Seats',
      };

      var seq = 0;
      for (int d = 13; d >= 1; d--) {
        for (int k = 0; k < 3; k++) {
          seq++;
          final route = routes[(seq + d) % routes.length];
          final driverId = driverTypes.keys.elementAt((seq + k) % 4);
          final type = driverTypes[driverId]!;
          final km = route[2] as double;
          final created =
              DateTime(now.year, now.month, now.day - d, 8 + (k * 5), 15);
          final completed = created.add(Duration(minutes: 18 + (seq % 25)));
          final fare = fareOf(type, km);
          final method = PaymentMethod
              .values[(seq + k) % 6]; // luân chuyển 6 hình thức (có debt)

          final b = XeOmBooking()
            ..uuid = 'bk_seed_$seq'
            ..bookingCode = 'BOOK-S${1000 + seq}'
            ..customerUuid =
                seq % 4 == 0 ? 'kh_doanhnghiep' : 'kh_${['mai', 'cuong', 'my'][seq % 3]}'
            ..customerName = seq % 4 == 0 ? 'Công Ty ABC' : 'Khách seed $seq'
            ..customerPhone = '090000000$seq'
            ..pickupAddress = route[0] as String
            ..dropoffAddress = route[1] as String
            ..distanceKm = km
            ..requiredVehicleType = type
            ..driverUuid = driverId
            ..paymentMethod = method
            ..price = method == PaymentMethod.debt ? fare : fare
            ..status = BookingStatus.completed
            ..createdAt = created
            ..pickedUpAt = created.add(const Duration(minutes: 5))
            ..completedAt = completed
            ..updatedAt = completed;
          await db.xeOmBookings.put(b);

          final isDebt = method == PaymentMethod.debt;
          await db.xeOmPayments.put(XeOmPayment()
            ..uuid = 'pay_seed_$seq'
            ..bookingUuid = b.uuid
            ..customerUuid = b.customerUuid
            ..driverUuid = driverId
            ..amount = fare
            ..driverCommission = fare * XeOmBusinessLogic.defaultCommissionRate
            ..method = isDebt ? PaymentMethod.cash : method
            ..status = isDebt ? PaymentStatus.pending : PaymentStatus.completed
            ..paidAt = isDebt ? null : completed
            ..createdAt = completed);

          // Khách debt không tính vào doanh thu thực thu.
          final cust = await db.xeOmCustomers
              .filter()
              .uuidEqualTo(b.customerUuid!)
              .findFirst();
          if (cust != null && !isDebt) {
            cust.totalBookings += 1;
            cust.totalRevenue += fare;
            cust.rewardPoints += fare ~/ 10000;
            await db.xeOmCustomers.put(cust);
          }
        }
      }

      // 2 chuyến đang chạy (xe đang bận).
      for (int i = 0; i < 2; i++) {
        await db.xeOmBookings.put(XeOmBooking()
          ..uuid = 'bk_open_$i'
          ..bookingCode = 'BOOK-R$i'
          ..customerUuid = i == 0 ? 'kh_mai' : 'kh_cuong'
          ..customerName = 'Khách đang chạy ${i + 1}'
          ..customerPhone = '099999999$i'
          ..pickupAddress = routes[i][0] as String
          ..dropoffAddress = routes[i][1] as String
          ..distanceKm = routes[i][2] as double
          ..requiredVehicleType = i == 0 ? 'motorbike' : 'taxi4Seats'
          ..driverUuid = i == 0 ? 'tx_tuan' : 'tx_hung'
          ..paymentMethod = PaymentMethod.cash
          ..price = fareOf(i == 0 ? 'motorbike' : 'taxi4Seats',
              routes[i][2] as double)
          ..baseFare = 0
          ..surcharge = 0
          ..discount = 0
          ..status = BookingStatus.inProgress
          ..createdAt = now.subtract(Duration(minutes: 10 + i * 5))
          ..updatedAt = now);
      }

      // 3 chuyến đã hủy (để tính tỷ lệ hủy §19).
      for (int i = 0; i < 3; i++) {
        await db.xeOmBookings.put(XeOmBooking()
          ..uuid = 'bk_cancel_$i'
          ..bookingCode = 'BOOK-C$i'
          ..customerUuid = 'kh_my'
          ..customerName = 'Hà Ngọc Mỹ'
          ..customerPhone = '0912000333'
          ..pickupAddress = 'Q1'
          ..dropoffAddress = 'Thủ Đức'
          ..distanceKm = 9
          ..requiredVehicleType = 'motorbike'
          ..paymentMethod = PaymentMethod.cash
          ..price = 46000
          ..status = BookingStatus.cancelled
          ..createdAt = now.subtract(Duration(hours: 6 + i))
          ..updatedAt = now.subtract(Duration(hours: 6 + i)));
      }

      // ── §18. Chi phí vận hành ───────────────────────────────────
      final monthStart = DateTime(now.year, now.month, 1);
      await db.xeOmExpenses.putAll([
        XeOmExpense()
          ..uuid = 'exp_xang_$rnd'
          ..category = 'FUEL'
          ..amount = 6500000
          ..note = 'Xăng dầu toàn đội xe tháng này'
          ..createdAt = monthStart.add(const Duration(days: 3)),
        XeOmExpense()
          ..uuid = 'exp_dien_$rnd'
          ..category = 'ELECTRICITY'
          ..amount = 1800000
          ..note = 'Trạm sạc xe điện'
          ..createdAt = monthStart.add(const Duration(days: 3)),
        XeOmExpense()
          ..uuid = 'exp_sua_$rnd'
          ..category = 'REPAIR'
          ..amount = 2400000
          ..note = 'Sửa xe Wave + thay lốp Vios'
          ..vehicleUuid = 'vh_vios'
          ..createdAt = monthStart.add(const Duration(days: 6)),
        XeOmExpense()
          ..uuid = 'exp_baoduong$rnd'
          ..category = 'MAINTENANCE'
          ..amount = 3100000
          ..note = 'Bảo dưỡng định kỳ 5 xe'
          ..createdAt = monthStart.add(const Duration(days: 8)),
        XeOmExpense()
          ..uuid = 'exp_luong_$rnd'
          ..category = 'SALARY'
          ..amount = 28000000
          ..note = 'Lương điều hành + kế toán tháng này'
          ..createdAt = monthStart.add(const Duration(days: 10)),
        XeOmExpense()
          ..uuid = 'exp_mkt_$rnd'
          ..category = 'MARKETING'
          ..amount = 5000000
          ..note = 'Quảng cáo app đặt xe'
          ..createdAt = monthStart.add(const Duration(days: 12)),
        XeOmExpense()
          ..uuid = 'exp_internet$rnd'
          ..category = 'INTERNET'
          ..amount = 550000
          ..note = 'Internet văn phòng + SIM 4G tài xế'
          ..createdAt = monthStart.add(const Duration(days: 12)),
      ]);
    });
  }
}
