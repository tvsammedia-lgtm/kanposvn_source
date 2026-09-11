import 'package:isar/isar.dart';
import '../models/tax_audit_log.dart';

class TaxAuditService {
  final Isar isar;

  TaxAuditService(this.isar);

  Future<void> logAction({
    required String tenantId,
    required String userId,
    required String action,
    required String entityType,
    required String entityId,
    String? beforeJson,
    String? afterJson,
    String? reason,
  }) async {
    final log = TaxAuditLog()
      ..tenantId = tenantId
      ..userId = userId
      ..action = action
      ..entityType = entityType
      ..entityId = entityId
      ..beforeJson = beforeJson
      ..afterJson = afterJson
      ..reason = reason
      ..createdAt = DateTime.now();
      
    await isar.writeTxn(() async {
      await isar.taxAuditLogs.put(log);
    });
  }
}
