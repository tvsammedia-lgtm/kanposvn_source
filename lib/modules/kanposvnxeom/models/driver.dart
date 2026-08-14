import 'package:isar/isar.dart';

part 'driver.g.dart';

@collection
class XeOmDriver {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? fullName;
  String? cccd;
  String? driverLicense; // GPLX
  DateTime? driverLicenseExpiry;
  String? phone;
  String? address;
  DateTime? dateOfBirth;
  
  String? avatarUrl;
  String? licenseImageUrl;
  String? vehicleImageUrl;
  
  @enumerated
  DriverStatus status = DriverStatus.offline;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum DriverStatus {
  online,
  offline,
  busy, // Đang chạy chuyến
  suspended // Bị đình chỉ
}
