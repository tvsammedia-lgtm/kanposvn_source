import 'package:isar/isar.dart';

part 'ticket.g.dart';

@collection
class CrmTicket {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String ticketId = '';

  String customerId = '';
  String customerName = ''; // Lưu tên để tiện query hiển thị
  String subject = '';
  String status = 'open'; // open, in_progress, resolved, closed
  String priority = 'normal'; // low, normal, high, urgent
  
  String assigneeId = ''; // ID nhân viên hỗ trợ
  String assigneeName = '';

  DateTime createdAt = DateTime.now();
  DateTime? resolvedAt;
}

@collection
class CrmTicketMessage {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String messageId = '';
  
  String ticketId = ''; // Liên kết tới CrmTicket
  String senderId = ''; // Khách hàng hoặc Nhân viên
  String senderName = '';
  
  String content = '';
  String attachments = ''; // JSON array of urls
  
  DateTime createdAt = DateTime.now();
}
