import 'package:isar/isar.dart';
import 'customer.dart';

part 'pawn_contract.g.dart';

@collection
class PawnContract {
  Id id = Isar.autoIncrement;

  String? contractNumber;
  
  final customer = IsarLink<Customer>();
  
  // Thông tin CCCD
  String? cccdNumber;
  String? cccdImageFront;
  String? cccdImageBack;
  String? portraitImage;
  
  // Tài sản
  String? assetImage;
  String? imei;
  String? serial;
  String? description;
  double? assetValue;
  
  // Tiền & Lãi suất
  double? pawnAmount;
  double? interestRate;
  
  @enumerated
  InterestType interestType = InterestType.daily;
  
  DateTime? pawnDate;
  DateTime? dueDate;
  int? numberOfDays;
  
  double? totalInterest;
  double? paidInterest;
  
  int? renewalCount;
  DateTime? lastInterestCollectionDate;
  double? totalInterestCollected;
  
  String? assetModel;
  String? assetBrand;
  
  @enumerated
  PawnStatus status = PawnStatus.active;
  
  DateTime? createdAt;
  DateTime? updatedAt;
}

enum InterestType {
  daily,
  monthly,
  yearly,
  fixedAmount,
  decliningBalance
}

enum PawnStatus {
  active,
  redeemed,
  liquidated,
  overdue
}
