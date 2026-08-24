import 'package:isar/isar.dart';

part 'customer.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement;
  DateTime? deletedAt;
  String deviceId = "";

  @Index(unique: true, replace: true)
  String? remoteId;

  String? name;
  String? phone;
  String? email;
  String? address;
  String? notes;

  @Enumerated(EnumType.name)
  CustomerType type = CustomerType.buyer;

  /// Khách VIP (báo cáo khách hàng - PRD mục 15).
  bool isVip = false;

  // Nhu cầu khách mua (PRD mục 6)
  String? demandCity;
  String? demandDistrict;
  String? demandWard;
  String? demandArea; // Khu vực mong muốn
  double? demandPriceFrom;
  double? demandPriceTo;
  double? demandAreaFrom;
  double? demandAreaTo;
  String? demandPropertyType;
  String? demandDirection; // Hướng mong muốn
  String? demandFrontage; // Mặt tiền mong muốn
  String? demandLegalStatus; // Pháp lý mong muốn

  // Sync details
  DateTime? updatedAt;
  int? version;
  bool isSynced = false;
}

enum CustomerType {
  buyer,
  seller
}
