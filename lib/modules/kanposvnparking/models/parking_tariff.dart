import 'package:isar/isar.dart';

part 'parking_tariff.g.dart';

/// §6. Bảng giá trông giữ xe theo loại xe:
/// giờ đầu + các giờ tiếp theo (làm tròn lên từng giờ), chặn trần theo ngày.
@collection
class ParkingTariff {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String tariffId = '';

  /// motorbike, car, electric_bike, electric_car, bicycle
  @Index()
  String vehicleType = 'motorbike';

  double firstHourPrice = 0;

  double nextHourPrice = 0;

  /// Trần một ngày/đêm (24h). 0 = không chặn trần.
  double dailyMaxPrice = 0;

  String note = '';
}
