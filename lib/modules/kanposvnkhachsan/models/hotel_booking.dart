import 'package:isar/isar.dart';
import 'hotel_room.dart';

part 'hotel_booking.g.dart';

enum BookingSource {
  walkIn('Trực tiếp (Walk-in)'),
  bookingCom('Booking.com'),
  agoda('Agoda'),
  traveloka('Traveloka'),
  dienThoai('Điện thoại'),
  facebook('Facebook / Zalo');

  final String label;
  const BookingSource(this.label);
}

enum ReservationStatus {
  PENDING('Chờ nhận phòng'),
  CHECKED_IN('Đã nhận phòng'),
  CANCELLED('Đã hủy');

  final String label;
  const ReservationStatus(this.label);
}

@collection
class RoomReservation {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String reservationId = ''; // UUID for sync

  String reservationCode = ''; // readable code

  final room = IsarLink<HotelRoom>();
  
  String customerName = '';
  String customerPhone = '';
  
  DateTime? expectedCheckIn;
  DateTime? expectedCheckOut;
  
  int guestCount = 1;
  double depositAmount = 0; // Tiền cọc đặt phòng
  
  @enumerated
  BookingSource source = BookingSource.walkIn;
  
  @enumerated
  ReservationStatus status = ReservationStatus.PENDING;
  
  String note = '';
  DateTime createdAt = DateTime.now();
}
