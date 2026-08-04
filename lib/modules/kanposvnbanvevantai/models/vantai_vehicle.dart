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
  
  String plateNumber = ''; // Biển số
  
  @enumerated
  VehicleType type = VehicleType.SLEEPER;
  
  int totalSeats = 0; // Tổng số chỗ
  
  String brand = ''; // Hãng xe (Thaco, Hyundai...)
  int manufactureYear = 2020;
}
