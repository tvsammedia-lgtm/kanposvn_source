import 'package:isar/isar.dart';

part 'tax_audit_log.g.dart';

@collection
class TaxAuditLog {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? userId;
  String? action;
  String? entityType;
  String? entityId;
  
  String? beforeJson;
  String? afterJson;
  String? reason;
  String? ipAddress;
  
  DateTime? createdAt;
}
