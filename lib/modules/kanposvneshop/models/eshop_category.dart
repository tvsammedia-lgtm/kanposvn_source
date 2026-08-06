import 'package:isar/isar.dart';

part 'eshop_category.g.dart';

@collection
class KanShopCategory {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String categoryId = '';
  
  String? parentId; // Hỗ trợ danh mục đa cấp
  
  String name = '';
  String iconUrl = '';
  
  int sortOrder = 0;
  
  String status = 'active';
}
