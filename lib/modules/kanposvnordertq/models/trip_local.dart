import 'package:isar/isar.dart';

part 'trip_local.g.dart';

@collection
class TripLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String tripId = '';

  String? tripCode;
  
  @Index()
  String? vehicleId;
  
  @Index()
  String? driverId;

  String? origin;
  String? destination;
  String? status;

  DateTime? plannedDeparture;
  DateTime? actualDeparture;
  DateTime? plannedArrival;
  DateTime? estimatedArrival;
  DateTime? actualArrival;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
