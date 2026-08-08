import 'package:isar/isar.dart';

part 'barber_service.g.dart';

@collection
class BarberService {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String serviceId = '';

  String name = ''; // Cắt tóc, Gội đầu, Nhuộm, v.v.
  String? description;
  
  double price = 0.0;
  int durationMinutes = 30; // Thời gian thực hiện (phút)
  double commissionRate = 0.0; // Hoa hồng cho thợ (%) hoặc số tiền cố định
  bool isFixedCommission = false;

  bool isActive = true;

  @Index()
  DateTime createdAt = DateTime.now();
}
