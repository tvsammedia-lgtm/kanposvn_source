import 'package:isar/isar.dart';
import 'gara_customer.dart';

part 'gara_vehicle.g.dart';

@collection
class GaraVehicle {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String vehicleId = '';

  String licensePlate = ''; // Biển số
  String brand = ''; // Hãng (Honda, Toyota...)
  String modelName = ''; // Dòng xe (SH, Vios...)
  String vin = ''; // Số khung
  String engineNumber = ''; // Số máy

  final owner = IsarLink<GaraCustomer>();
}
