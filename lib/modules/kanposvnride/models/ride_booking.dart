import 'package:isar/isar.dart';

part 'ride_booking.g.dart';

@collection
class KanRideBooking {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String bookingId = '';
  
  String customerId = '';
  String? driverId;
  
  String pickupAddress = '';
  double pickupLat = 0;
  double pickupLng = 0;
  
  String dropoffAddress = '';
  double dropoffLat = 0;
  double dropoffLng = 0;
  
  double distanceKm = 0;
  double estimatedPrice = 0;
  
  String vehicleTypeId = '';
  
  String status = 'pending'; // pending, accepted, in_progress, completed, cancelled
  
  DateTime createdAt = DateTime.now();
}
