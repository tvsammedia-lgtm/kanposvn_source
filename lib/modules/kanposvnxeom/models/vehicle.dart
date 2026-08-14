import 'package:isar/isar.dart';

part 'vehicle.g.dart';

@collection
class XeOmVehicle {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? driverUuid; // Xe thuộc về tài xế nào (hoặc công ty)
  
  String? licensePlate; // Biển số
  
  @enumerated
  VehicleType type = VehicleType.motorbike;
  
  String? color;
  String? brand;
  int? manufactureYear;
  
  DateTime? insuranceExpiry; // Hạn bảo hiểm
  DateTime? registrationExpiry; // Hạn đăng kiểm
  
  bool hasGps = false;
  
  @enumerated
  VehicleStatus status = VehicleStatus.active;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum VehicleType {
  motorbike, // Xe ôm
  taxi4Seats, // Taxi 4 chỗ
  taxi7Seats, // Taxi 7 chỗ
  evTaxi, // Taxi điện
  truck, // Xe tải
  delivery // Giao hàng
}

enum VehicleStatus {
  active,
  maintenance, // Bảo dưỡng
  inactive
}
