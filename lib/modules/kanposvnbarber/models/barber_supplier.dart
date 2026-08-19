import 'package:isar/isar.dart';

part 'barber_supplier.g.dart';

@collection
class BarberSupplier {
  Id id = Isar.autoIncrement;

  String supplierId = '';
  String name = '';
  String? phone;
  String? email;
  String? address;
  double currentDebt = 0.0;
  double totalPurchase = 0.0;

  DateTime createdAt = DateTime.now();
}
