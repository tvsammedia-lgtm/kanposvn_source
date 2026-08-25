import 'package:pdf/widgets.dart' as pw;
import '../auth/auth_service.dart';

/// Tạo dòng tiêu đề chủ tài khoản: "Owner Name - SĐT/Email"
/// Dùng cho tất cả PDF reports / phiếu lương / hóa đơn trong kanposvn.
///
/// Trả về `null` nếu không có thông tin owner.
Future<String?> buildOwnerHeaderLine() async {
  final auth = AuthService.instance;
  final name = auth?.displayName;
  if (name == null || name.isEmpty || name == 'Tài khoản') return null;

  // Ưu tiên SĐT → Email
  String? contact;
  if (auth != null) {
    contact = auth.user?['phone']?.toString();
    if (contact == null || contact.isEmpty) {
      contact = auth.user?['email']?.toString();
    }
  }
  // Fallback: static helpers
  contact ??= await AuthService.loadSavedStorePhone();
  if (contact == null || contact.isEmpty) return null;

  return '$name - $contact';
}

/// Widget dòng owner header cho PDF 80mm (roll).
/// Font size nhỏ, center, dùng cho hóa đơn / phiếu chi.
Future<pw.Widget?> buildOwnerHeaderWidget80() async {
  final line = await buildOwnerHeaderLine();
  if (line == null) return null;
  return pw.Center(
    child: pw.Text(
      line,
      textAlign: pw.TextAlign.center,
      style: pw.TextStyle(fontSize: 8),
    ),
  );
}

/// Widget dòng owner header cho PDF A4.
/// Dùng cho phiếu lương, báo cáo tổng hợp.
Future<pw.Widget?> buildOwnerHeaderWidgetA4() async {
  final line = await buildOwnerHeaderLine();
  if (line == null) return null;
  return pw.Center(
    child: pw.Text(
      line,
      textAlign: pw.TextAlign.center,
      style: pw.TextStyle(fontSize: 10),
    ),
  );
}
