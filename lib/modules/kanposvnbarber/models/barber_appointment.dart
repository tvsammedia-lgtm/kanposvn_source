import 'package:isar/isar.dart';

part 'barber_appointment.g.dart';

@collection
class BarberAppointment {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String appointmentId = '';

  String customerId = '';
  String customerName = '';
  String employeeId = ''; // Thợ cắt
  String employeeName = '';

  DateTime appointmentDate = DateTime.now();
  String appointmentTime = ''; // e.g., '14:30'

  // Chờ xác nhận, Đã xác nhận, Đang phục vụ, Hoàn thành, Hủy
  String status = 'Chờ xác nhận';

  String? notes;
  List<String> serviceIds = [];

  @Index()
  DateTime createdAt = DateTime.now();
}
