import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;

  String? storeName;
  String? address;
  String? phone;
  String? logoPath;
  
  // Lãi suất cầm đồ mặc định
  double? defaultDailyInterestRate;
  double? defaultMonthlyInterestRate;
  
  String? printTemplatePawn; // Mẫu in phiếu cầm đồ
  String? printTemplateInvoice; // Mẫu in hóa đơn
  
  DateTime? updatedAt;
}
