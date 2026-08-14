import 'package:isar/isar.dart';

part 'customer.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement;

  String? customerCode;
  String? fullName;
  String? cccd;
  DateTime? dateOfBirth;
  String? gender;
  String? phone;
  String? email;
  String? address;

  // Tài chính
  double? debtAmount;
  double? totalPurchase;
  double? totalPawn;
  double? totalConsignment;

  // Điểm thưởng
  int? rewardPoints;
  String? membershipTier;

  DateTime? createdAt;
  DateTime? updatedAt;
}
