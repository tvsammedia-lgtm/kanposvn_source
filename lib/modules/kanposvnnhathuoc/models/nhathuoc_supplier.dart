import 'package:isar/isar.dart';

part 'nhathuoc_supplier.g.dart';

@collection
class NhathuocSupplier {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String name = '';
  String phone = '';
  String taxCode = '';
  
  double currentDebt = 0.0;
}
