import 'package:isar/isar.dart';

part 'vantai_customer.g.dart';

@collection
class VantaiCustomer {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String customerId = '';
  
  String name = '';
  String phone = '';
  String cccd = '';
  
  double currentDebt = 0.0;
}
