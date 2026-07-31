import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/transaction.dart';
import '../models/broker.dart';

class KanBatDongSanIsarDB {
  static Isar? _isar;

  static Future<Isar> getInstance() async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        propertySchema,
        CustomerSchema,
        TransactionRecordSchema,
        BrokerSchema
      ],
      directory: dir.path,
      name: 'kanbatdongsan',
    );
    return _isar!;
  }
}
