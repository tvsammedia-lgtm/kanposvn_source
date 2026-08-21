import 'package:isar/isar.dart';

part 'spa_appointment.g.dart';

enum SpaAppointmentStatus {
  BOOKED('Đã đặt'),
  IN_SERVICE('Đang phục vụ'),
  COMPLETED('Hoàn thành'),
  CANCELLED('Hủy');

  final String label;
  const SpaAppointmentStatus(this.label);
}

/// Lịch hẹn (spec §4)
@collection
class SpaAppointment {
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
  String serviceId = '';
  String serviceName = '';
  String technicianId = '';
  String technicianName = '';
  String bedId = '';
  String bedName = '';

  @Index()
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  @enumerated
  SpaAppointmentStatus status = SpaAppointmentStatus.BOOKED;

  String notes = '';
}
