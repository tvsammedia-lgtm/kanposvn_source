import 'package:isar/isar.dart';

part 'eshop_gps_models.g.dart';

/// §Theo dõi GPS: lượt giao hàng gắn với đơn.
@collection
class EshopShipment {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String shipmentId = '';

  @Index()
  String orderId = '';

  String carrier = ''; // GHN | GHTK | ViettelPost | JandT | NinjaVan | self

  String shipperName = '';
  String shipperPhone = '';

  /// Điểm xuất phát (kho/shop) và đích (địa chỉ khách).
  double originLat = 0;
  double originLng = 0;
  double destLat = 0;
  double destLng = 0;
  String destAddress = '';

  /// assigned | picked_up | delivering | delivered | failed
  String status = 'delivering';

  DateTime startedAt = DateTime.now();
  DateTime? deliveredAt;

  /// Khoảng cách tổng lúc bắt đầu (km) — dùng tính % hoàn thành.
  double totalDistanceKm = 0;

  DateTime createdAt = DateTime.now();
}

/// §11+§36. Cache tọa độ GPS của shipper (offline queue khi mất mạng).
@collection
class EshopGpsPing {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false; // false = chờ đẩy lên server

  @Index(unique: true, replace: true)
  String pingId = '';

  @Index()
  String shipmentId = '';

  double lat = 0;
  double lng = 0;

  double speedKmh = 0;
  double accuracyMeters = 0;

  @Index()
  DateTime recordedAt = DateTime.now();
}
