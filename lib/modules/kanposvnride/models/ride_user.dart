import 'package:isar/isar.dart';

part 'ride_user.g.dart';

@collection
class RideUser {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid; 

  String? fullName;
  String? phone;
  String? email;
  String? avatarUrl;
  
  double walletBalance = 0.0;
  int rewardPoints = 0;
  
  String? referralCode;
  
  @enumerated
  UserStatus status = UserStatus.active;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  
  @enumerated
  SyncStatus syncStatus = SyncStatus.synced;
}

enum UserStatus {
  active,
  blocked
}

enum SyncStatus {
  synced,
  pending,
  failed
}
