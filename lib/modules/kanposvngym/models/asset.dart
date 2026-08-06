import 'package:isar/isar.dart';

part 'asset.g.dart';

@collection
class GymAsset {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String assetId = '';
  
  String name = ''; // Máy chạy bộ, xe đạp...
  
  double purchasePrice = 0;
  DateTime purchaseDate = DateTime.now();
  
  int depreciationMonths = 12; // Khấu hao bao nhiêu tháng
  
  String status = 'active'; // active, maintenance, broken
}
