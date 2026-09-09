import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

/// Tải font chữ tiếng Việt mặc định cho PDF (Roboto) — ưu tiên font
/// đóng gói sẵn trong assets để không phụ thuộc mạng (Android offline),
/// fallback về Google Fonts rồi Helvetica.
///
/// Trả về cặp font (regular, bold) dùng chung cho tất cả modules.
Future<(pw.Font, pw.Font)> loadVietnamesePdfFonts() async {
  pw.Font? font;
  pw.Font? fontBold;

  for (final (assetPath, bold) in [
    ('assets/fonts/Roboto-Regular.ttf', false),
    ('assets/fonts/Roboto-Bold.ttf', true),
  ]) {
    try {
      final data = await rootBundle.load(assetPath);
      final fontFromAsset = pw.Font.ttf(data);
      if (bold) {
        fontBold = fontFromAsset;
      } else {
        font = fontFromAsset;
      }
    } catch (_) {
      try {
        final googleFont = bold
            ? await PdfGoogleFonts.robotoBold()
            : await PdfGoogleFonts.robotoRegular();
        if (bold) {
          fontBold = googleFont;
        } else {
          font = googleFont;
        }
      } catch (_) {}
    }
  }

  return (
    font ?? pw.Font.helvetica(),
    fontBold ?? pw.Font.helveticaBold(),
  );
}

/// Trả về theme PDF dùng chung cho tất cả modules in hóa đơn/báo cáo.
Future<pw.ThemeData> buildVietnamesePdfTheme() async {
  final (font, fontBold) = await loadVietnamesePdfFonts();
  return pw.ThemeData.withFont(base: font, bold: fontBold);
}