import 'package:isar/isar.dart';

part 'customer_local.g.dart';

@collection
class CustomerLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String customerId = ''; // UUID for sync

  String? customerCode;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? status;
  double? creditLimit;

  DateTime? createdAt;
  DateTime? updatedAt;
  
  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
