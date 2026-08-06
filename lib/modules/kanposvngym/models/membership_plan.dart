import 'package:isar/isar.dart';

part 'membership_plan.g.dart';

@collection
class GymPlan {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String planId = '';
  
  String name = ''; // Gói 1 Tháng, Gói 1 Năm...
  String type = 'month'; // day, week, month, year, unlimited
  
  double price = 0;
  int durationDays = 30; // Hạn sử dụng
  int totalSessions = 0; // 0 = unlimited
  int maxCheckInsPerDay = 1;
  
  bool isAutoRenew = false;
  String description = '';
  
  String status = 'active';
}

@collection
class GymMembershipCard {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String cardId = '';
  
  String memberId = '';
  String planId = '';
  
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  
  int sessionsUsed = 0; // Đã tập
  
  String paymentStatus = 'paid'; // unpaid, paid, partial
  String status = 'active'; // active, expired, suspended
}
