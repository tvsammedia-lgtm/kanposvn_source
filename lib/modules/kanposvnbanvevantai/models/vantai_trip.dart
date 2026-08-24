import 'package:isar/isar.dart';
import 'vantai_route.dart';
import 'vantai_vehicle.dart';
import 'vantai_driver.dart';

part 'vantai_trip.g.dart';

enum TripStatus {
  SCHEDULED('Sắp chạy'),
  RUNNING('Đang chạy'),
  COMPLETED('Hoàn thành'),
  CANCELLED('Đã hủy');

  final String label;
  const TripStatus(this.label);
}

@collection
class VantaiTrip {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String tripId = '';

  @Index()
  DateTime? departureTime;
  DateTime? arrivalTime;

  @enumerated
  TripStatus status = TripStatus.SCHEDULED;

  // Giữ driverName/assistantName để hiển thị nhanh & tương thích dữ liệu cũ.
  // Điều xe mới nên link [driver] + [assistant].
  String driverName = '';
  String assistantName = '';

  final route = IsarLink<VantaiRoute>();
  final vehicle = IsarLink<VantaiVehicle>();
  final driver = IsarLink<VantaiDriver>();
  final assistant = IsarLink<VantaiDriver>();
}
