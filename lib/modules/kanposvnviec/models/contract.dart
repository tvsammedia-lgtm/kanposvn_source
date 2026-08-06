import 'package:isar/isar.dart';

part 'contract.g.dart';

@collection
class ViecContract {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String contractId = '';
  
  String matchId = ''; // Liên kết kết quả ghép việc
  
  DateTime startDate = DateTime.now();
  DateTime? endDate;
  
  double agreedSalary = 0;
  String terms = ''; // Điều khoản
  
  String status = 'active'; // active, completed, cancelled
  
  DateTime createdAt = DateTime.now();
}
