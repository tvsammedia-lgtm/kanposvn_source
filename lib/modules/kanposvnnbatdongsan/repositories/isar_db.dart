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
    if (debugOverride != null && debugOverride!.isOpen) return debugOverride!;
    if (_isar != null && _isar!.isOpen) return _isar!;
    // v2: tách hẳn khỏi DB cũ ('kanbatdongsan') vốn thiếu cột enum/status mới
    // và có propertyType tự do (vd 'Đất') gây crash dropdown khi sửa.
    const name = 'kanbatdongsan_v2';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) {
      _isar = existing;
      return _isar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        BdsPropertySchema,
        CustomerSchema,
        TransactionRecordSchema,
        BrokerSchema,
        FloorFeeSchema
      ],
      directory: dir.path,
      name: name,
    );
    return _isar!;
  }
}
