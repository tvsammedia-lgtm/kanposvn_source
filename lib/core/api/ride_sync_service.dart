import 'dart:async';
import '../../modules/kanposvnride/models/ride_booking.dart';

class RideSyncService {
  static const String baseUrl = 'https://kanride-api.vercel.app/api';

  /// Giả lập việc gọi HTTP POST lên Vercel để đồng bộ các cuốc xe đang offline
  static Future<bool> pushPendingBookings(List<RideBooking> bookings) async {
    if (bookings.isEmpty) return true;

    try {
      // Giả lập độ trễ mạng
      await Future.delayed(const Duration(milliseconds: 1000));
      
      // Log ra console để dễ debug quá trình sync ngầm
      print('SYNC ENGINE: Đã đồng bộ thành công ${bookings.length} cuốc xe lên Vercel.');
      
      return true;
    } catch (e) {
      print('SYNC ENGINE: Lỗi đồng bộ - $e');
      return false;
    }
  }
}
