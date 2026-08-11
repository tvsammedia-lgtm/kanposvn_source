import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qr/qr.dart';
import '../../../core/auth/auth_service.dart';
import '../models/invoice.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

String _paymentMethodLabel(String method) {
  switch (method) {
    case 'cash':
      return 'Tiền mặt';
    case 'qr':
      return 'QR Code';
    case 'transfer':
      return 'Chuyển khoản';
    case 'debt':
      return 'Công nợ';
    default:
      return method;
  }
}

Future<void> printTapHoaReceiptPdf(
  TapHoaInvoice invoice,
  List<TapHoaInvoiceItem> items,
) async {
  final storeName = await AuthService.loadSavedStoreName();
  final storePhone = await AuthService.loadSavedStorePhone();
  pw.Font? font;
  pw.Font? fontBold;
  try {
    font = await PdfGoogleFonts.robotoRegular();
    fontBold = await PdfGoogleFonts.robotoBold();
  } catch (_) {}
  final theme = pw.ThemeData.withFont(
    base: font ?? pw.Font.helvetica(),
    bold: fontBold ?? pw.Font.helveticaBold(),
  );

  const int width = 42;

  String fmtRow(String left, String right) {
    final int avail = width - left.length - right.length;
    if (avail <= 0) return '$left $right';
    return '$left${' ' * avail}$right';
  }

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 297 * PdfPageFormat.mm),
      margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      theme: theme,
      build: (ctx) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(child: pw.Text(storeName ?? 'KANPOSVN', textAlign: pw.TextAlign.center, style: pw.TextStyle(font: fontBold, fontSize: 14, fontWeight: pw.FontWeight.bold))),
          if (storePhone != null && storePhone.isNotEmpty)
            pw.Center(child: pw.Text('ĐT: $storePhone', textAlign: pw.TextAlign.center, style: pw.TextStyle(fontSize: 8))),
          pw.Center(child: pw.Text('HÓA ĐƠN BÁN HÀNG', style: pw.TextStyle(font: fontBold, fontSize: 10, fontWeight: pw.FontWeight.bold))),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 3),

          pw.Text('Mã HD: ${invoice.invoiceNumber}', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
          pw.Text('Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(invoice.createdAt)}', style: pw.TextStyle(fontSize: 9)),
          if (invoice.customerName.isNotEmpty)
            pw.Text('Khách hàng: ${invoice.customerName}', style: pw.TextStyle(fontSize: 9)),
          pw.Text('Thanh toán: ${_paymentMethodLabel(invoice.paymentMethod)}', style: pw.TextStyle(fontSize: 9)),
          if (invoice.cashierName.isNotEmpty)
            pw.Text('Thu ngân: ${invoice.cashierName}', style: pw.TextStyle(fontSize: 9)),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          pw.Text(fmtRow('Tên sản phẩm', 'Thành tiền'), style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          ...items.map((item) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(item.productName, style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
                pw.Text(fmtRow('  ${item.quantity.toStringAsFixed(0)} x ${_currency.format(item.price)}', _currency.format(item.total)), style: pw.TextStyle(fontSize: 9)),
                pw.SizedBox(height: 2),
              ],
            );
          }),

          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          pw.Text(fmtRow('Tạm tính:', _currency.format(invoice.totalAmount)), style: pw.TextStyle(fontSize: 9)),
          if (invoice.discountAmount > 0)
            pw.Text(fmtRow('Giảm giá:', '-${_currency.format(invoice.discountAmount)}'), style: pw.TextStyle(fontSize: 9)),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.Text(fmtRow('TỔNG CỘNG:', _currency.format(invoice.finalAmount)),
            style: pw.TextStyle(font: fontBold, fontSize: 11, fontWeight: pw.FontWeight.bold)),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),

          if (invoice.paymentMethod != 'debt') ...[
            pw.SizedBox(height: 3),
            pw.Text(fmtRow('Khách đưa:', _currency.format(invoice.amountPaid)), style: pw.TextStyle(fontSize: 9)),
            if (invoice.changeAmount > 0)
              pw.Text(fmtRow('Tiền thừa:', _currency.format(invoice.changeAmount)), style: pw.TextStyle(fontSize: 9)),
          ],

          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          pw.SizedBox(height: 5),
          pw.Center(child: _buildQrCode(invoice.invoiceId)),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('Quét mã QR để tra cứu hóa đơn', style: pw.TextStyle(fontSize: 8))),
          pw.Center(child: pw.Text(invoice.invoiceNumber, style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold))),

          pw.SizedBox(height: 5),
          pw.Center(child: pw.Text('Cảm ơn quý khách và hẹn gặp lại!', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold))),
        ],
      ),
    ),
  );

  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
    name: 'Hóa đơn ${invoice.invoiceNumber}',
  );
}

pw.Widget _buildQrCode(String data) {
  try {
    final qrCode = QrCode.fromData(data: data, errorCorrectLevel: QrErrorCorrectLevel.M);
    final qrImage = QrImage(qrCode);
    final int moduleCount = qrCode.moduleCount;
    const int quietZone = 4;
    final double moduleSize = 2.0;
    final double totalSize = (moduleCount + quietZone * 2) * moduleSize;

    final List<pw.Widget> rows = [];

    for (int i = 0; i < quietZone; i++) {
      rows.add(pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: List.generate(moduleCount + quietZone * 2, (_) => _emptyModule(moduleSize)),
      ));
    }

    for (int y = 0; y < moduleCount; y++) {
      final List<pw.Widget> cells = [];
      for (int i = 0; i < quietZone; i++) {
        cells.add(_emptyModule(moduleSize));
      }
      for (int x = 0; x < moduleCount; x++) {
        cells.add(qrImage.isDark(x, y) ? _darkModule(moduleSize) : _emptyModule(moduleSize));
      }
      for (int i = 0; i < quietZone; i++) {
        cells.add(_emptyModule(moduleSize));
      }
      rows.add(pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: cells));
    }

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

pw.Widget _darkModule(double size) => pw.Container(width: size, height: size, color: PdfColors.black);
pw.Widget _emptyModule(double size) => pw.Container(width: size, height: size, color: PdfColors.white);
