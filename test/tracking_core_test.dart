import 'dart:async';
import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/core/tracking/gps_math.dart';
import 'package:kanposvn/core/tracking/tracking_controller.dart';
import 'package:kanposvn/core/tracking/tracking_location_source.dart';
import 'package:kanposvn/core/tracking/tracking_models.dart';
import 'package:kanposvn/core/tracking/tracking_store.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

/// Nguồn GPS mô phỏng điều khiển được — phát điểm theo lệnh test.
class _ScriptedLocationSource implements TrackingLocationSource {
  final _controller = StreamController<TrackPoint>.broadcast();
  bool enabled = true;
  bool started = false;
  int _count = 0;

  @override
  Stream<TrackPoint> get positionStream => _controller.stream;

  @override
  Future<TrackPoint?> getCurrentLocation() async => null;

  @override
  Future<bool> isLocationEnabled() async => enabled;

  @override
  Future<void> start() async {
    started = true;
  }

  @override
  Future<void> stop() async {
    started = false;
  }

  void emit(double lat, double lng, {double? accuracy, double? speed}) {
    _controller.add(TrackPoint(
      id: 'p${_count++}',
      trackId: '',
      latitude: lat,
      longitude: lng,
      accuracy: accuracy ?? 5,
      speed: speed,
      timestamp: DateTime.now(),
    ));
  }
}

void main() {
  late Directory tempDir;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('tracking_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  tearDownAll(() async {
    try {
      await Isar.getInstance('kanposvn_tracking')?.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('GpsMath — §22/§23/§31', () {
    test('Khoảng cách Haversine HCM-Q1 → Nhà Bè ~2km', () {
      final d = GpsMath.distanceMeters(10.762622, 106.660172, 10.7800, 106.6600);
      expect(d, greaterThan(1500));
      expect(d, lessThan(2500));
    });

    test('Khoảng cách 2 điểm trùng nhau = 0', () {
      expect(GpsMath.distanceMeters(10.0, 106.0, 10.0, 106.0), 0);
    });

    test('Tổng quãng đường = cộng dồn các đoạn', () {
      final points = [
        TrackPoint(id: 'a', trackId: '', latitude: 10.0, longitude: 106.0, timestamp: DateTime.now()),
        TrackPoint(id: 'b', trackId: '', latitude: 10.001, longitude: 106.0, timestamp: DateTime.now()),
        TrackPoint(id: 'c', trackId: '', latitude: 10.002, longitude: 106.0, timestamp: DateTime.now()),
      ];
      final total = GpsMath.totalDistance(points);
      final half = GpsMath.distanceBetween(points[0], points[1]);
      expect(total, closeTo(half * 2, 0.5));
    });

    test('Tốc độ 2 điểm cách ~111m trong 10s = ~40 km/h', () {
      final a = TrackPoint(
          id: 'a', trackId: '', latitude: 10.0, longitude: 106.0,
          timestamp: DateTime(2026, 1, 1, 0, 0, 0));
      final b = TrackPoint(
          id: 'b', trackId: '', latitude: 10.001, longitude: 106.0,
          timestamp: DateTime(2026, 1, 1, 0, 0, 10));
      expect(GpsMath.speedKmh(a, b), closeTo(40.0, 2.0));
    });

    test('Lọc điểm §31: accuracy >50m bị bỏ; lat/lng sai bị bỏ', () {
      final badAcc = TrackPoint(
          id: 'x', trackId: '', latitude: 10.0, longitude: 106.0,
          accuracy: 80, timestamp: DateTime.now());
      expect(GpsMath.isValidPoint(badAcc), isFalse);

      final badLat = TrackPoint(
          id: 'y', trackId: '', latitude: 95.0, longitude: 106.0,
          timestamp: DateTime.now());
      expect(GpsMath.isValidPoint(badLat), isFalse);

      final badSpeed = TrackPoint(
          id: 'w', trackId: '', latitude: 10.0, longitude: 106.0,
          speed: 500, timestamp: DateTime.now());
      expect(GpsMath.isValidPoint(badSpeed), isFalse);

      final good = TrackPoint(
          id: 'z', trackId: '', latitude: 10.0, longitude: 106.0,
          accuracy: 8, timestamp: DateTime.now());
      expect(GpsMath.isValidPoint(good), isTrue);
    });
  });

  group('TrackingStore offline-first — §5/§9', () {
    test('saveTrack/load history + getById', () async {
      final store = TrackingStore.instance;
      final track = Track(
        id: 't1', userId: 'u', vehicleId: 'XE-1',
        startTime: DateTime(2026, 1, 1, 8),
        totalDistance: 1200, durationSeconds: 600,
        status: TrackStatus.completed,
      );
      await store.saveTrack('kanposvntest', track);

      final tracks = await store.tracks('kanposvntest');
      expect(tracks, isNotEmpty);
      final loaded = tracks.firstWhere((t) => t.id == 't1');
      expect(loaded.totalDistance, 1200);
      expect(loaded.status, TrackStatus.completed);

      final byId = await store.trackById('kanposvntest', 't1');
      expect(byId, isNotNull);
    });

    test('savePoints → unsyncedPoints → markPointsSynced', () async {
      final store = TrackingStore.instance;
      final pts = [
        for (var i = 0; i < 5; i++)
          TrackPoint(
            id: 'pt$i', trackId: 't1',
            latitude: 10.0 + i * 0.001, longitude: 106.0,
            timestamp: DateTime(2026, 1, 1, 8, i),
          ),
      ];
      await store.savePoints('kanposvntest', 't1', pts);

      final unsynced = await store.unsyncedPoints('kanposvntest');
      final wait = unsynced.where((p) => p.trackId == 't1').toList();
      expect(wait.length, greaterThanOrEqualTo(5));

      await store.markPointsSynced('kanposvntest', 't1',
          ['pt0', 'pt1', 'pt2', 'pt3', 'pt4']);
      final after = (await store.unsyncedPoints('kanposvntest'))
          .where((p) => p.trackId == 't1')
          .toList();
      expect(after, isEmpty);
    });

    test('deleteTrack xóa luôn các điểm của track', () async {
      final store = TrackingStore.instance;
      await store.deleteTrack('kanposvntest', 't1');
      final tracks = await store.tracks('kanposvntest');
      expect(tracks.where((t) => t.id == 't1'), isEmpty);
      final pts = await store.points('kanposvntest', 't1');
      expect(pts, isEmpty);
    });
  });

  group('TrackingController với mock source — §8', () {
    late _ScriptedLocationSource source;
    late TrackingController controller;

    setUp(() async {
      source = _ScriptedLocationSource();
      controller = TrackingController(appCode: 'kanposvntest2', source: source);
      await controller.init();
    });

    tearDown(() {
      controller.dispose();
    });

    test('startTracking -> track running, isRunning=true', () async {
      final id = await controller.startTracking(vehicleId: 'XE-A');
      expect(id, isNotNull);
      expect(controller.isRunning, isTrue);
      expect(controller.currentTrack!.status, TrackStatus.running);
    });

    test('Nhận điểm GPS hợp lệ -> tích lũy distance + speed + duration',
        () async {
      await controller.startTracking();
      source.emit(10.762622, 106.660172, speed: 30);
      await Future.delayed(const Duration(milliseconds: 1300));
      source.emit(10.762822, 106.660172, speed: 36); // ~22m sau 1.3s
      await Future.delayed(const Duration(milliseconds: 50));

      expect(controller.currentPoints.length, 2);
      expect(controller.totalDistanceM, greaterThan(15));
      expect(controller.speedKmh, greaterThan(20));
      expect(controller.durationSeconds, greaterThanOrEqualTo(0));
      expect(controller.currentTrack!.endTime, isNotNull);
    });

    test('Điểm GPS accuracy tệ bị lọc, không vào currentPoints', () async {
      await controller.startTracking();
      source.emit(10.762622, 106.660172);
      await Future.delayed(const Duration(milliseconds: 50));
      source.emit(10.762822, 106.660172, accuracy: 120); // bị lọc
      await Future.delayed(const Duration(milliseconds: 50));
      expect(controller.currentPoints.length, 1);
    });

    test('stopTracking -> completed + lưu lịch sử + nguồn dừng', () async {
      final id = await controller.startTracking();
      source.emit(10.762622, 106.660172);
      await Future.delayed(const Duration(milliseconds: 50));
      await controller.stopTracking();

      expect(controller.isRunning, isFalse);
      expect(controller.history, isNotEmpty);
      final saved = await controller.store.trackById('kanposvntest2', id!);
      expect(saved!.status, TrackStatus.completed);
      expect(controller.history.first.status, TrackStatus.completed);
      expect(source.started, isFalse);
    });

    test('Pause/Resume giữ nguyên trạng thái', () async {
      await controller.startTracking();
      await controller.pauseTracking();
      expect(controller.currentTrack!.status, TrackStatus.paused);
      expect(controller.isRunning, isFalse);
      await controller.resumeTracking();
      expect(controller.currentTrack!.status, TrackStatus.running);
    });
  });
}