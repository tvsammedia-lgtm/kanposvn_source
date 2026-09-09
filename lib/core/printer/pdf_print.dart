import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

/// In PDF an toàn: thử hộp thoại in hệ thống trước; nếu máy không có dịch vụ
/// in (Android thiếu print service → ActivityNotFoundException) thì dự phòng
/// xuất PDF thành file để chia sẻ/lưu qua ứng dụng khác.
///
/// Dùng chung cho tất cả modules in hóa đơn/chứng từ PDF.
Future<void> printPdfSafely({
  required pw.Document document,
  String name = 'document.pdf',
}) async {
  try {
    await Printing.layoutPdf(
      onLayout: (format) async => document.save(),
      name: name,
    );
  } catch (_) {
    final bytes = await document.save();
    await Printing.sharePdf(bytes: bytes, filename: name);
  }
}