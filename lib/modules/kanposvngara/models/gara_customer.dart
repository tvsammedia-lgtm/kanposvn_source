import 'package:isar/isar.dart';

part 'gara_customer.g.dart';

@collection
class GaraCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';
  String phone = '';
  String address = '';
  double currentDebt = 0.0;
}
