import 'package:isar/isar.dart';

part 'vehicle.g.dart';

@collection
class ParkingVehicle {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String vehicleId = '';

  String customerId = ''; // Liên kết khách hàng (nếu có)
  
  @Index(type: IndexType.hash)
  String licensePlate = ''; // Biển số xe

  @Index(type: IndexType.hash)
  String rfidCard = ''; // Thẻ từ RFID
  
  String qrCode = '';
  
  String vehicleType = 'motorbike'; // motorbike, car, electric_bike, electric_car
  String brand = ''; // Honda, Yamaha, Toyota...
  String model = '';
  String color = '';
  
  String status = 'active'; // active, blocked (blacklist)
  
  DateTime createdAt = DateTime.now();
}
