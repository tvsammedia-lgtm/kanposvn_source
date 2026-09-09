import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/printer/pdf_owner_header.dart';
import '../../../core/printer/pdf_print.dart';
import '../../../core/printer/pdf_vietnamese_theme.dart';
import '../models/vantai_ticket.dart';

final _money =
    NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);
final _dateTimeFmt = DateFormat('dd/MM/yyyy HH:mm');
final _timeFmt = DateFormat('HH:mm');

String _departureLabel(DateTime? departureTime) {
  if (departureTime == null) return '...';
  return _timeFmt.format(departureTime);
}

/// In vé xe ra PDF khổ giấy 80mm (roll) từ dữ liệu [ticket].
///
/// Dat ve sau khi ban: xuat ve ra tap tin PDF va mo dialog in/chia se.
Future<void> printVantaiTicketPdf(VantaiTicket ticket) async {
  final route = ticket.route.value;
  final vehicle = ticket.vehicle.value;
  final trip = ticket.trip.value;

  final (font, fontBold) = await loadVietnamesePdfFonts();
  final theme = pw.ThemeData.withFont(base: font, bold: fontBold);

  final shopName = 'KANPOSVN VẬN TẢI';
  final ownerHeader = await buildOwnerHeaderLine();

  const int width = 32;

  String fmtRow(String left, String right) {
    final int avail = width - left.length - right.length;
    if (avail <= 0) return '$left $right';
    return '$left${' ' * avail}$right';
  }

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(58 * PdfPageFormat.mm, 297 * PdfPageFormat.mm),
      margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      theme: theme,
      build: (ctx) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(
            child: pw.Text(
              shopName,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                  font: fontBold, fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
          if (ownerHeader != null)
            pw.Center(
              child: pw.Text(ownerHeader,
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
            ),
          pw.SizedBox(height: 3),
          pw.Center(
            child: pw.Text(
              '=====  VÉ XE  =====',
              style: pw.TextStyle(
                  font: fontBold,
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.teal700),
            ),
          ),
          pw.Center(
            child: pw.Text(
              '${ticket.status.label} • ${ticket.paymentMethod.label}',
              style: pw.TextStyle(fontSize: 9),
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Center(
              child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.SizedBox(height: 4),

          // Tuyến
          pw.Text(fmtRow('Tuyến:', route?.routeName ?? '...'),
              style: pw.TextStyle(
                  font: fontBold,
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold)),
          if (route != null &&
              (route.startPoint.isNotEmpty || route.endPoint.isNotEmpty))
            pw.Text(fmtRow('Chặng:', '${route.startPoint} → ${route.endPoint}'),
                style: pw.TextStyle(fontSize: 9)),

          pw.Text(
            fmtRow(
                'Mã vé:', ticket.ticketCode),
            style: pw.TextStyle(
                font: fontBold,
                fontSize: 9,
                fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            fmtRow('Giờ khởi hành:', _departureLabel(trip?.departureTime)),
            style: pw.TextStyle(fontSize: 9),
          ),

          pw.SizedBox(height: 3),
          pw.Center(
              child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          // Ghế & số vé
          pw.Center(
            child: pw.Text(
              'GHẾ: ${ticket.seatNumber}',
              style: pw.TextStyle(
                  font: fontBold,
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blueGrey800),
            ),
          ),
          pw.SizedBox(height: 3),

          if (ticket.passengerName.isNotEmpty)
            pw.Text('Khách hàng: ${ticket.passengerName}',
                style: pw.TextStyle(fontSize: 9)),
          if (ticket.passengerPhone.isNotEmpty)
            pw.Text('SĐT: ${ticket.passengerPhone}',
                style: pw.TextStyle(fontSize: 9)),
          if (vehicle != null && vehicle.plateNumber.isNotEmpty)
            pw.Text('Xe: ${vehicle.plateNumber} (${vehicle.type.label})',
                style: pw.TextStyle(fontSize: 9)),

          pw.SizedBox(height: 3),
          pw.Center(
              child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

          pw.Text(fmtRow('Giá vé:', _money.format(ticket.price)),
              style: pw.TextStyle(
                  font: fontBold,
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 3),
          pw.Center(
              child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
          pw.Text(
            fmtRow('TỔNG:', _money.format(ticket.price)),
            style: pw.TextStyle(
                font: fontBold,
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.teal800),
          ),
          pw.Center(
              child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),

          pw.SizedBox(height: 4),
          pw.Text(
            fmtRow('Ngày bán:', _dateTimeFmt.format(ticket.bookingDate ?? DateTime.now())),
            style: pw.TextStyle(fontSize: 8),
          ),
          if (ticket.ticketCode.isNotEmpty) ...[
            pw.SizedBox(height: 5),
            pw.Center(
              child: pw.BarcodeWidget(
                data: ticket.ticketCode,
                barcode: pw.Barcode.qrCode(),
                width: 70,
                height: 70,
              ),
            ),
            pw.SizedBox(height: 3),
            pw.Center(
              child: pw.Text(ticket.ticketCode,
                  style: pw.TextStyle(
                      font: fontBold,
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold)),
            ),
            pw.Center(
              child: pw.Text('Quét mã vé khi lên xe',
                  style: pw.TextStyle(fontSize: 8)),
            ),
          ],

          pw.SizedBox(height: 6),
          pw.Center(
            child: pw.Text(
              'Cảm ơn quý khách và chúc một chuyến đi vui vẻ!',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                  font: fontBold,
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );

  await printPdfSafely(
    document: pdf,
    name: 'Ve_${ticket.ticketCode}.pdf',
  );
}
