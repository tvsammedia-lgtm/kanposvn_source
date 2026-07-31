import 'package:isar/isar.dart';
import 'hotel_checkin_checkout.dart';

part 'hotel_service.g.dart';

@collection
class HotelServiceItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String itemId = ''; // UUID for sync

  String itemName = '';
  double price = 0;
  String category = ''; // Đồ uống, Đồ ăn, Giặt ủi...
  bool isInventoryTracked = false;
}

@collection
class RoomServiceOrderItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String orderItemId = '';

  final checkIn = IsarLink<RoomCheckIn>();
  final serviceItem = IsarLink<HotelServiceItem>();

  int quantity = 1;
  double unitPrice = 0;
  double totalPrice = 0;
  
  DateTime orderTime = DateTime.now();
  bool isPaid = false;
}
