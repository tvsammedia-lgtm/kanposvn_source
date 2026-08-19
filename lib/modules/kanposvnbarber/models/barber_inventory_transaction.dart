import 'package:isar/isar.dart';

part 'barber_inventory_transaction.g.dart';

@collection
class BarberInventoryTransaction {
  Id id = Isar.autoIncrement;

  String transactionId = '';
  String type = 'IMPORT'; // IMPORT, EXPORT

  String? productId;
  String? productName;

  int quantity = 0;
  double unitCost = 0.0;
  double totalCost = 0.0;

  String? reason;
  String? supplierName;

  DateTime createdAt = DateTime.now();
}
