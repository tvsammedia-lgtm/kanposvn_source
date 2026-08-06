import 'package:isar/isar.dart';

part 'job_category.g.dart';

@collection
class ViecJobCategory {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String categoryId = '';
  
  String name = ''; // Giúp việc, Thợ xây...
  String description = '';
  
  String status = 'active'; // active, inactive
}
