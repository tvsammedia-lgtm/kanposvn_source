import 'package:isar/isar.dart';

part 'appointment.g.dart';

@collection
class Appointment {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? clinicId;

  @Index()
  String? branchId;

  @Index()
  String? tenantId;

  @Index()
  String? patientId;

  @Index()
  String? doctorId;

  String? specialtyId;
  String? roomId;

  @Index()
  DateTime? appointmentDate;
  DateTime? startTime;
  DateTime? endTime;

  String? reason;
  String? note;

  /// Trạng thái: requested, confirmed, checked_in, waiting, in_progress, completed, cancelled, no_show, rescheduled
  @Index()
  String? status;
  
  String? reminderStatus;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}
