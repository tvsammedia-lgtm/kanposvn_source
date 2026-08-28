import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/transaction.dart';
import '../models/broker.dart';
import '../models/floor_fee.dart';

class KanBatDongSanIsarDB {
  static Isar? _isar;

  /// Cho phép test inject Isar riêng (temp dir) thay vì DB thật.
  static Isar? debugOverride;

  static Future<Isar> getInstance() async {
    debugPrint(
        'BDS-DEBUG: getInstance START override=${debugOverride != null} hasCached=${_isar != null} cachedOpen=${_isar?.isOpen}');
    if (debugOverride != null && debugOverride!.isOpen) {
      debugPrint('BDS-DEBUG: getInstance return debugOverride');
      return debugOverride!;
    }
    if (_isar != null && _isar!.isOpen) {
      debugPrint('BDS-DEBUG: getInstance return cached');
      return _isar!;
    }
    debugPrint('BDS-DEBUG: getInstance caller:\n$StackTrace.current');
    // v2: tách hẳn khỏi DB cũ ('kanbatdongsan') vốn thiếu cột enum/status mới
    // và có propertyType tự do (vd 'Đất') gây crash dropdown khi sửa.
    const name = 'kanbatdongsan_v2';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) {
      _isar = existing;
      debugPrint('BDS-DEBUG: getInstance return registry instance');
      return _isar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    debugPrint('BDS-DEBUG: getInstance about to Isar.open');
    try {
      final opened = _isar = await _open(dir.path, name);
      debugPrint('BDS-DEBUG: getInstance open OK');
      return opened;
    } on IsarError catch (e) {
      // FIX: schema model thay đổi → DB cũ không mở được. Sao lưu DB cũ rồi mở
      // mới thay vì treo màn hình trắng (các module khác đã có fallback này).
      debugPrint('BDS-DEBUG: getInstance IsarError e=$e');
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/$name.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync(
            '${dir.path}/${name}_backup_${DateTime.now().millisecondsSinceEpoch}.isar',
          );
        }
        final reopened = _isar = await _open(dir.path, name);
        debugPrint('BDS-DEBUG: getInstance reopen after backup OK');
        return reopened;
      }
      rethrow;
    }
  }

  static Future<Isar> _open(String dirPath, String name) {
    return Isar.open(
      [
        BdsPropertySchema,
        CustomerSchema,
        TransactionRecordSchema,
        BrokerSchema,
        FloorFeeSchema
      ],
      directory: dirPath,
      name: name,
    );
  }
}
