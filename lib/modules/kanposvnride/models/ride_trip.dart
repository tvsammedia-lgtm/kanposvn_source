import 'package:isar/isar.dart';

part 'ride_trip.g.dart';

@collection
class KanRideTrip {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String tripId = '';
  
  String bookingId = ''; // Cuốc xe tương ứng
  String driverId = ''; // Tài xế nhận cuốc
  
  DateTime startTime = DateTime.now();
  DateTime? endTime;
  
  double actualDistanceKm = 0;
  double finalPrice = 0;
  
  String status = 'in_progress'; // in_progress, completed, cancelled
  
  DateTime createdAt = DateTime.now();
}
