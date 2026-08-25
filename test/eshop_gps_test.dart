import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_gps_models.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_order.dart';
import 'package:kanposvn/modules/kanposvneshop/services/eshop_business_logic.dart';
import 'package:kanposvn/modules/kanposvneshop/services/eshop_gps_service.dart';
import 'package:kanposvn/modules/kanposvneshop/models/eshop_wallet.dart';
import 'package:kanposvn/modules/kanposvneshop/services/eshop_isar_service.dart';
import 'package:kanposvn/modules/kanposvneshop/services/eshop_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late Isar db;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('eshop_gps_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    db = await EshopIsarService().db;
    await EshopSeedData.seedIfEmpty(db);
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  /// Tạo đơn pending để test giao hàng.
  Future<KanShopOrder> makePendingOrder(String userId) async {
    await EshopBusinessLogic.addToCart(db,
        userId: userId, productId: 'sp_sach_nghigiau', quantity: 1);
    final result =
        await EshopBusinessLogic.checkout(db, userId: userId, paymentMethod: 'COD');
    return result.orders.first;
  }

  group('Vòng đời GPS shipper', () {
    test('Bắt đầu giao: tạo shipment + đơn chuyển shipping + trackingCode',
        () async {
      final order = await makePendingOrder('kh_gps1');
      final s = await EshopGpsService.startDelivery(db,
          orderId: order.orderId,
          carrier: 'self',
          shipperName: 'Shipper Tùng',
          shipperPhone: '0977000111',
          originLat: 10.762, // shop Q1
          originLng: 106.682,
          destLat: 10.800, // Tân Bình
          destLng: 106.650,
          destAddress: 'Tân Bình, TP.HCM');

      expect(s.status, 'delivering');
      expect(s.totalDistanceKm, greaterThan(3)); // Q1 -> Tân Bình ~5km

      final o = await db.kanShopOrders
          .filter()
          .orderIdEqualTo(order.orderId)
          .findFirst();
      expect(o!.status, 'shipping');
      expect(o.trackingCode, s.shipmentId);
      expect(o.carrier, 'self');
    });

    test('Chưa có ping -> vị trí = điểm xuất phát; ETA dương', () async {
      final shipments =
          await db.eshopShipments.filter().statusEqualTo('delivering').findAll();
      final s = shipments.first;
      final pos = await EshopGpsService.latestPosition(db, s.shipmentId);
      expect(pos!.lat, s.originLat);
      final eta = await EshopGpsService.etaMinutes(db, s.shipmentId);
      expect(eta, greaterThan(0));
    });

    test('Push ping theo lộ trình: khoảng cách còn lại giảm dần, tiến độ tăng',
        () async {
      final s = (await db.eshopShipments
              .filter()
              .statusEqualTo('delivering')
              .findFirst())!;

      // Mô phỏng shipper đi thẳng từ origin tới dest theo 4 bước.
      final steps = [
        [10.770, 106.676],
        [10.780, 106.668],
        [10.790, 106.658],
        [s.destLat, s.destLng],
      ];
      double? prevRemaining;
      for (final step in steps) {
        await EshopGpsService.pushPing(db, s.shipmentId, step[0], step[1],
            speedKmh: 24);
        final remaining = await EshopGpsService.distanceRemainingKm(db, s.shipmentId);
        if (prevRemaining != null) {
          expect(remaining, lessThan(prevRemaining));
        }
        prevRemaining = remaining;
      }
      expect(prevRemaining!, closeTo(0, 0.5));

      final progress = await EshopGpsService.progressPercent(db, s.shipmentId);
      expect(progress, closeTo(100, 5));

      // Replay đủ số mốc đúng thứ tự thời gian.
      final route = await EshopGpsService.replayRoute(db, s.shipmentId);
      expect(route.length, 4);
      for (int i = 1; i < route.length; i++) {
        expect(
            route[i].recordedAt.isAfter(route[i - 1].recordedAt) ||
                route[i].recordedAt == route[i - 1].recordedAt,
            isTrue);
      }

      // Ping vào chuyến đã delivered thì bỏ qua.
    });

    test('markDelivered -> shipment delivered + đơn completed + ví shop cộng tiền',
        () async {
      final s =
          (await db.eshopShipments.filter().statusEqualTo('delivering').findFirst())!;
      final order = (await db.kanShopOrders
              .filter()
              .orderIdEqualTo(s.orderId)
              .findFirst())!;

      final walletBefore = await db.kanShopWallets
          .filter()
          .ownerIdEqualTo(order.shopId)
          .ownerTypeEqualTo('shop')
          .findFirst();

      await EshopGpsService.markDelivered(db, s.shipmentId);

      final sAfter =
          (await db.eshopShipments.filter().shipmentIdEqualTo(s.shipmentId).findFirst())!;
      expect(sAfter.status, 'delivered');
      expect(sAfter.deliveredAt, isNotNull);

      final oAfter = await db.kanShopOrders
          .filter()
          .orderIdEqualTo(s.orderId)
          .findFirst();
      expect(oAfter!.status, 'completed');

      final walletAfter = await db.kanShopWallets
          .filter()
          .ownerIdEqualTo(order.shopId)
          .ownerTypeEqualTo('shop')
          .findFirst();
      final expectedNet =
          order.subTotal - order.discount - order.platformFee +
              (walletBefore?.balance ?? 0);
      expect(walletAfter!.balance, closeTo(expectedNet, 0.01));

      // Ping sau delivered bị bỏ qua (không tăng số ping).
      final countBefore = await db.eshopGpsPings.count();
      await EshopGpsService.pushPing(db, s.shipmentId, 10.9, 106.6);
      expect(await db.eshopGpsPings.count(), countBefore);
    });

    test('markFailed giữ đơn ở shipping để giao lại', () async {
      final order = await makePendingOrder('kh_gps2');
      final s = await EshopGpsService.startDelivery(db,
          orderId: order.orderId,
          carrier: 'GHTK',
          shipperName: 'Shipper Huy',
          shipperPhone: '0977000222',
          originLat: 10.762,
          originLng: 106.682,
          destLat: 10.795,
          destLng: 106.660);
      await EshopGpsService.markFailed(db, s.shipmentId, 'Khách không nghe máy');

      final after =
          (await db.eshopShipments.filter().shipmentIdEqualTo(s.shipmentId).findFirst())!;
      expect(after.status, 'failed');
      final o = await db.kanShopOrders
          .filter()
          .orderIdEqualTo(order.orderId)
          .findFirst();
      expect(o!.status, 'shipping'); // vẫn đang giao, chờ tạo lượt mới
    });
  });

  group('§36 Offline sync GPS', () {
    test('Ping mới luôn pending; chưa cấu hình server flush là no-op an toàn',
        () async {
      final pending = await db.eshopGpsPings.filter().isSyncedEqualTo(false).count();
          db.eshopGpsPings.filter().isSyncedEqualTo(false).count();
      expect(pending, greaterThan(0));

      final result = await EshopGpsService.flushToServer(db);
      expect(result.success, isFalse);
      expect(result.error, 'no_server_config');
      // Không mất dữ liệu khi offline (§43 nguyên tắc).
      expect(EshopGpsService.pendingPingCount(db), greaterThan(0));
    });

    test('Payload upload đúng cấu trúc cho server (chuẩn hóa API key + points)',
        () async {
      final pendings = await db.eshopGpsPings
          .filter()
          .isSyncedEqualTo(false)
          .findAll();
      final payload = EshopGpsService.buildUploadPayload(pendings.take(2).toList(),
          apiKey: 'TEST_KEY');
      expect(payload['apiKey'], 'TEST_KEY');
      expect((payload['points'] as List).length, lessThanOrEqualTo(2));
      final point = (payload['points'] as List).first as Map;
      expect(point.keys,
          containsAll(['pingId', 'shipmentId', 'lat', 'lng', 'recordedAt']));
    });

    test('Cấu hình server lưu được URL + key (chờ khách cung cấp API)', () async {
      await EshopGpsService.configureServer(db,
          apiBaseUrl: 'https://gps.kanposvn.vercel.app/',
          apiKey: 'LIVE-KEY-001');
      final cfg = await EshopGpsService.serverConfig(db);
      expect(cfg.url, 'https://gps.kanposvn.vercel.app'); // đã cắt dấu /
      expect(cfg.key, 'LIVE-KEY-001');
      // Reset về rỗng để môi trường test không vô tình gọi mạng.
      await EshopGpsService.configureServer(db, apiBaseUrl: '', apiKey: '');
      final off = await EshopGpsService.serverConfig(db);
      expect(off.url, anyOf(isNull, ''));
    });
  });
}
