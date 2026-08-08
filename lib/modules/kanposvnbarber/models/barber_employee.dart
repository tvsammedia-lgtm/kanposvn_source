import 'package:isar/isar.dart';

part 'barber_employee.g.dart';

@collection
class BarberEmployee {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String employeeId = '';

  String name = '';
  String? avatar;
  String role = 'Barber'; // Barber, Quản lý, Thu ngân
  String phone = '';
  
  double basicSalary = 0.0;
  double commissionEarned = 0.0;
  double totalRevenue = 0.0;
  int customerCount = 0;
  
  double rating = 5.0; // Đánh giá của khách hàng

  bool isActive = true;

  @Index()
  DateTime createdAt = DateTime.now();
}
