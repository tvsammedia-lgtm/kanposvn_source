import 'package:isar/isar.dart';

part 'supplier.g.dart';

@collection
class CongTrinhSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String supplierId = '';
  
  String code = '';
  String name = '';
  String phone = '';
  String address = '';
  String taxCode = '';
  String contactPerson = '';
  
  String notes = '';
}
