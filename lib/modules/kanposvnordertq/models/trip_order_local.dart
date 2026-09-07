import 'package:isar/isar.dart';

part 'trip_order_local.g.dart';

@collection
class TripOrderLocal {
  Id id = Isar.autoIncrement;

  @Index()
  String tripId = '';

  @Index()
  String orderId = '';

  DateTime? createdAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}