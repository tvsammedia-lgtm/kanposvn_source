import 'package:isar/isar.dart';

part 'shipment_local.g.dart';

@collection
class ShipmentLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String shipmentId = ''; // UUID for sync

  @Index()
  String? orderId;

  @Index()
  String? trackingNumber; // tracking CN

  String? origin;
  String? destination;
  String? carrier;

  @Index()
  String? tripId;

  String? status; // CREATED, ASSIGNED, IN_TRANSIT, ARRIVED, DELIVERED

  DateTime? estimatedDeparture;
  DateTime? actualDeparture;
  DateTime? estimatedArrival;
  DateTime? actualArrival;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}