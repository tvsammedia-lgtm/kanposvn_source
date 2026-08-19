import 'package:isar/isar.dart';

part 'supplier.g.dart';

@collection
class Supplier {
  Id id = Isar.autoIncrement;

  String? supplierCode;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? taxCode;

  double? currentDebt;
  double? totalPurchase;

  DateTime? createdAt;
  DateTime? updatedAt;
}
