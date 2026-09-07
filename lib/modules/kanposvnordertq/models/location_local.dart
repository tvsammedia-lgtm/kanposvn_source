import 'package:isar/isar.dart';

part 'location_local.g.dart';

@collection
class LocationLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String locationId = '';

  @Index()
  String? tripId;
  
  @Index()
  String? vehicleId;
  
  @Index()
  String? driverId;

  double? latitude;
  double? longitude;
  double? accuracy;
  double? speed;
  double? heading;
  double? batteryLevel;

  @Index()
  DateTime? recordedAt;
  
  DateTime? serverReceivedAt;

  @Index()
  DateTime? syncedAt;
}
