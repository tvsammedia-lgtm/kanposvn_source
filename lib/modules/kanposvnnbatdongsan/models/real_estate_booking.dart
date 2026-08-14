import 'package:isar/isar.dart';

part 'real_estate_booking.g.dart';

@collection
class RealEstateBooking {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  @Index()
  String? realEstateUuid;

  String? userUuid; // ID người mua
  
  double depositAmount = 0.0;
  
  @enumerated
  BookingStatus status = BookingStatus.pending;
  
  DateTime? createdAt;
}

enum BookingStatus {
  pending,  // Đang xử lý
  accepted, // Chủ nhà đồng ý cọc
  rejected  // Bị từ chối
}
