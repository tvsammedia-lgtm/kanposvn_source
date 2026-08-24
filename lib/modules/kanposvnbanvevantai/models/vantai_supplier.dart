import 'package:isar/isar.dart';

part 'vantai_supplier.g.dart';

/// PRD mục 17: Nhà cung cấp — Gara, Xăng dầu, Lốp xe, Phụ tùng, Bảo hiểm.
@collection
class VantaiSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String name = '';
  String phone = '';
  String address = '';
  String category = ''; // Gara / Xăng dầu / Lốp xe / Phụ tùng / Bảo hiểm

  double debt = 0; // Công nợ phải trả
}
