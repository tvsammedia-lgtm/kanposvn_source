import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'package:qr/qr.dart';
import '../models/isar_models.dart';

class PdfGeneratorService {
  static Future<void> printBill(OrderModel order) async {
    final font = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();

    final pdf = pw.Document();
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final dateTime = DateFormat('dd/MM/yyyy HH:mm');
    const int width = 42;

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 297 * PdfPageFormat.mm),
        margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        theme: pw.ThemeData.withFont(base: font, bold: fontBold),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Center(child: pw.Text('KÀN CAFE & TRÀ SỮA', style: pw.TextStyle(font: fontBold, fontSize: 13, fontWeight: pw.FontWeight.bold))),
              pw.Center(child: pw.Text('ĐC: 123 Đường Trà Sữa, Q.1, TP.HCM', style: pw.TextStyle(fontSize: 8))),
              pw.Center(child: pw.Text('Hotline: 0908.123.456', style: pw.TextStyle(fontSize: 8))),
              pw.SizedBox(height: 3),
              pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
              pw.Center(child: pw.Text('HÓA ĐƠN THANH TOÁN', style: pw.TextStyle(font: fontBold, fontSize: 10, fontWeight: pw.FontWeight.bold))),
              pw.SizedBox(height: 3),

              // Order Info
              pw.Text('Mã HD: ${order.orderCode}', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
              pw.Text('Ngày: ${dateTime.format(order.createdAt)}', style: pw.TextStyle(fontSize: 9)),
              pw.Text('Loại: ${order.type.label}${order.tableName != null ? " - ${order.tableName}" : ""}', style: pw.TextStyle(fontSize: 9)),
              if (order.occupiedAt != null)
                pw.Text('Giờ vào: ${dateTime.format(order.occupiedAt!)}', style: pw.TextStyle(fontSize: 9)),
              if (order.paidAt != null)
                pw.Text('Giờ ra: ${dateTime.format(order.paidAt!)}', style: pw.TextStyle(fontSize: 9)),
              if (order.customerName != null && order.customerName!.isNotEmpty)
                pw.Text('Khách hàng: ${order.customerName}', style: pw.TextStyle(fontSize: 9)),
              pw.Text('Thu ngân: ${order.createdBy}', style: pw.TextStyle(fontSize: 9)),
              pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),
              pw.SizedBox(height: 3),

              // Items header
              pw.Text(_formatRow('Tên món', 'SL', 'Thành tiền', width), style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
              pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

              // Items
              ...order.items.map((item) {
                String itemTitle = item.productName;
                if (item.sizeName != 'M') itemTitle += ' (Size ${item.sizeName})';

                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(itemTitle, style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
                    if (item.selectedToppings.isNotEmpty)
                      pw.Text('  + ${item.selectedToppings.map((t) => t.name).join(', ')}', style: pw.TextStyle(fontSize: 8)),
                    if (item.note.isNotEmpty)
                      pw.Text('  * Ghi chú: ${item.note}', style: pw.TextStyle(fontSize: 8)),
                    pw.Text(
                      _formatRow('  ${item.quantity} x ${currency.format(item.itemUnitPrice)}', '', currency.format(item.totalPrice), width),
                      style: pw.TextStyle(fontSize: 9),
                    ),
                    pw.SizedBox(height: 2),
                  ],
                );
              }),

              pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),
              pw.SizedBox(height: 3),

              // Summary
              pw.Text(_formatRow('Tạm tính:', '', currency.format(order.subtotal), width), style: pw.TextStyle(fontSize: 9)),
              if (order.discountAmount > 0 || order.discountPercent > 0)
                pw.Text(
                  _formatRow(
                    'Giảm giá${order.discountPercent > 0 ? ' (${order.discountPercent.toInt()}%)' : ''}:',
                    '',
                    '-${currency.format(order.discountAmount)}',
                    width,
                  ),
                  style: pw.TextStyle(fontSize: 9),
                ),
              if (order.deliveryFee > 0)
                pw.Text(_formatRow('Phí giao hàng:', '', currency.format(order.deliveryFee), width), style: pw.TextStyle(fontSize: 9)),

              pw.SizedBox(height: 3),
              pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
              pw.Text(_formatRow('TỔNG CỘNG:', '', currency.format(order.totalAmount), width),
                style: pw.TextStyle(font: fontBold, fontSize: 11, fontWeight: pw.FontWeight.bold)),
              pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),

              pw.SizedBox(height: 3),
              pw.Text('Thanh toán: ${order.paymentMethod}', style: pw.TextStyle(fontSize: 9)),
              pw.Text('Trạng thái: ${order.paymentStatus == "PAID" ? "ĐÃ THANH TOÁN" : "CHƯA THANH TOÁN"}', style: pw.TextStyle(fontSize: 9)),
              pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

              // QR Code
              pw.SizedBox(height: 5),
              pw.Center(child: _buildQrCodeWidget(order.orderCode)),
              pw.SizedBox(height: 3),
              pw.Center(child: pw.Text('Quét QR để tìm hóa đơn', style: pw.TextStyle(fontSize: 8))),
              pw.Center(child: pw.Text(order.orderCode, style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold))),

              // Footer
              pw.SizedBox(height: 5),
              pw.Center(child: pw.Text('Cảm ơn Quý khách & Hẹn gặp lại!', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold))),
              pw.Center(child: pw.Text('Wifi: KanCafe_5G / Pass: 88888888', style: pw.TextStyle(fontSize: 8))),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Hoa_don_${order.orderCode}.pdf',
    );
  }

  /// Build QR code as PDF widgets (rectangles) - no external image needed
  static pw.Widget _buildQrCodeWidget(String data) {
    try {
      final qrCode = QrCode.fromData(data: data, errorCorrectLevel: QrErrorCorrectLevel.M);
      final qrImage = QrImage(qrCode);
      final int moduleCount = qrCode.moduleCount;
      const int quietZone = 4;
      final double moduleSize = 2.0;
      final double totalSize = (moduleCount + quietZone * 2) * moduleSize;

      final List<pw.Widget> rows = [];

      // Top quiet zone
      for (int i = 0; i < quietZone; i++) {
        rows.add(pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: List.generate(moduleCount + quietZone * 2, (_) => _emptyModule(moduleSize)),
        ));
      }

      // QR modules
      for (int y = 0; y < moduleCount; y++) {
        final List<pw.Widget> cells = [];

        // Left quiet zone
        for (int i = 0; i < quietZone; i++) {
          cells.add(_emptyModule(moduleSize));
        }

        // QR data
        for (int x = 0; x < moduleCount; x++) {
          cells.add(qrImage.isDark(x, y) ? _darkModule(moduleSize) : _emptyModule(moduleSize));
        }

        // Right quiet zone
        for (int i = 0; i < quietZone; i++) {
          cells.add(_emptyModule(moduleSize));
        }

        rows.add(pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: cells));
      }

      // Bottom quiet zone
      for (int i = 0; i < quietZone; i++) {
        rows.add(pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: List.generate(moduleCount + quietZone * 2, (_) => _emptyModule(moduleSize)),
        ));
      }

      return pw.Container(
        width: totalSize,
        height: totalSize,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        padding: const pw.EdgeInsets.all(1),
        child: pw.Column(children: rows),
      );
    } catch (_) {
      return pw.Text('[QR Error]', style: pw.TextStyle(fontSize: 8));
    }
  }

  static pw.Widget _darkModule(double size) => pw.Container(
    width: size,
    height: size,
    color: PdfColors.black,
  );

  static pw.Widget _emptyModule(double size) => pw.Container(
    width: size,
    height: size,
    color: PdfColors.white,
  );

  static String _formatRow(String left, String center, String right, int width) {
    int availableWidth = width - left.length - right.length;
    if (availableWidth <= 0) return '$left $right';
    return '$left${' ' * availableWidth}$right';
  }
}
