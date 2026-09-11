import 'package:isar/isar.dart';

part 'giapha_subscription.g.dart';

@collection
class GiaphaSubscription {
  Id id = Isar.autoIncrement;

  @Index()
  String? serverId;
  
  @Index()
  String? familyId;
  
  String? packageCode; // FREE, STANDARD, PRO
  String? status; // TRIAL, ACTIVE, EXPIRED, SUSPENDED, READ_ONLY
  
  DateTime? startDate;
  DateTime? expireDate;
  
  int? maxPersons;
  int? maxUsers;
  int? maxStorageBytes;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  String? syncStatus;
  int? version;
  bool? isDeleted;
}
