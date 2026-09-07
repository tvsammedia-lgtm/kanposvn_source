import 'package:isar/isar.dart';

part 'queueticket.g.dart';

/// QueueTicket (§5): số thứ tự hàng đợi tiếp nhận.
@collection
class QueueTicket {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? patientId;

  @Index()
  String? appointmentId;

  String? doctorId;
  String? branchId;
  String? roomId;

  int? number;
  String? priority; // normal, emergency, elder, child

  @Index()
  String? status; // waiting, called, done, cancelled

  DateTime? createdAt;
  DateTime? calledAt;

  // Sync fields
  DateTime? updatedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}