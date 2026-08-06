import 'package:isar/isar.dart';

part 'customer.g.dart';

@collection
class CrmCustomer {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String customerId = '';

  String companyName = '';
  String representativeName = '';
  String taxCode = ''; // MST
  String identityCard = ''; // CCCD
  String email = '';
  String phone = '';
  String address = '';
  String province = '';
  String district = '';
  String ward = '';
  
  String website = '';
  String facebook = '';
  String zalo = '';
  String note = '';

  DateTime createdAt = DateTime.now();
  String status = 'active'; // active, inactive, expired
}

@collection
class CrmStore {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String storeId = '';
  
  String customerId = ''; // Liên kết tới CrmCustomer.customerId

  String storeName = '';
  String storeCode = '';
  String address = '';
  String gps = '';
  String managerName = '';
  String phone = '';
  String email = '';
  
  DateTime createdAt = DateTime.now();
  String status = 'active';
}
