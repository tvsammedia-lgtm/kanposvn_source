import 'package:isar/isar.dart';
import '../models/airbook_ops_models.dart';
import '../models/booking.dart';
import '../models/flight_offer.dart';

/// Bộ dữ liệu mẫu KanAirBook theo kan_air_book_markdown.md.
class AirBookSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.flightOffers.count() > 0) return;
    final now = DateTime.now();
    final nextMon = now.add(const Duration(days: 7));

    await db.writeTxn(() async {
      // ── §6. Chuyến bay nội địa ─────────────────────────────────
      DateTime at(DateTime base, int h, int m) =>
          DateTime(base.year, base.month, base.day, h, m);

      final d1 = DateTime(nextMon.year, nextMon.month, nextMon.day);
      final offers = <FlightOffer>[
        FlightOffer()
          ..uuid = 'of_vn213'
          ..airline = 'Vietnam Airlines'
          ..flightNumber = 'VN213'
          ..origin = 'HAN'
          ..destination = 'SGN'
          ..departureTime = at(d1, 7, 0)
          ..arrivalTime = at(d1, 9, 10)
          ..durationMinutes = 130
          ..baseFare = 1200000
          ..taxAndFee = 300000
          ..totalFare = 1500000
          ..cabinClass = 'Economy',
        FlightOffer()
          ..uuid = 'of_vj111'
          ..airline = 'Vietjet Air'
          ..flightNumber = 'VJ111'
          ..origin = 'HAN'
          ..destination = 'SGN'
          ..departureTime = at(d1, 9, 30)
          ..arrivalTime = at(d1, 11, 40)
          ..durationMinutes = 130
          ..baseFare = 890000
          ..taxAndFee = 310000
          ..totalFare = 1200000
          ..cabinClass = 'Economy',
        FlightOffer()
          ..uuid = 'of_qh221'
          ..airline = 'Bamboo Airways'
          ..flightNumber = 'QH221'
          ..origin = 'HAN'
          ..destination = 'SGN'
          ..departureTime = at(d1, 13, 15)
          ..arrivalTime = at(d1, 15, 25)
          ..durationMinutes = 130
          ..baseFare = 1050000
          ..taxAndFee = 320000
          ..totalFare = 1370000
          ..cabinClass = 'Economy',
        FlightOffer() // Business đắt
          ..uuid = 'of_vn215biz'
          ..airline = 'Vietnam Airlines'
          ..flightNumber = 'VN215'
          ..origin = 'HAN'
          ..destination = 'SGN'
          ..departureTime = at(d1, 17, 30)
          ..arrivalTime = at(d1, 19, 40)
          ..durationMinutes = 130
          ..baseFare = 4500000
          ..taxAndFee = 500000
          ..totalFare = 5000000
          ..cabinClass = 'Business',
        // Chiều về SGN->HAN cho khứ hồi
        FlightOffer()
          ..uuid = 'of_vn214ret'
          ..airline = 'Vietnam Airlines'
          ..flightNumber = 'VN214'
          ..origin = 'SGN'
          ..destination = 'HAN'
          ..departureTime = at(d1.add(const Duration(days: 3)), 10, 0)
          ..arrivalTime = at(d1.add(const Duration(days: 3)), 12, 15)
          ..durationMinutes = 135
          ..baseFare = 1250000
          ..taxAndFee = 300000
          ..totalFare = 1550000
          ..cabinClass = 'Economy',
        // Tuyến khác HAN-DAD
        FlightOffer()
          ..uuid = 'of_vj156dad'
          ..airline = 'Vietjet Air'
          ..flightNumber = 'VJ156'
          ..origin = 'HAN'
          ..destination = 'DAD'
          ..departureTime = at(d1, 11, 5)
          ..arrivalTime = at(d1, 12, 20)
          ..durationMinutes = 75
          ..baseFare = 690000
          ..taxAndFee = 210000
          ..totalFare = 900000
          ..cabinClass = 'Economy',
      ];
      await db.flightOffers.putAll(offers);

      // ── §32. Khuyến mãi theo hãng / platform ───────────────────
      await db.airPromotions.putAll([
        AirPromotion()
          ..code = 'VJ10'
          ..scope = 'airline'
          ..refId = 'Vietjet Air'
          ..type = 'percent'
          ..value = 10
          ..maxDiscount = 200000
          ..usageLimit = 100,
        AirPromotion()
          ..code = 'SUMMER500'
          ..scope = 'platform'
          ..type = 'fixedAmount'
          ..value = 500000
          ..maxDiscount = 500000,
      ]);

      // ── §8+§13. Bookings mẫu ───────────────────────────────────
      // 1) Ticketed đã thanh toán đủ (VN213 x2 ADT).
      final b1 = BookingLocal()
        ..uuid = 'bk_seed_ticketed'
        ..pnrCode = 'KAN100001'
        ..flightOfferUuid = 'of_vn213'
        ..passengerName = 'Nguyễn Văn Hùng'
        ..passengerPhone = '0912345678'
        ..contactEmail = 'hung@gmail.com'
        ..totalAmount = 3300000 // supplier 1.5tr*2=3tr + fee 150k*2=300k - 0
        ..supplierPrice = 3000000
        ..serviceFee = 300000
        ..discountAmount = 0
        ..profit = 300000 - 165000
        ..commission = 165000
        ..paidAmount = 3300000
        ..remainingAmount = 0
        ..status = BookingAirStatus.confirmed
        ..ticketNumber = 'VN01234567'
        ..isCheckedIn = false
        ..idempotencyKey = 'seed-key-1'
        ..createdAt = now.subtract(const Duration(days: 3))
        ..updatedAt = now.subtract(const Duration(days: 3));
      await db.bookingLocals.put(b1);
      for (final pax in [
        ['Nguyễn', 'Văn Hùng'],
        ['Trần', 'Thị Mai']
      ]) {
        await db.airPassengers.put(AirPassenger()
          ..passengerId =
              'px_${b1.uuid}_${pax[0]}${pax[1]}'.hashCode.abs().toString()
          ..bookingUuid = b1.uuid!
          ..type = AirPassengerType.ADT
          ..title = pax[0] == 'Nguyễn' ? 'Mr' : 'Mrs'
          ..firstName = pax[1]
          ..lastName = pax[0]
          ..gender = pax[0] == 'Nguyễn' ? 'male' : 'female');
      }
      await db.airPayments.put(AirPayment()
        ..paymentCode = 'pay_seed_1'
        ..bookingUuid = b1.uuid!
        ..method = 'bank'
        ..amount = 3300000
        ..status = 'SUCCESS'
        ..idempotencyKey = 'pay-seed-1'
        ..createdAt = now.subtract(const Duration(days: 3)));

      // 2) PendingPayment trả một phần.
      final b2 = BookingLocal()
        ..uuid = 'bk_seed_partial'
        ..pnrCode = 'KAN100002'
        ..flightOfferUuid = 'of_vj111'
        ..passengerName = 'Lê Thị Công Nợ'
        ..passengerPhone = '0922222222'
        ..totalAmount = 2400000
        ..supplierPrice = 2200000
        ..serviceFee = 200000
        ..paidAmount = 1000000
        ..remainingAmount = 1400000
        ..status = BookingAirStatus.pendingPayment
        ..expiresAt = now.add(const Duration(hours: 12))
        ..createdAt = now.subtract(const Duration(days: 1));
      await db.bookingLocals.put(b2);
      await db.airPayments.put(AirPayment()
        ..paymentCode = 'pay_seed_2'
        ..bookingUuid = b2.uuid!
        ..method = 'ewallet'
        ..amount = 1000000
        ..status = 'SUCCESS'
        ..createdAt = now.subtract(const Duration(days: 1)));

      // 3) HELD sắp hết hạn giữ chỗ.
      final b3 = BookingLocal()
        ..uuid = 'bk_seed_held'
        ..pnrCode = 'KAN100003'
        ..flightOfferUuid = 'of_vj156dad'
        ..passengerName = 'Phạm Held Chờ'
        ..passengerPhone = '0933333333'
        ..totalAmount = 1050000 // 900k + fee 150k
        ..supplierPrice = 900000
        ..serviceFee = 150000
        ..paidAmount = 0
        ..remainingAmount = 1050000
        ..status = BookingAirStatus.held
        ..expiresAt = now.add(const Duration(minutes: 10))
        ..createdAt = now.subtract(const Duration(minutes: 20));
      await db.bookingLocals.put(b3);

    });
  }
}

