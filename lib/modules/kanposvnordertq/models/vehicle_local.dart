import 'package:isar/isar.dart';

part 'vehicle_local.g.dart';

@collection
class VehicleLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String vehicleId = '';

  String? vehicleCode;
  String? plateNumber;
  String? vehicleType;
  
  double? capacityWeight;
  double? capacityVolume;
  
  String? status;
  
  double? currentLatitude;
  double? currentLongitude;
  double? currentSpeed;
  double? currentHeading;
  DateTime? lastLocationAt;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
