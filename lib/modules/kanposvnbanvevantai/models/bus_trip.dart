import 'package:isar/isar.dart';

part 'bus_trip.g.dart';

@collection
class BusTripLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? plateNumber; // Biển số xe
  String? driverName; // Tên tài xế
  
  double? currentLat;
  double? currentLng;
  
  double? destinationLat; // Vị trí điểm đón (khách hàng)
  double? destinationLng;

  DateTime? updatedAt;
}
