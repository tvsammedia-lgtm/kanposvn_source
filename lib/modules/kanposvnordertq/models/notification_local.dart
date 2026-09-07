import 'package:isar/isar.dart';

part 'notification_local.g.dart';

@collection
class NotificationLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String notificationId = '';

  @Index()
  String? userId;

  @Index()
  String? customerId;

  String? type; // ORDER_CONFIRMED, ORDER_IN_TRANSIT, ETA_CHANGED...
  String? title;
  String? body;

  @Index()
  bool isRead = false;

  @Index()
  DateTime? createdAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}