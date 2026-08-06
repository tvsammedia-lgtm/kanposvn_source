import 'package:isar/isar.dart';

part 'license.g.dart';

@collection
class CrmLicense {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String licenseId = '';

  String customerId = '';
  String storeId = ''; // Thuộc về cửa hàng nào (có thể null nếu dùng chung)
  String appCode = ''; // e.g. kanposvncafe, kanposvntaphoasmmini

  String licenseKey = '';
  String packageType = 'Standard'; // Trial, Basic, Standard, Professional, Enterprise
  
  DateTime createdAt = DateTime.now();
  DateTime? activatedAt;
  DateTime? expiresAt;
  
  int maxDevices = 1;
  String status = 'active'; // pending, active, expired, suspended
}

@collection
class CrmSubscription {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String subscriptionId = '';
  
  String name = ''; // Basic, Business, Enterprise
  int maxStores = 1;
  int maxUsers = 2;
  double pricePerMonth = 0;
  double pricePerYear = 0;
  
  String features = ''; // JSON array of features
}
