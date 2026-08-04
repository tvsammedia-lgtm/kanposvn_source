import 'package:isar/isar.dart';

part 'hotel_customer_supplier.g.dart';

@collection
class HotelCustomer {
  Id id = Isar.autoIncrement;
  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = ''; // UUID for sync

  String fullName = '';
  String phoneNumber = '';
  String identityNumber = ''; // CMND/CCCD/Passport
  String address = '';
  
  int totalVisits = 0;
  double totalSpent = 0;
  
  DateTime createdAt = DateTime.now();
}

@collection
class HotelSupplier {
  Id id = Isar.autoIncrement;
  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String supplierName = '';
  String contactPerson = '';
  String phoneNumber = '';
  String address = '';
  String note = '';
  
  DateTime createdAt = DateTime.now();
}
