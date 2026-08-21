import 'package:isar/isar.dart';

part 'spa_service_model.g.dart';

enum SpaServiceCategory {
  SKINCARE('Chăm sóc da'),
  WELLNESS('Dưỡng sinh'),
  TREATMENT('Điều trị'),
  NAIL('Nail'),
  TATTOO('Phun xăm'),
  OTHER('Khác');

  final String label;
  const SpaServiceCategory(this.label);
}

@collection
class SpaServiceModel {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String serviceId = '';

  String code = ''; // DV001...
  String name = ''; // e.g., Gội đầu dưỡng sinh

  @enumerated
  SpaServiceCategory category = SpaServiceCategory.WELLNESS;

  int durationMinutes = 60;
  double price = 0.0;
  String roomType = ''; // Phòng Facial, Phòng Body...

  /// Quy trình trị liệu SOP (spec §10), vd: ["Đón khách", "Gội sạch", ...]
  List<String> sopSteps = [];

  /// Định mức tiêu hao (spec §11), dạng "productId|tên|số lượng"
  /// vd: ["p_oil|Dầu massage|10"]
  List<String> consumptions = [];
}
