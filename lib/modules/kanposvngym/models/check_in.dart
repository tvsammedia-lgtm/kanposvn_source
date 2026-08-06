import 'package:isar/isar.dart';

part 'check_in.g.dart';

@collection
class GymCheckIn {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  
  @Index(unique: true, replace: true)
  String checkInId = '';
  
  String memberId = '';
  String cardId = ''; // Vé sử dụng
  
  String method = 'qr_code'; // qr_code, barcode, nfc, face, manual
  
  DateTime checkInTime = DateTime.now();
  DateTime? checkOutTime; // Nếu có check-out
  
  String note = '';
}
