import 'package:isar/isar.dart';

part 'barber_customer.g.dart';

@collection
class BarberCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';
  String? avatar;
  String? gender;
  DateTime? dob;
  String phone = '';
  String? email;
  String? facebook;
  String? zalo;
  String? address;
  String? notes;

  // Lịch sử
  DateTime? lastVisit;
  List<String> previousHairStyles = [];
  List<String> previousHairColors = [];
  List<String> usedServices = [];
  double totalSpent = 0.0;
  int rewardPoints = 0;

  // Ảnh trước và sau
  List<String> beforeImages = [];
  List<String> afterImages = [];

  @Index()
  DateTime createdAt = DateTime.now();
}
