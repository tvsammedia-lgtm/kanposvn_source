import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/core/router.dart';
import 'package:kanposvn/modules/kanposvnhrpayroll/services/auth_service.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

// NOTE: Flow "mở tracking live → thu GPS → map chạy" được test bằng real async
// ở file riêng `hrpayroll_tracking_core_test.dart` — Isar chạy isolate riêng nên
// không hoàn thành trong FakeAsync của testWidgets.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    final tempDir = await Directory.systemTemp.createTemp('hrpayroll_tracking_nav');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  testWidgets('Đổi tab ngay sau khi mở Tracking', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    SharedPreferences.setMockInitialValues({
      'auth_token': 'test-token',
      'auth_user': '{"id":"x","email":"test@local","name":"Tester"}',
    });
    await AuthService.instance.ensureSessionLoaded();
    expect(AuthService.instance.isLoggedIn, isTrue);

    appRouter.go('/tracking');
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Tracking — HR Payroll'), findsOneWidget);

    final settingsTab = find.descendant(
      of: find.byKey(const ValueKey('hrpayroll_tab_rail')),
      matching: find.text('Cài Đặt'),
    );
    expect(settingsTab, findsOneWidget);

    await tester.tap(settingsTab);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(
      appRouter.routerDelegate.currentConfiguration.uri.path,
      '/settings',
      reason: 'Tap tab Cài Đặt ngay sau khi mở Tracking phải chuyển màn hình',
    );
  });
}