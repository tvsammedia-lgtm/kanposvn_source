import 'package:isar/isar.dart';

part 'vantai_driver.g.dart';

enum DriverRole {
  DRIVER('Tài xế'),
  ASSISTANT('Phụ xe');

  final String label;
  const DriverRole(this.label);
}

/// PRD mục 4-5: Tài xế & Phụ xe — hồ sơ, GPLX, hạng bằng, hạn, lương,
/// phụ cấp, chuyến chạy, thưởng.
@collection
class VantaiDriver {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String driverId = '';

  String name = '';
  String phone = '';
  String cccd = '';

  // Giấy phép lái xe
  String licenseNumber = '';
  String licenseClass = ''; // B2, C, D1, E, F...
  DateTime? licenseExpiry;

  double baseSalary = 0; // Lương cơ bản
  double allowance = 0; // Phụ cấp
  double bonus = 0; // Thưởng

  @enumerated
  DriverRole role = DriverRole.DRIVER;
}
