import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnairbook/providers/airbook_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnairbook/screens/kanposvnairbook_shell.dart';
import 'package:kanposvn/modules/kanposvnairbook/services/airbook_seed_data.dart';
import 'package:kanposvn/modules/kanposvnride/providers/ride_isar_provider.dart';
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

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('airbook_repro');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    await RideDatabaseSetup.init();
    final db = await AirbookDatabaseSetup.init();
    await AirBookSeedData.seedIfEmpty(db);
  });

  tearDownAll(() async {
    try {
      await Isar.getInstance('kanposvnride_db')?.close();
    } catch (_) {}
    try {
      await Isar.getInstance('kanposvnairbook_db')?.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  testWidgets('Shell -> tab "Hoa hồng" -> CommissionReportScreen không treo',
      (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(ProviderScope(
        child: const MaterialApp(home: KanPosVnAirbookShell()),
      ));

      var ready = false;
      for (var i = 0; i < 20; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
        await tester.pump();
        if (find.text('Hoa hồng').evaluate().isNotEmpty) {
          ready = true;
          break;
        }
      }
      debugPrint('=== SHELL READY: $ready ===');
      expect(ready, isTrue, reason: 'Shell không lên sau khi init DB xong');

      await tester.tap(find.text('Hoa hồng'));
      var reportVisible = false;
      for (var i = 0; i < 30; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
        await tester.pump();
        if (find.text('Tổng doanh số').evaluate().isNotEmpty) {
          reportVisible = true;
          break;
        }
      }
      debugPrint('=== REPORT VISIBLE: $reportVisible ===');
      for (final w in tester.allWidgets) {
        if (w is Text && w.data != null) debugPrint('REPORT TEXT: ${w.data}');
      }
      expect(reportVisible, isTrue,
          reason: 'CommissionReportScreen không hiện sau khi bấm "Hoa hồng"');
    });
  });
}