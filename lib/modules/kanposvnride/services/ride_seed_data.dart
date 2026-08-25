import 'package:isar/isar.dart';
import '../models/ride_booking.dart';
import '../models/ride_driver.dart';
import '../models/ride_ops_models.dart';
import '../models/ride_transaction.dart';
import '../models/ride_trip.dart';
import '../models/ride_user.dart';
import '../models/ride_vehicle_type.dart';
import 'ride_advanced_logic.dart';
import 'ride_business_logic.dart';

/// Bộ dữ liệu mẫu KanRide theo kanposvnride.md.
class RideSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.rideDrivers.count() > 0) return;
    final now = DateTime.now();

    await db.writeTxn(() async {
      // ── §7+§14. Loại xe & giá cước ─────────────────────────────
      await db.kanRideVehicleTypes.putAll([
        KanRideVehicleType()
          ..vehicleTypeId = 'motorBike'
          ..name = 'Xe máy'
          ..baseFare = 10000
          ..pricePerKm = 3500
          ..pricePerMinute = 0,
        KanRideVehicleType()
          ..vehicleTypeId = 'evBike'
          ..name = 'Xe điện'
          ..baseFare = 12000
          ..pricePerKm = 3800
          ..pricePerMinute = 0,
        KanRideVehicleType()
          ..vehicleTypeId = 'car4Seats'
          ..name = 'Ô tô 4 chỗ'
          ..baseFare = 22000
          ..pricePerKm = 11500
          ..pricePerMinute = 250,
        KanRideVehicleType()
          ..vehicleTypeId = 'car7Seats'
          ..name = 'Ô tô 7 chỗ'
          ..baseFare = 26000
          ..pricePerKm = 14000
          ..pricePerMinute = 300,
        KanRideVehicleType()
          ..vehicleTypeId = 'delivery'
          ..name = 'Giao hàng'
          ..baseFare = 18000
          ..pricePerKm = 4500
          ..pricePerMinute = 0,
      ]);

      // ── §18. Khuyến mãi ────────────────────────────────────────
      await db.kanRidePromotions.putAll([
        KanRidePromotion()
          ..code = 'KAN20'
          ..description = 'Giảm 20% tối đa 25k'
          ..type = 'percent'
          ..value = 20
          ..maxDiscount = 25000
          ..minFare = 40000
          ..validFrom = now.subtract(const Duration(days: 30))
          ..validTo = now.add(const Duration(days: 60))
          ..active = true,
        KanRidePromotion()
          ..code = 'GIAM15K'
          ..description = 'Giảm thẳng 15k'
          ..type = 'fixedAmount'
          ..value = 15000
          ..minFare = 0
          ..validFrom = now.subtract(const Duration(days: 10))
          ..validTo = now.add(const Duration(days: 50))
          ..active = true,
        KanRidePromotion()
          ..code = 'FREERIDE'
          ..description = 'Miễn phí chuyến đầu cho khách mới'
          ..type = 'freeFirstRide'
          ..value = 1
          ..validFrom = now.subtract(const Duration(days: 90))
          ..validTo = now.add(const Duration(days: 90))
          ..active = true,
      ]);

      // ── §5. Khách hàng ─────────────────────────────────────────
      final users = <RideUser>[
        RideUser()
          ..uuid = 'user_hoa'
          ..fullName = 'Trần Thị Hòa'
          ..phone = '0918000111'
          ..email = 'hoa@gmail.com'
          ..walletBalance = 150000
          ..rewardPoints = 60
          ..referralCode = 'REF-HOA01'
          ..createdAt = now.subtract(const Duration(days: 100)),
        RideUser()
          ..uuid = 'user_binh'
          ..fullName = 'Lý Minh Bình'
          ..phone = '0918000222'
          ..walletBalance = 50000
          ..rewardPoints = 12
          ..referralCode = 'REF-BINH02'
          ..createdAt = now.subtract(const Duration(days: 40)),
        RideUser()
          ..uuid = 'user_giang'
          ..fullName = 'Phan Thị Giang'
          ..phone = '0918000333'
          ..walletBalance = 20000
          ..createdAt = now.subtract(const Duration(days: 3)), // khách mới tháng này
        RideUser()
          ..uuid = 'user_blocked'
          ..fullName = 'Tài Khoản Xấu'
          ..phone = '0918000444'
          ..status = UserStatus.blocked // §33 blacklist
          ..createdAt = now.subtract(const Duration(days: 200)),
      ];
      await db.rideUsers.putAll(users);

      // ── §6-§7. Tài xế ──────────────────────────────────────────
      final drivers = <RideDriver>[
        RideDriver()
          ..uuid = 'drv_son'
          ..fullName = 'Hoàng Văn Sơn'
          ..phone = '0929000111'
          ..vehiclePlate = '59X1-222.21'
          ..vehicleType = VehicleType.motorBike
          ..driverWalletBalance = 320000
          ..status = DriverStatus.online
          ..currentLat = 10.776
          ..currentLng = 106.700 // gần Q1
          ..averageRating = 4.8
          ..createdAt = now.subtract(const Duration(days: 300)),
        RideDriver()
          ..uuid = 'drv_quang'
          ..fullName = 'Đỗ Tuấn Quang'
          ..phone = '0929000222'
          ..vehiclePlate = '51A-333.32'
          ..vehicleType = VehicleType.car4Seats
          ..driverWalletBalance = 1250000
          ..status = DriverStatus.online
          ..currentLat = 10.810
          ..currentLng = 106.658 // Tân Bình
          ..averageRating = 4.5
          ..createdAt = now.subtract(const Duration(days: 250)),
        RideDriver()
          ..uuid = 'drv_nam'
          ..fullName = 'Chử Công Nam'
          ..phone = '0929000333'
          ..vehiclePlate = '30K-444.43'
          ..vehicleType = VehicleType.evBike
          ..driverWalletBalance = 980000
          ..status = DriverStatus.online
          ..currentLat = 10.850
          ..currentLng = 106.750 // xa trung tâm
          ..averageRating = 4.95
          ..createdAt = now.subtract(const Duration(days: 5)), // tài xế mới
        RideDriver()
          ..uuid = 'drv_thuy'
          ..fullName = 'Ngô Kim Thúy'
          ..phone = '0929000444'
          ..vehiclePlate = '51B-555.54'
          ..vehicleType = VehicleType.car7Seats
          ..driverWalletBalance = 2400000
          ..status = DriverStatus.busy // đang chạy chuyến seed cuối
          ..currentLat = 10.790
          ..currentLng = 106.720
          ..averageRating = 4.2
          ..createdAt = now.subtract(const Duration(days: 400)),
        RideDriver()
          ..uuid = 'drv_offline'
          ..fullName = 'Trịnh Bá Long'
          ..phone = '0929000555'
          ..vehiclePlate = '60C-666.65'
          ..vehicleType = VehicleType.delivery
          ..driverWalletBalance = 0
          ..status = DriverStatus.offline
          ..averageRating = 3.9
          ..createdAt = now.subtract(const Duration(days: 150)),
      ];
      await db.rideDrivers.putAll(drivers);

      // ── §24. Chuyến đi 14 ngày qua ─────────────────────────────
      final routes = [
        ['Ben Thanh, Q1', 'Tan Son Nhat, Tan Binh', 8.2],
        ['Dinh Doc Lap, Q1', 'Phu My Hung, Q7', 9.6],
        ['Cho Tan Dinh, Q1', 'Dai hoc Kinh te, Binh Thanh', 4.5],
        ['The Crescent Mall, Q7', 'Landmark 81, Binh Thanh', 7.3],
      ];
      const typeIds = ['motorBike', 'car4Seats', 'evBike'];
      double fareOf(String t, double km) {
        switch (t) {
          case 'car4Seats':
            return 22000 + km * 11500;
          case 'evBike':
            return 12000 + km * 3800;
          default:
            return 10000 + km * 3500;
        }
      }

      var seq = 0;
      for (int day = 13; day >= 0; day--) {
        final perDay = day == 0 ? 2 : 3;
        for (int k = 0; k < perDay; k++) {
          seq++;
          final route = routes[(seq + day) % routes.length];
          final typeId = typeIds[seq % typeIds.length];
          final km = route[2] as double;
          final driverId = [
            'drv_son',
            'drv_quang',
            'drv_nam',
            'drv_thuy',
          ][seq % 4];
          final created =
              DateTime(now.year, now.month, now.day - day, 7 + (k * 6), 30);
          final completed =
              created.add(Duration(minutes: 15 + (seq % 30)));
          final fare = fareOf(typeId, km);
          final commission = fare * RideBusinessLogic.commissionRate;

          final b = RideBooking()
            ..uuid = 'rb_seed_$seq'
            ..passengerUuid = ['user_hoa', 'user_binh', 'user_giang'][seq % 3]
            ..driverUuid = driverId
            ..pickupAddress = route[0] as String
            ..pickupLat = 10.78 + (seq % 5) / 100
            ..pickupLng = 106.70 + (seq % 3) / 100
            ..dropoffAddress = route[1] as String
            ..distanceKm = km
            ..requestedVehicleType = VehicleType.values.firstWhere(
                (v) => v.name == typeId,
                orElse: () => VehicleType.motorBike)
            ..estimatedPrice = fare
            ..finalPrice = fare
            ..commission = commission
            ..driverEarnings = fare - commission
            ..paymentMethod = seq % 3 == 0 ? 'wallet' : 'cash'
            ..status = BookingStatus.completed
            ..createdAt = created
            ..acceptedAt = created.add(const Duration(minutes: 2))
            ..pickupAt = created.add(const Duration(minutes: 6))
            ..completedAt = completed
            ..updatedAt = completed;
          await db.rideBookings.put(b);

          await db.kanRideTrips.put(KanRideTrip()
            ..tripId = 'trip_seed_$seq'
            ..bookingId = b.uuid!
            ..driverId = driverId
            ..startTime = b.pickupAt!
            ..endTime = completed
            ..actualDistanceKm = km
            ..finalPrice = fare
            ..status = 'completed');

          if (b.paymentMethod == 'wallet') {
            await db.rideTransactions.put(RideTransaction()
              ..uuid = 'tx_seed_$seq'
              ..userUuid = b.passengerUuid
              ..amount = -fare
              ..type = TransactionType.payment
              ..description = 'Thanh toán chuyến ${b.uuid}'
              ..createdAt = completed);
          }
        }
      }

      // 3 chuyến đã hủy (tỷ lệ hủy §27).
      for (int i = 0; i < 3; i++) {
        await db.rideBookings.put(RideBooking()
          ..uuid = 'rb_cancel_$i'
          ..passengerUuid = i == 0 ? 'user_binh' : 'user_giang'
          ..pickupAddress = 'Q3'
          ..dropoffAddress = 'Thủ Đức'
          ..distanceKm = 10
          ..requestedVehicleType = VehicleType.motorBike
          ..paymentMethod = 'cash'
          ..status = BookingStatus.cancelled
          ..createdAt = now.subtract(Duration(hours: 5 + i))
          ..updatedAt = now.subtract(Duration(hours: 5 + i)));
      }
      // 1 chuyến đang chờ tìm tài xế (§28 Đơn chờ).
      await db.rideBookings.put(RideBooking()
        ..uuid = 'rb_pending'
        ..passengerUuid = 'user_hoa'
        ..pickupAddress = 'Q1'
        ..dropoffAddress = 'Gò Vấp'
        ..distanceKm = 8
        ..requestedVehicleType = VehicleType.car4Seats
        ..paymentMethod = 'cash'
        ..status = BookingStatus.findingDriver
        ..createdAt = now.subtract(const Duration(minutes: 4)));

      // Giao dịch ví mẫu: nạp tiền.
      await db.rideTransactions.put(RideTransaction()
        ..uuid = 'tx_topup_1'
        ..userUuid = 'user_hoa'
        ..amount = 300000
        ..type = TransactionType.topup
        ..description = 'Nạp tiền qua MoMo'
        ..createdAt = now.subtract(const Duration(days: 2)));

      // ── GĐ2-4. Dữ liệu mẫu tính năng nâng cao ──────────────────
      await db.rideGeoFences.put(RideGeoFence()
        ..fenceId = 'fence_hcmc'
        ..name = 'Vùng hoạt động TP.HCM'
        ..province = 'TP. Hồ Chí Minh'
        ..centerLat = 10.776
        ..centerLng = 106.700
        ..radiusKm = 25);

      await db.ridePartnerApiKeys.put(RidePartnerApiKey()
        ..keyId = 'key_grabpartner'
        ..partnerName = 'GrabPartner'
        ..apiKeyHash = RideAdvancedLogic.hashKey('demo-secret-key')
        ..quotaPerDay = 500);

      final corp = RideCorporateAccount()
        ..corpId = 'corp_abc'
        ..companyName = 'Công Ty TNHH ABC Logistics'
        ..taxCode = '0312345678'
        ..contactPhone = '02838123456'
        ..creditLimitVnd = 20000000
        ..currentDebt = 0
        ..invoiceDayOfMonth = 5;
      await db.rideCorporateAccounts.put(corp);

      await db.rideNotifications.putAll([
        RideNotification()
          ..notifId = 'ntf_seed_1'
          ..userUuid = 'user_hoa'
          ..channel = 'push'
          ..title = 'Khuyến mãi KAN20'
          ..body = 'Giảm 20% cho chuyến kế tiếp!',
          RideNotification()
          ..notifId = 'ntf_seed_2'
          ..userUuid = 'drv_son'
          ..channel = 'sms'
          ..title = 'GPLX sắp hết hạn'
          ..body = 'Vui lòng gia hạn GPLX.',
      ]);

      await db.rideSupportTickets.put(RideSupportTicket()
        ..ticketId = 'TKC_SEED_1'
        ..bookingUuid = 'rb_seed_3'
        ..userUuid = 'user_hoa'
        ..category = 'complaint'
        ..subject = 'Tài xế đi đường dài'
        ..detail = 'Chuyến đi quá lâu so với bình thường'
        ..status = 'open');
    });
  }
}
