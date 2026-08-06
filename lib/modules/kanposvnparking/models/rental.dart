import 'package:isar/isar.dart';

part 'rental.g.dart';

@collection
class ParkingRental {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String rentalId = '';
  
  String customerName = '';
  String customerPhone = '';
  String customerCccd = '';
  
  String vehicleId = ''; // ID của phương tiện cho thuê (đã đăng ký trong Vehicle)
  String licensePlate = ''; 
  
  DateTime rentStartTime = DateTime.now();
  DateTime rentEndTime = DateTime.now().add(const Duration(days: 1)); // Thuê 1 ngày
  DateTime? actualReturnTime;
  
  double depositAmount = 0; // Tiền cọc
  double rentalFee = 0; // Tiền thuê
  
  String status = 'renting'; // renting, returned, overdue
}
