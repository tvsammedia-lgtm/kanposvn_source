import 'package:isar/isar.dart';

part 'ride_vehicle_type.g.dart';

@collection
class KanRideVehicleType {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String vehicleTypeId = '';
  
  String name = ''; // Xe máy, Ô tô 4 chỗ...
  double baseFare = 0; // Giá mở cửa
  double pricePerKm = 0; // Giá mỗi Km
  double pricePerMinute = 0; // Giá mỗi phút
  
  String status = 'active'; // active, inactive
}
