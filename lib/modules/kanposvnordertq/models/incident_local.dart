import 'package:isar/isar.dart';

part 'incident_local.g.dart';

@collection
class IncidentLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String incidentId = '';

  @Index()
  String? tripId;

  @Index()
  String? orderId;

  String? type; // ACCIDENT, DELAY, DAMAGE, LOST, OTHER
  String? severity; // LOW, MEDIUM, HIGH
  String? description;
  String? status; // REPORTED, RESOLVED

  @Index()
  DateTime? reportedAt;
  String? reportedBy;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}