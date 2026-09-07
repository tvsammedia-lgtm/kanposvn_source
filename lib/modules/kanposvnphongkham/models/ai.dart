import 'package:isar/isar.dart';

part 'ai.g.dart';

@collection
class AIRequest {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? doctorId;

  @Index()
  String? patientId;

  String? encounterId;

  /// summary, symptom_analysis, lab_analysis, prescription_draft
  String? requestType;

  String? promptVersion;
  String? requestHash;
  String? responseHash;
  
  String? suggestionDataJson; // JSON of AI suggestions

  // Audit
  String? doctorAction; // accepted, rejected, edited
  String? acceptedItemsJson;
  String? rejectedItemsJson;
  String? editedItemsJson;

  DateTime? createdAt;
}

@collection
class AuditLog {
  Id id = Isar.autoIncrement;

  @Index()
  String? userId;

  @Index()
  String? action; // LOGIN, PATIENT_VIEW, PRESCRIPTION_CONFIRM...

  String? details;

  DateTime? createdAt;
}
