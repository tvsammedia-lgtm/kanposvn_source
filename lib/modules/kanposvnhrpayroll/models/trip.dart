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

  // ─── Thông tin lương chuyến (bảng lương chuyến theo HOA) ────────────────
  /// Nhóm tải trọng xe thực hiện chuyến (VD: "3.5T", "5T", "8T", "HT").
  String? capacityBucket;

  /// Mã tuyến / mã chuyến (VD: "HCM", "DN", "GL", "NTG").
  String? routeCode;

  /// Tên nơi giao hàng (VD: "TP.HCM", "Đồng Nai", "Gia Lai").
  String? routeName;

  /// Đơn giá lương chuyến của chuyến này (VNĐ) — tra từ TripPrice khi seed.
  double tripSalaryAmount = 0;

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
