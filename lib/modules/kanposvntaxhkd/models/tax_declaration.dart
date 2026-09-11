import 'package:isar/isar.dart';

part 'tax_declaration.g.dart';

@collection
class TaxDeclaration {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  String? businessId;
  String? taxYear;
  String? taxPeriod;
  String? taxType;
  
  String? formCode;
  String? formVersion;
  String? methodCode;
  
  double? revenueAmount;
  double? expenseAmount;
  double? taxableIncome;
  double? vatAmount;
  double? pitAmount;
  double? otherTaxAmount;
  double? totalPayable;
  
  String? dataHash;
  String? status; // Draft, ReadyToSubmit, Submitted, Accepted, Rejected
  
  DateTime? submittedAt;
  DateTime? acceptedAt;
  String? receiptNumber;
  List<String>? attachmentIds;
  
  String? createdBy;
  String? approvedBy;
  
  DateTime? createdAt;
  DateTime? updatedAt;
}
