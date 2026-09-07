import 'package:isar/isar.dart';

part 'audit_log_local.g.dart';

@collection
class AuditLogLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String auditId = '';

  String? userId;
  String? action; // UPDATE_ORDER_STATUS, TRIP_DEPARTED...
  String? entity; // ORDER, TRIP, VEHICLE...
  String? entityId;
  String? oldValue;
  String? newValue;
  String? note;

  @Index()
  DateTime? createdAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}