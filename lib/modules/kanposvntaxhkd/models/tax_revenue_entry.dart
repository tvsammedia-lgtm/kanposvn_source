import 'package:isar/isar.dart';

part 'tax_revenue_entry.g.dart';

@collection
class TaxRevenueEntry {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? businessId;
  String? branchId;
  int? fiscalYear;
  String? taxPeriod;
  DateTime? documentDate;
  String? documentType;
  String? documentId;
  String? invoiceNumber;
  String? salesChannel;
  String? customerId;
  String? industryCode;
  
  double? grossRevenue;
  double? discountAmount;
  double? returnAmount;
  double? adjustmentAmount;
  double? taxableRevenue;
  double? nonTaxableRevenue;
  double? vatTaxableRevenue;
  double? pitTaxableRevenue;
  
  String? paymentStatus;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? serverVersion;
  DateTime? deletedAt;
}
