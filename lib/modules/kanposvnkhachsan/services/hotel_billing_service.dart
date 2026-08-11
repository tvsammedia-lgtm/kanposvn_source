import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_room.dart';

class HotelBillingCalculator {
  // Tính tiền phòng theo loại thuê + thời gian đã ở (tính tới thời điểm hiện tại)
  static double computeRoomCharge({
    required RoomType roomType,
    required RentalType rentalType,
    required DateTime checkIn,
    required DateTime now,
  }) {
    final elapsed = now.difference(checkIn);
    final minutes = elapsed.inMinutes < 0 ? 0 : elapsed.inMinutes;
    final hours = minutes / 60.0;

    switch (rentalType) {
      case RentalType.HOURLY:
        // Giờ đầu tính theo hourlyPrice, từ giờ 2 trở đi tính theo hourlyExtraHour
        if (hours <= 1) return roomType.hourlyPrice;
        // Từ 12h trở lên chuyển sang giá thuê ngày (12-24h)
        if (hours < 12) {
          final extraHours = (hours - 1).ceil();
          return roomType.hourlyPrice + extraHours * roomType.hourlyExtraHour;
        }
        return roomType.basePrice;
      case RentalType.OVERNIGHT:
        // Giá qua đêm áp dụng cho tối đa 12h
        if (hours <= 12) return roomType.overnightPrice;
        final extraHours = (hours - 12).ceil();
        return roomType.overnightPrice + extraHours * roomType.hourlyExtraHour;
      case RentalType.DAILY:
        final days = (hours / 24).ceil();
        return roomType.basePrice * days;
    }
  }

  // Định dạng thời gian đã ở dạng HH:MM:SS
  static String formatElapsed(DateTime checkIn, DateTime now) {
    var diff = now.difference(checkIn);
    if (diff.isNegative) diff = Duration.zero;
    final h = diff.inHours.toString().padLeft(2, '0');
    final m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final s = (diff.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }
}
