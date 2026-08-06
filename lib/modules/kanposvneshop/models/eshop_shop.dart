import 'package:isar/isar.dart';

part 'eshop_shop.g.dart';

@collection
class KanShopStore {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String shopId = '';
  
  String ownerId = '';
  String name = '';
  String logoUrl = '';
  String bannerUrl = '';
  
  String description = '';
  
  double rating = 5.0;
  int followersCount = 0;
  
  String status = 'active'; // active, suspended, closed
  
  DateTime createdAt = DateTime.now();
}
