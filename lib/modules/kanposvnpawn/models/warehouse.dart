import 'package:isar/isar.dart';

part 'warehouse.g.dart';

@collection
class Warehouse {
  Id id = Isar.autoIncrement;

  String? name;
  String? address;
  String? managerName;
  String? phone;
  
  bool isDefault = false;
  
  DateTime? createdAt;
  DateTime? updatedAt;
}
