import 'package:isar/isar.dart';

part 'vehicle.g.dart';

enum VehicleType { container, truck, tractor, mooc }
enum VehicleStatus { active, maintenance, broken, inactive }

@collection
class Vehicle {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String licensePlate;

  String? chassisNumber;
  String? engineNumber;

  @Enumerated(EnumType.name)
  VehicleType vehicleType = VehicleType.tractor;

  String? brand;
  int? manufacturingYear;
  double? loadCapacity; // tấn

  DateTime? registrationDate;
  DateTime? registrationExpiry;

  // Insurance
  String? insuranceNumber;
  DateTime? insuranceExpiry;

  // GPS
  String? gpsDeviceId;
  bool hasGps = false;

  // ETC
  String? etcDeviceId;
  bool hasEtc = false;

  // Paired mooc (for tractor)
  String? pairedMoocPlate;

  @Enumerated(EnumType.name)
  VehicleStatus status = VehicleStatus.active;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
