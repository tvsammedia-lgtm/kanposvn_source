import 'package:isar/isar.dart';

part 'tax_reconciliation.g.dart';

@collection
class TaxReconciliation {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? businessId;
  String? taxPeriod;
  String? reconciliationType; // POS_VS_INVOICE, POS_VS_BANK
  
  double? sourceAmount;
  double? targetAmount;
  double? differenceAmount;
  int? differenceCount;
  
  String? status; // Matched, Difference, PendingReview, Resolved
  String? issueSummary;
  String? resolutionNote;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? serverVersion;
  DateTime? deletedAt;
}
