import 'package:isar/isar.dart';

part 'trip.g.dart';

enum TripStatus { assigned, inProgress, completed, cancelled }

@collection
class Trip {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String tripCode;

  DateTime? tripDate;
  String? customerName;
  String? pickupPoint;
  String? deliveryPoint;
  String? cargoType;
  double? cargoWeight; // tấn

  String? containerNumber;
  String? vehiclePlate;
  String? moocPlate;

  // Driver IDs
  int? mainDriverId;
  String? mainDriverName;
  int? assistantDriverId;
  String? assistantDriverName;

  // Coordinator
  String? coordinatorName;

  DateTime? departureDate;
  DateTime? returnDate;

  double? distanceKm;
  double? revenue;
  double? expenses;

  @ignore
  double get profit => (revenue ?? 0) - (expenses ?? 0);

  @Enumerated(EnumType.name)
  TripStatus status = TripStatus.assigned;

  // Notes
  String? notes;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
