import 'package:isar/isar.dart';

part 'tax_rule.g.dart';

@collection
class TaxRule {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? ruleCode;
  int? taxYear;
  DateTime? effectiveFrom;
  DateTime? effectiveTo;
  String? businessType;
  double? revenueMin;
  double? revenueMax;
  String? taxType; // VAT, PIT, OTHER
  String? calculationMethod;
  double? rate;
  double? fixedAmount;
  String? deductibleRule;
  String? sourceReference;
  String? status;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? serverVersion;
  DateTime? deletedAt;
}
