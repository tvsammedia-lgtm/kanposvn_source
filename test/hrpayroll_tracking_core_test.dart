import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/core/tracking/tracking_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  setUpAll(() async {
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    final tempDir =
        await Directory.systemTemp.createTemp('hrpayroll_tracking_core');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  // NOTE: Phải nằm riêng file để không bị lẫn với testWidgets — Isar chạy
  // isolate riêng nên không hoàn thành trong FakeAsync của widget test; nếu
  // chung tiến trình, future real-async bên dưới sẽ chờ một Isar.open bị mắc
  // kẹt trong vùng dead-zone (lỗi lock khiến test chạy chung bị "treo").
  test('Mock GPS sinh điểm + quãng đường tăng cho appCode hrpayroll', () async {
    final controller = TrackingController(appCode: 'kanposvnhrpayroll');
    addTearDown(controller.dispose);

    await controller.init();
    expect(controller.history, isEmpty);

    final id = await controller.startTracking(
      userId: 'test',
      vehicleId: 'Xe 51F-1234',
    );
    expect(id, isNotNull, reason: 'startTracking phải tạo phiên tracking mới');
    expect(controller.isRunning, isTrue);

    final before = controller.currentPointCount;

    // Mock GPS phát điểm mỗi 2 giây → chờ 3 nhịp thật (~6s).
    await Future<void>.delayed(const Duration(seconds: 2));
    await Future<void>.delayed(const Duration(seconds: 2));
    await Future<void>.delayed(const Duration(seconds: 2));

    expect(
      controller.currentPointCount,
      greaterThan(before),
      reason: 'Controller phải nhận điểm GPS mock liên tục',
    );
    expect(
      controller.totalDistanceM,
      greaterThan(0),
      reason: 'Quãng đường phải tăng — map KHÔNG được đứng im',
    );
    expect(controller.speedKmh, greaterThan(0));

    await controller.stopTracking();

    final saved = await controller.store.tracks('kanposvnhrpayroll');
    expect(saved, hasLength(1), reason: 'Phiên tracking phải được lưu lịch sử');
  });
}