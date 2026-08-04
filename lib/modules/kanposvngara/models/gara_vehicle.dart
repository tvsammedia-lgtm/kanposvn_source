import 'package:isar/isar.dart';
import 'gara_customer.dart';

part 'gara_vehicle.g.dart';

@collection
class GaraVehicle {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String vehicleId = '';

  String licensePlate = ''; // Biển số
  String brand = ''; // Hãng (Honda, Toyota...)
  String modelName = ''; // Dòng xe (SH, Vios...)
  String vin = ''; // Số khung
  String engineNumber = ''; // Số máy

  final owner = IsarLink<GaraCustomer>();
}
