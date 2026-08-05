import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qr/qr.dart';
import '../../../core/auth/auth_service.dart';
import '../models/gara_repair_order.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

Future<void> printGaraReceiptPdf(GaraRepairOrder order, List<GaraRepairDetail> details) async {
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

  final customer = order.customer.value;
  final vehicle = order.vehicle.value;

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 297 * PdfPageFormat.mm),
      margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      theme: theme,
      build: (ctx) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(child: pw.Text(storeName ?? 'KANPOSVN GARA', style: pw.TextStyle(font: fontBold, fontSize: 14, fontWeight: pw.FontWeight.bold))),
          if (storePhone != null && storePhone.isNotEmpty)
            pw.Center(child: pw.Text('ĐT: $storePhone', style: pw.TextStyle(fontSize: 8))),
          pw.Center(child: pw.Text('PHIẾU THANH TOÁN & GIAO XE', style: pw.TextStyle(font: fontBold, fontSize: 10, fontWeight: pw.FontWeight.bold))),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 3),

          pw.Text('Mã phiếu: ${order.orderCode}', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
          pw.Text('Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(order.orderDate ?? DateTime.now())}', style: pw.TextStyle(fontSize: 9)),
          if (customer != null && customer.name.isNotEmpty)
            pw.Text('Khách: ${customer.name}', style: pw.TextStyle(fontSize: 9)),
          if (vehicle != null && vehicle.licensePlate.isNotEmpty)
            pw.Text('Biển số: ${vehicle.licensePlate}', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
          if (vehicle != null && (vehicle.brand.isNotEmpty || vehicle.modelName.isNotEmpty))
            pw.Text('Xe: ${[vehicle.brand, vehicle.modelName].where((s) => s.isNotEmpty).join(' ')}', style: pw.TextStyle(fontSize: 9)),
          if (order.currentKm > 0)
            pw.Text('Số km: ${order.currentKm}', style: pw.TextStyle(fontSize: 9)),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          pw.Text(fmtRow('Hạng mục', 'Thành tiền'), style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          ...details.map((item) {
            final name = item.product.value?.name ?? 'Hạng mục';
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(name, style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
                pw.Text(fmtRow('  ${_fmtQty(item.quantity)} x ${_currency.format(item.unitPrice)}', _currency.format(item.total)), style: pw.TextStyle(fontSize: 9)),
                pw.SizedBox(height: 2),
              ],
            );
          }),

          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          pw.Text(fmtRow('Tạm tính:', _currency.format(order.subTotal)), style: pw.TextStyle(fontSize: 9)),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.Text(fmtRow('TỔNG CỘNG:', _currency.format(order.totalAmount)),
            style: pw.TextStyle(font: fontBold, fontSize: 11, fontWeight: pw.FontWeight.bold)),
          pw.Center(child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.Text(fmtRow('Đã thanh toán:', _currency.format(order.paidAmount)), style: pw.TextStyle(fontSize: 9)),

          pw.SizedBox(height: 3),
          pw.Text('Trạng thái: ĐÃ GIAO XE', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold)),
          pw.Center(child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          pw.SizedBox(height: 5),
          pw.Center(child: _buildQrCode(order.orderCode)),
          pw.SizedBox(height: 3),
          pw.Center(child: pw.Text('Quét mã QR để tra cứu phiếu', style: pw.TextStyle(fontSize: 8))),
          pw.Center(child: pw.Text(order.orderCode, style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold))),

          pw.SizedBox(height: 5),
          pw.Center(child: pw.Text('Cảm ơn quý khách và hẹn gặp lại!', style: pw.TextStyle(font: fontBold, fontSize: 9, fontWeight: pw.FontWeight.bold))),
        ],
      ),
    ),
  );

  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
    name: 'Phiếu giao xe ${order.orderCode}',
  );
}

String _fmtQty(double qty) {
  if (qty == qty.roundToDouble()) return qty.toInt().toString();
  return qty.toStringAsFixed(2);
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
