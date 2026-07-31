import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/cut_header.dart';
import 'models/cut_detail.dart';
import 'models/thong_so.dart';
import 'models/user.dart';

Isar? _qlcdIsar;

final isarProvider = Provider<Isar>((ref) {
  final isar = _qlcdIsar;
  if (isar != null) return isar;
  throw UnimplementedError('Isar is not initialized yet');
});

class IsarService {
  static Future<Isar> init() async {
    if (_qlcdIsar != null && _qlcdIsar!.isOpen) return _qlcdIsar!;
    if (Isar.instanceNames.contains('qlcd_db')) {
      _qlcdIsar = Isar.getInstance('qlcd_db')!;
      return _qlcdIsar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [CutHeaderSchema, CutDetailSchema, ThongSoSchema, UserSchema],
      directory: dir.path,
      name: 'qlcd_db',
    );
    _qlcdIsar = isar;

    // Create default admin if no users exist
    final userCount = await isar.users.count();
    if (userCount == 0) {
      final admin = User()
        ..username = 'admin'
        ..password = '123456'
        ..role = 'admin';

      await isar.writeTxn(() async {
        await isar.users.put(admin);
      });
    }

    return isar;
  }
}
