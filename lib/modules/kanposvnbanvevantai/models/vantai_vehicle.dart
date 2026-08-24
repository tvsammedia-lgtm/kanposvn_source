import 'package:isar/isar.dart';

part 'vantai_vehicle.g.dart';

enum VehicleType {
  SLEEPER('Giường nằm'),
  SEAT('Ghế ngồi'),
  LIMOUSINE('Limousine'),
  TRUCK('Xe tải');

  final String label;
  const VehicleType(this.label);
}

enum VehicleStatus {
  ACTIVE('Đang hoạt động'),
  MAINTENANCE('Bảo dưỡng'),
  REPAIR('Sửa chữa');

  final String label;
  const VehicleStatus(this.label);
}

@collection
class VantaiVehicle {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String vehicleId = '';

  String plateNumber = '';
  @enumerated
  VehicleType type = VehicleType.SLEEPER;
  int totalSeats = 0;
  String brand = '';
  int manufactureYear = 2020;

  // Thông tin kỹ thuật / theo dõi (PRD mục 3)
  bool gpsEnabled = false;
  double odometerKm = 0; // km đã chạy
  DateTime? nextMaintenanceDate; // lịch bảo dưỡng
  double nextMaintenanceKm = 0; // km hạn bảo dưỡng
  DateTime? lastOilChange; // thay nhớt
  DateTime? lastTireChange; // thay lốp
  DateTime? inspectionExpiry; // đăng kiểm
  DateTime? insuranceExpiry; // bảo hiểm

  @enumerated
  VehicleStatus status = VehicleStatus.ACTIVE;
}
