import 'package:isar/isar.dart';
import 'vantai_route.dart';
import 'vantai_vehicle.dart';

part 'vantai_trip.g.dart';

enum TripStatus {
  SCHEDULED('Sắp chạy'),
  RUNNING('Đang chạy'),
  COMPLETED('Hoàn thành'),
  CANCELLED('Đã hủy');

  final String label;
  const TripStatus(this.label);
}

@collection
class VantaiTrip {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String tripId = '';
  
  DateTime? departureTime;
  DateTime? arrivalTime;
  
  @enumerated
  TripStatus status = TripStatus.SCHEDULED;
  
  String driverName = '';
  
  final route = IsarLink<VantaiRoute>();
  final vehicle = IsarLink<VantaiVehicle>();
}
