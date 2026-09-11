import 'package:isar/isar.dart';

part 'tax_period.g.dart';

@collection
class TaxPeriod {
  Id id = Isar.autoIncrement;

  @Index()
  String? tenantId;
  
  int? fiscalYear;
  String? taxType;
  String? periodType; // Month, Quarter, Year
  int? periodNumber;
  DateTime? periodStart;
  DateTime? periodEnd;
  DateTime? declarationDueDate;
  DateTime? paymentDueDate;
  
  String? status; // Upcoming, Open, Draft, Submitted, Paid, Overdue
  DateTime? submittedAt;
  DateTime? paidAt;
  
  double? declaredAmount;
  double? paidAmount;
  
  String? note;
  String? syncStatus;
  DateTime? createdAt;
}
