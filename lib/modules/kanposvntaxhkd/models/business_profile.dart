import 'package:isar/isar.dart';

part 'business_profile.g.dart';

@collection
class BusinessProfile {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  String? tenantId;
  
  String? taxCode;
  String? businessName;
  String? ownerName;
  String? identifyNumber; // CCCD/CMND
  String? registeredAddress;
  String? primaryIndustryCode;
  DateTime? operationStartDate;
  String? phoneNumber;
  String? email;
  String? bankAccount;
  String? eWallet;
  String? taxCalculationMethod;
  String? taxAuthority;
  String? taxPeriodType;
  String? status;
  int? effectiveTaxYear;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? serverVersion;
  DateTime? deletedAt;
}
