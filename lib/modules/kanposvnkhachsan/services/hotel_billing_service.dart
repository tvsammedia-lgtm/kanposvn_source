import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_room.dart';

/// Máy tính tiền phòng — logic khớp với stored procedure KANHOT_ONE.
///
/// Tham chiếu:
///   sptblTimeManagement_Update_THUEGIO_tblTimeManagement
///   sptblTimeManagement_Update_QUADEM_tblTimeManagement
///   sptblTimeManagement_Update_THUENGAY_tblTimeManagement
class HotelBillingCalculator {
  // ──────────────────────────────────────────────
  //  TIỀN PHÒNG THEO LOẠI THUÊ
  // ──────────────────────────────────────────────

  static double computeRoomCharge({
    required RoomType roomType,
    required RentalType rentalType,
    required DateTime checkIn,
    required DateTime now,
  }) {
    final elapsed = now.difference(checkIn);
    final totalMinutes = elapsed.inMinutes < 0 ? 0 : elapsed.inMinutes;

    switch (rentalType) {
      case RentalType.HOURLY:
        return _computeHourly(roomType, totalMinutes);
      case RentalType.OVERNIGHT:
        return _computeOvernight(roomType, checkIn, now);
      case RentalType.DAILY:
        return _computeDaily(roomType, checkIn, now);
    }
  }

  // ──────────────────────────────────────────────
  //  THUÊ GIỜ  (THUEGIO)
  //  Logic khớp SP KANHOT:
  //    SOGIO = totalMinutes / 60  (floor integer)
  //    SOGIO_MOD = totalMinutes % 60
  //    Nếu SOGIO = 0 → tính 1 giờ đầu
  //    Nếu SOGIO > 0:
  //      SOGIO_MOD > 15 → giờ đầu + SOGIO × giờ thêm
  //      SOGIO_MOD ≤ 15 → giờ đầu + (SOGIO-1) × giờ thêm
  // ──────────────────────────────────────────────

  static double _computeHourly(RoomType roomType, int totalMinutes) {
    if (totalMinutes <= 0) return roomType.hourlyPrice;

    final soGio = totalMinutes ~/ 60; // floor
    final soGioMod = totalMinutes % 60;

    if (soGio == 0) {
      // Dưới 1 giờ → tính giá giờ đầu
      return roomType.hourlyPrice;
    }

    // Trên 1 giờ
    double charge = roomType.hourlyPrice;
    if (soGioMod > 15) {
      // Phần lẻ > 15 phút → tính thêm 1 giờ nữa
      charge += soGio * roomType.hourlyExtraHour;
    } else {
      // Phần lẻ ≤ 15 phút → miễn (grace period)
      charge += (soGio - 1) * roomType.hourlyExtraHour;
    }
    return charge;
  }

  // ──────────────────────────────────────────────
  //  QUA ĐÊM  (QUADEM)
  //  Giá thay đổi theo giờ check-in (4 khung):
  //    18-20h → overnightPricesByTimeSlot[0]
  //    20-22h → overnightPricesByTimeSlot[1]
  //    22h-2h → overnightPricesByTimeSlot[2] (cao nhất)
  //     2h-12h → overnightPricesByTimeSlot[3]
  //
  //  Cùng ngày (RE1=0):
  //    Checkout ≤ 12h  → giá qua đêm (phẳng)
  //    Checkout 12-22h → giá qua đêm + (checkoutH - 12 + 1) × giờ thêm
  //    Checkout > 22h  → giá qua đêm + giá ngày
  //
  //  Nhiều ngày (RE1>0):
  //    Checkout ≤ 12h  → giá qua đêm + RE1 × giá ngày
  //    Checkout 12-22h → giá qua đêm + RE1 × giá ngày + (checkoutH - 13 + 1) × giờ thêm
  //    Checkout > 22h  → giá qua đêm + (RE1+1) × giá ngày
  // ──────────────────────────────────────────────

  static double _computeOvernight(RoomType roomType, DateTime checkIn, DateTime now) {
    final checkInHour = checkIn.hour;
    final checkOutHour = now.hour;

    // Số ngày chênh lệch (chỉ tính ngày, không tính giờ)
    final checkInDate = DateTime(checkIn.year, checkIn.month, checkIn.day);
    final checkOutDate = DateTime(now.year, now.month, now.day);
    final re1 = checkOutDate.difference(checkInDate).inDays; // ≥ 0

    // Chọn giá qua đêm theo khung giờ check-in
    final overnightRate = _getOvernightRate(roomType, checkInHour);

    if (re1 <= 0) {
      // ── Cùng ngày ──
      if (checkOutHour <= 12) {
        return overnightRate;
      } else if (checkOutHour <= 22) {
        return overnightRate + (checkOutHour - 12 + 1) * roomType.hourlyExtraHour;
      } else {
        return overnightRate + _getDailyRate(roomType, checkIn);
      }
    } else {
      // ── Nhiều ngày ──
      if (checkOutHour <= 12) {
        return overnightRate + re1 * _getDailyRate(roomType, checkIn);
      } else if (checkOutHour <= 22) {
        return overnightRate +
            re1 * _getDailyRate(roomType, checkIn) +
            (checkOutHour - 13 + 1) * roomType.hourlyExtraHour;
      } else {
        return overnightRate + (re1 + 1) * _getDailyRate(roomType, checkIn);
      }
    }
  }

  /// Chọn giá qua đêm theo giờ check-in
  static double _getOvernightRate(RoomType roomType, int checkInHour) {
    // Nếu chưa cấu hình giá theo khung giờ → dùng giá mặc định
    final slots = roomType.overnightPricesByTimeSlot;
    final hasSlots = slots.any((p) => p > 0);
    if (!hasSlots) return roomType.overnightPrice;

    if (checkInHour >= 18 && checkInHour < 20) return slots[0];
    if (checkInHour >= 20 && checkInHour < 22) return slots[1];
    if (checkInHour >= 22 || checkInHour < 2) return slots[2]; // Cao nhất
    return slots[3]; // 2h-12h
  }

  // ──────────────────────────────────────────────
  //  THEO NGÀY  (THUENGAY)
  //
  //  Cùng ngày (RE1=0):
  //    Check-in ≥ 11h          → 1 ngày
  //    Check-in < 6h:
  //      Checkout ≤ 12h        → 1 ngày
  //      Checkout 13-17h       → 1 ngày + (checkoutH - 12) × giờ thêm
  //      Checkout > 17h        → 2 ngày
  //    Check-in 6-11h:
  //      Checkout ≤ 12h        → 1 ngày
  //      Checkout 13-17h       → 1 ngày
  //      Checkout > 17h        → (12 - checkInH - 1) × giờ thêm + 1 ngày
  //
  //  Nhiều ngày (RE1>0):
  //    Checkout ≤ 12h          → RE1 × giá ngày
  //    Checkout 12-22h:
  //      Check-in < 6h         → RE1 × giá ngày + (checkoutH - 12) × giờ thêm
  //      Check-in ≥ 6h         → RE1 × giá ngày + (checkoutH - 13 + 1) × giờ thêm + giờ thêm
  //    Checkout > 22h          → (RE1 + 1) × giá ngày
  // ──────────────────────────────────────────────

  static double _computeDaily(RoomType roomType, DateTime checkIn, DateTime now) {
    final checkInHour = checkIn.hour;
    final checkOutHour = now.hour;

    final checkInDate = DateTime(checkIn.year, checkIn.month, checkIn.day);
    final checkOutDate = DateTime(now.year, now.month, now.day);
    final re1 = checkOutDate.difference(checkInDate).inDays;

    final dailyRate = _getDailyRate(roomType, checkIn);

    if (re1 <= 0) {
      // ── Cùng ngày ──
      if (checkInHour >= 11) {
        return dailyRate;
      } else if (checkInHour < 6) {
        if (checkOutHour <= 12) {
          return dailyRate;
        } else if (checkOutHour >= 13 && checkOutHour <= 17) {
          return dailyRate + (checkOutHour - 12) * roomType.hourlyExtraHour;
        } else {
          // checkout > 17h → 2 ngày
          return dailyRate * 2;
        }
      } else {
        // Check-in 6-11h
        if (checkOutHour <= 12) {
          return dailyRate;
        } else if (checkOutHour >= 13 && checkOutHour <= 17) {
          return dailyRate;
        } else {
          // checkout > 17h
          return (12 - checkInHour - 1) * roomType.hourlyExtraHour + dailyRate;
        }
      }
    } else {
      // ── Nhiều ngày ──
      if (checkOutHour <= 12) {
        return re1 * dailyRate;
      } else if (checkOutHour <= 22) {
        if (checkInHour < 6) {
          return re1 * dailyRate + (checkOutHour - 12) * roomType.hourlyExtraHour;
        } else {
          return re1 * dailyRate +
              (checkOutHour - 13 + 1) * roomType.hourlyExtraHour +
              roomType.hourlyExtraHour;
        }
      } else {
        // checkout > 22h
        return (re1 + 1) * dailyRate;
      }
    }
  }

  /// Lấy giá ngày theo thứ trong tuần (KANHOT tblPriceList_byDate).
  /// Nếu chưa cấu hình → dùng basePrice.
  static double _getDailyRate(RoomType roomType, DateTime referenceDate) {
    final weekdayPrices = roomType.dailyPricesByWeekday;
    final hasWeekdayPrices = weekdayPrices.any((p) => p > 0);
    if (!hasWeekdayPrices) return roomType.basePrice;

    // DateTime.weekday: 1=Monday ... 7=Sunday → index 0-6
    final idx = referenceDate.weekday - 1;
    final price = weekdayPrices[idx];
    return price > 0 ? price : roomType.basePrice;
  }

  // ──────────────────────────────────────────────
  //  TIỆN ÍCH
  // ──────────────────────────────────────────────

  /// Định dạng thời gian đã ở dạng HH:MM:SS
  static String formatElapsed(DateTime checkIn, DateTime now) {
    var diff = now.difference(checkIn);
    if (diff.isNegative) diff = Duration.zero;
    final h = diff.inHours.toString().padLeft(2, '0');
    final m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final s = (diff.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }
}
