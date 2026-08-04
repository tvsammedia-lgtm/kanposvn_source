import 'package:isar/isar.dart';

part 'gara_supplier.g.dart';

@collection
class GaraSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String name = '';
  String phone = '';
  String address = '';
  double currentDebt = 0.0;
}
