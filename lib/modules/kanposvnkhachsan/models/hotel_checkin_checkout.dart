import 'package:isar/isar.dart';
import 'hotel_room.dart';
import 'hotel_booking.dart';

part 'hotel_checkin_checkout.g.dart';

enum RentalType {
  HOURLY('Theo giờ'),
  OVERNIGHT('Qua đêm'),
  DAILY('Theo ngày');

  final String label;
  const RentalType(this.label);
}

@collection
class RoomCheckIn {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String checkInId = ''; // UUID for sync

  final room = IsarLink<HotelRoom>();
  final reservation = IsarLink<RoomReservation>(); // optional
  
  String customerName = '';
  String customerIdentity = ''; // CMND/CCCD/Passport
  String customerPhone = '';
  
  DateTime? actualCheckIn;
  DateTime? expectedCheckOut;
  DateTime? actualCheckOut;
  
  @enumerated
  RentalType rentalType = RentalType.DAILY;
  
  double roomTotalCharge = 0; // Tiền phòng
  double serviceTotalCharge = 0; // Tiền dịch vụ/minibar
  double discount = 0;
  double prePaid = 0; // Tiền trả trước/cọc
  double finalTotal = 0; // Tổng thanh toán
  
  bool isCheckedOut = false;
  
  String note = '';
  DateTime createdAt = DateTime.now();
}
