import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:isar/isar.dart';

import '../models/eshop_gps_models.dart';
import '../models/eshop_order.dart';
import '../models/eshop_sync.dart';
import 'eshop_business_logic.dart';

/// Vị trí hiện tại của shipper trên hành trình giao.
class EshipperPosition {
  final double lat;
  final double lng;
  final DateTime recordedAt;
  final double speedKmh;

  EshipperPosition(
      {required this.lat, required this.lng, required this.recordedAt, this.speedKmh = 0});
}

/// Kết quả đẩy batch lên server.
class GpsUploadResult {
  final bool success;
  final int uploaded;
  final int failed;
  final String? error;

  GpsUploadResult(
      {required this.success, required this.uploaded, required this.failed, this.error});
}

/// ══════════════════════════════════════════════════════════════
/// Bản đồ GPS Shipper — KanShop
///
/// Hoạt động OFFLINE hoàn toàn: mọi tọa độ lưu cache Isar (EshopGpsPing,
/// isSynced=false). Khi có server (Vercel/Neon), chỉ cần cấu hình:
///
///   await EshopGpsService.configureServer(db,
///       apiBaseUrl: 'https://your-app.vercel.app',
///       apiKey: 'YOUR_KEY');
///   await EshopGpsService.flushToServer(db);
///
/// Payload đẩy lên: POST {apiBaseUrl}/api/gps/upload
///   { "apiKey": "...", "points": [ {shipmentId,lat,lng,speedKmh,recordedAt} ] }
/// Server chỉ cần trả 200 OK. Không cấu hình -> flush bỏ qua an toàn.
/// ══════════════════════════════════════════════════════════════
class EshopGpsService {
  /// Tốc độ trung bình xe máy nội đô dùng ước lượng ETA.
  static const double defaultAvgSpeedKmh = 25;

  // ── Cấu hình server (dùng lại SyncConfig sẵn có của module) ──

  static Future<void> configureServer(Isar db,
      {required String apiBaseUrl, required String apiKey}) async {
    await db.writeTxn(() async {
      var cfg = await db.kanShopSyncConfigs
          .filter()
          .configIdEqualTo('gps')
          .findFirst();
      cfg ??= KanShopSyncConfig()..configId = 'gps';
      cfg.vercelApiUrl = apiBaseUrl.endsWith('/')
          ? apiBaseUrl.substring(0, apiBaseUrl.length - 1)
          : apiBaseUrl;
      cfg.apiKey = apiKey;
      await db.kanShopSyncConfigs.put(cfg);
    });
  }

  static Future<({String? url, String? key})> serverConfig(Isar db) async {
    final cfg =
        await db.kanShopSyncConfigs.filter().configIdEqualTo('gps').findFirst();
    return (url: cfg?.vercelApiUrl, key: cfg?.apiKey);
  }

  // ── Vòng đời lượt giao ──

  /// Bắt đầu giao: gắn shipper vào đơn (§Vận chuyển + §GPS).
  static Future<EshopShipment> startDelivery(
    Isar db, {
    required String orderId,
    required String carrier,
    required String shipperName,
    required String shipperPhone,
    required double originLat,
    required double originLng,
    required double destLat,
    required double destLng,
    String destAddress = '',
  }) async {
    final order =
        await db.kanShopOrders.filter().orderIdEqualTo(orderId).findFirst();
    if (order == null) throw Exception('Không tìm thấy đơn $orderId');
    if (order.status == 'completed') throw Exception('Đơn đã giao xong.');
    if (order.status == 'cancelled') throw Exception('Đơn đã hủy.');

    late EshopShipment s;
    await db.writeTxn(() async {
      s = EshopShipment()
        ..shipmentId = 'shp_${DateTime.now().millisecondsSinceEpoch}_$orderId'
        ..orderId = orderId
        ..carrier = carrier
        ..shipperName = shipperName
        ..shipperPhone = shipperPhone
        ..originLat = originLat
        ..originLng = originLng
        ..destLat = destLat
        ..destLng = destLng
        ..destAddress = destAddress.isNotEmpty ? destAddress : order.shopId
        ..totalDistanceKm = _haversineKm(originLat, originLng, destLat, destLng)
        ..status = 'delivering'
        ..startedAt = DateTime.now();
      await db.eshopShipments.put(s);

      // Đơn chuyển sang đang giao + lưu mã vận đơn nếu chưa có.
      if (order.status == 'pending' || order.status == 'confirmed') {
        order.status = 'shipping';
        if (order.trackingCode.isEmpty) {
          order.trackingCode = s.shipmentId;
        }
        if (carrier.isNotEmpty) order.carrier = carrier;
        await db.kanShopOrders.put(order);
      }
    });
    return s;
  }

  /// Shipper đẩy tọa độ mới (mỗi 5-30 giây từ nền app).
  static Future<void> pushPing(Isar db, String shipmentId, double lat,
      double lng, {double speedKmh = 0, double accuracyMeters = 0}) async {
    final s = await db.eshopShipments
        .filter()
        .shipmentIdEqualTo(shipmentId)
        .findFirst();
    if (s == null) throw Exception('Không tìm thấy lượt giao $shipmentId');
    if (s.status == 'delivered') return; // hết chuyến không ghi nữa

    await db.writeTxn(() async {
      await db.eshopGpsPings.put(EshopGpsPing()
        ..pingId =
            'ping_${s.shipmentId}_${DateTime.now().millisecondsSinceEpoch}'
        ..shipmentId = shipmentId
        ..lat = lat
        ..lng = lng
        ..speedKmh = speedKmh
        ..accuracyMeters = accuracyMeters
        ..recordedAt = DateTime.now()
        ..isSynced = false); // §36 cache chờ sync
    });
  }

  /// Vị trí mới nhất để vẽ marker trên bản đồ.
  static Future<EshipperPosition?> latestPosition(
      Isar db, String shipmentId) async {
    final pings = await db.eshopGpsPings
        .filter()
        .shipmentIdEqualTo(shipmentId)
        .sortByRecordedAtDesc()
        .limit(1)
        .findAll();
    if (pings.isEmpty) {
      // Chưa có ping -> trả vị trí xuất phát.
      final s = await db.eshopShipments
          .filter()
          .shipmentIdEqualTo(shipmentId)
          .findFirst();
      if (s == null) return null;
      return EshipperPosition(
          lat: s.originLat,
          lng: s.originLng,
          recordedAt: s.startedAt);
    }
    final p = pings.first;
    return EshipperPosition(
        lat: p.lat, lng: p.lng, recordedAt: p.recordedAt, speedKmh: p.speedKmh);
  }

  /// §11. Replay toàn bộ lộ trình đã đi (theo thứ tự thời gian).
  static Future<List<EshipperPosition>> replayRoute(
      Isar db, String shipmentId) async {
    final pings = await db.eshopGpsPings
        .filter()
        .shipmentIdEqualTo(shipmentId)
        .sortByRecordedAt()
        .findAll();
    return pings
        .map((p) => EshipperPosition(
            lat: p.lat,
            lng: p.lng,
            recordedAt: p.recordedAt,
            speedKmh: p.speedKmh))
        .toList();
  }

  /// Khoảng cách còn lại tới địa chỉ khách (km).
  static Future<double> distanceRemainingKm(Isar db, String shipmentId) async {
    final s = await db.eshopShipments
        .filter()
        .shipmentIdEqualTo(shipmentId)
        .findFirst();
    if (s == null) return 0;
    final pos = await latestPosition(db, shipmentId);
    if (pos == null) return s.totalDistanceKm;
    if (s.status == 'delivered') return 0;
    return _haversineKm(pos.lat, pos.lng, s.destLat, s.destLng);
  }

  /// % tiến độ theo khoảng cách đã rút ngắn so với lúc bắt đầu.
  static Future<double> progressPercent(Isar db, String shipmentId) async {
    final s = await db.eshopShipments
        .filter()
        .shipmentIdEqualTo(shipmentId)
        .findFirst();
    if (s == null || s.totalDistanceKm <= 0) return 0;
    final remaining = await distanceRemainingKm(db, shipmentId);
    return ((1 - remaining / s.totalDistanceKm) * 100).clamp(0.0, 100.0);
  }

  /// ETA phút = quãng đường còn lại / tốc độ TB.
  static Future<int> etaMinutes(Isar db, String shipmentId,
      {double avgSpeedKmh = defaultAvgSpeedKmh}) async {
    final remaining = await distanceRemainingKm(db, shipmentId);
    if (remaining <= 0) return 0;
    return (remaining / avgSpeedKmh * 60).ceil();
  }

  /// Giao thành công -> shipment delivered + đơn completed (kích hoạt cộng ví shop).
  static Future<void> markDelivered(Isar db, String shipmentId) async {
    final s = await db.eshopShipments
        .filter()
        .shipmentIdEqualTo(shipmentId)
        .findFirst();
    if (s == null) throw Exception('Không tìm thấy lượt giao.');
    await db.writeTxn(() async {
      s.status = 'delivered';
      s.deliveredAt = DateTime.now();
      await db.eshopShipments.put(s);
    });
    // Đơn chuyển completed -> business logic cộng tiền vào ví shop.
    await EshopBusinessLogic.advanceOrderStatus(db, s.orderId);
  }

  /// Giao thất bại (khách không nhận...) — giữ đơn ở shipping để giao lại.
  static Future<void> markFailed(Isar db, String shipmentId, String reason) async {
    final s = await db.eshopShipments
        .filter()
        .shipmentIdEqualTo(shipmentId)
        .findFirst();
    if (s == null) throw Exception('Không tìm thấy lượt giao.');
    await db.writeTxn(() async {
      s.status = 'failed';
      s.deliveredAt = null;
      await db.eshopShipments.put(s);
    });
  }

  // ══════════════ SYNC LÊN SERVER (bật khi có API) ══════════════

  static int pendingPingCount(Isar db) => db.eshopGpsPings
      .filter()
      .isSyncedEqualTo(false)
      .countSync();

  /// Đóng gói payload upload (tách riêng để test được không cần mạng).
  static Map<String, dynamic> buildUploadPayload(List<EshopGpsPing> pings,
      {required String apiKey}) {
    return {
      'apiKey': apiKey,
      'points': [
        for (final p in pings)
          {
            'pingId': p.pingId,
            'shipmentId': p.shipmentId,
            'lat': p.lat,
            'lng': p.lng,
            'speedKmh': p.speedKmh,
            'accuracyMeters': p.accuracyMeters,
            'recordedAt': p.recordedAt.toIso8601String(),
          }
      ],
    };
  }

  /// Đẩy toàn bộ ping chưa sync lên server. Chưa cấu hình server -> no-op.
  /// Dùng dart:io HttpClient — không cần thêm package.
  static Future<GpsUploadResult> flushToServer(Isar db,
      {Duration timeout = const Duration(seconds: 15)}) async {
    final cfg = await serverConfig(db);
    final url = cfg.url;
    final key = cfg.key;
    if (url == null || url.isEmpty || key == null || key.isEmpty) {
      return GpsUploadResult(success: false, uploaded: 0, failed: 0, error: 'no_server_config');
    }

    final pendings = await db.eshopGpsPings
        .filter()
        .isSyncedEqualTo(false)
        .sortByRecordedAt()
        .findAll();
    if (pendings.isEmpty) {
      return GpsUploadResult(success: true, uploaded: 0, failed: 0);
    }

    // Batch tối đa 500 điểm/lần.
    const batchSize = 500;
    var uploaded = 0;
    var failed = 0;
    String? lastError;

    for (var i = 0; i < pendings.length; i += batchSize) {
      final batch = pendings.sublist(
          i, min(i + batchSize, pendings.length));
      try {
        final ok = await _postBatch(url, key, batch, timeout);
        if (ok) {
          uploaded += batch.length;
          await db.writeTxn(() async {
            for (final p in batch) {
              p.isSynced = true;
              await db.eshopGpsPings.put(p);
            }
          });
        } else {
          failed += batch.length;
          lastError = 'HTTP error';
        }
      } catch (e) {
        failed += batch.length;
        lastError = e.toString();
        break; // lỗi mạng -> dừng, giữ pending cho lần sau (Retry Queue §10)
      }
    }
    return GpsUploadResult(
        success: failed == 0, uploaded: uploaded, failed: failed, error: lastError);
  }

  static Future<bool> _postBatch(
      String base, String apiKey, List<EshopGpsPing> batch, Duration timeout) async {
    final client = HttpClient()..connectionTimeout = timeout;
    try {
      final req = await client
          .openUrl('POST', Uri.parse('$base/api/gps/upload'))
          .timeout(timeout);
      req.headers.set('Content-Type', 'application/json');
      req.headers.set('X-API-Key', apiKey);
      req.add(utf8.encode(jsonEncode(buildUploadPayload(batch, apiKey: apiKey))));
      final res = await req.close().timeout(timeout);
      await res.drain<void>();
      return res.statusCode >= 200 && res.statusCode < 300;
    } finally {
      client.close(force: true);
    }
  }

  static double _haversineKm(lat1, lng1, lat2, lng2) {
    const r = 6371.0;
    final dLat = (lat2 - lat1) * pi / 180;
    final dLng = (lng2 - lng1) * pi / 180;
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLng / 2) *
            sin(dLng / 2);
    return r * 2 * atan2(sqrt(a), sqrt(1 - a));
  }
}
