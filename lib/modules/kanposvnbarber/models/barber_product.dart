import 'package:isar/isar.dart';

part 'barber_product.g.dart';

@collection
class BarberProduct {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String productId = '';

  String name = '';
  String category = ''; // Wax, Gel, Dầu gội, Lược, v.v.
  String? description;
  
  double purchasePrice = 0.0;
  double sellingPrice = 0.0;
  
  double commissionRate = 0.0; 

  bool isActive = true;

  @Index()
  DateTime createdAt = DateTime.now();
}
