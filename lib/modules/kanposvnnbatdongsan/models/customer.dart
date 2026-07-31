import 'package:isar/isar.dart';

part 'customer.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? remoteId;

  String? name;
  String? phone;
  String? email;
  String? address;
  String? notes;

  @Enumerated(EnumType.name)
  CustomerType type = CustomerType.buyer;

  // For Buyers
  String? demandCity;
  String? demandDistrict;
  String? demandWard;
  double? demandPriceFrom;
  double? demandPriceTo;
  double? demandArea;
  String? demandPropertyType;

  // Sync details
  DateTime? updatedAt;
  int? version;
  bool isSynced = false;
}

enum CustomerType {
  buyer,
  seller
}
