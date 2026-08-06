import 'package:isar/isar.dart';

part 'monthly_ticket.g.dart';

@collection
class ParkingMonthlyTicket {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String ticketId = '';
  
  String customerName = '';
  String customerPhone = '';
  String customerCccd = '';
  
  String licensePlate = '';
  String vehicleType = 'motorbike'; // motorbike, car
  
  String rfidCard = '';
  
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 30));
  
  double feeAmount = 0;
  String status = 'active'; // active, expired, suspended
}
