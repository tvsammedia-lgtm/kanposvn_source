import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/transaction.dart';
import '../models/broker.dart';

class KanBatDongSanIsarDB {
  static Isar? _isar;

  static Future<Isar> getInstance() async {
    if (_isar != null && _isar!.isOpen) return _isar!;
    const name = 'kanbatdongsan';
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
        BrokerSchema
      ],
      directory: dir.path,
      name: name,
    );
    return _isar!;
  }
}
