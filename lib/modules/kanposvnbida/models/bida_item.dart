import 'package:isar/isar.dart';

part 'bida_item.g.dart';

enum BidaItemCategory {
  DRINK('Nước uống'),
  FOOD('Đồ ăn'),
  TOBACCO('Thuốc lá'),
  OTHER('Khác');

  final String label;
  const BidaItemCategory(this.label);
}

@collection
class BidaItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String itemId = '';

  String name = '';
  
  @enumerated
  BidaItemCategory category = BidaItemCategory.DRINK;

  double price = 0.0;
  
  // Basic inventory
  int stock = 0;
}
