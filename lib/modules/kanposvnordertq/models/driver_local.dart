import 'package:isar/isar.dart';

part 'driver_local.g.dart';

@collection
class DriverLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String driverId = '';

  String? driverCode;
  String? name;
  String? phone;
  String? licenseNumber;
  @Index()
  DateTime? licenseExpiry;
  String? status; // ACTIVE, INACTIVE

  @Index()
  String? userId;

  @Index()
  String? currentVehicleId;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
