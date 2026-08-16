import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'receipt_data.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

/// In hóa đơn ra PDF khổ giấy 80mm (roll) từ dữ liệu [ReceiptData].
Future<void> printReceiptPdf(
  ReceiptData receipt, {
  String? filename,
}) async {
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
    pw.MultiPage(
      pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 297 * PdfPageFormat.mm),
      margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      theme: theme,
      build: (ctx) => [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Center(
              child: pw.Text(
                receipt.shopName ?? 'KANPOSVN',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    font: fontBold, fontSize: 14, fontWeight: pw.FontWeight.bold),
              ),
            ),
            if (receipt.shopOwnerName != null &&
                receipt.shopOwnerName!.isNotEmpty &&
                receipt.shopOwnerName != receipt.shopName)
              pw.Center(
                child: pw.Text(receipt.shopOwnerName!,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 10)),
              ),
            if (receipt.shopPhone != null && receipt.shopPhone!.isNotEmpty)
              pw.Center(
                child: pw.Text('ĐT: ${receipt.shopPhone}',
                    style: pw.TextStyle(fontSize: 8)),
              ),
            if (receipt.shopAddress != null && receipt.shopAddress!.isNotEmpty)
              pw.Center(
                child: pw.Text(receipt.shopAddress!,
                    style: pw.TextStyle(fontSize: 8)),
              ),
            if (receipt.shopTaxCode != null && receipt.shopTaxCode!.isNotEmpty)
              pw.Center(
                child: pw.Text('MST: ${receipt.shopTaxCode}',
                    style: pw.TextStyle(fontSize: 8)),
              ),
            if (receipt.einvoicePattern != null &&
                receipt.einvoicePattern!.isNotEmpty)
              pw.Center(
                child: pw.Text('Mẫu số: ${receipt.einvoicePattern}',
                    style: pw.TextStyle(fontSize: 8)),
              ),
            if (receipt.einvoiceSymbol != null &&
                receipt.einvoiceSymbol!.isNotEmpty)
              pw.Center(
                child: pw.Text(
                  'Ký hiệu: ${receipt.einvoiceSymbol}'
                  '${receipt.einvoiceNumber != null && receipt.einvoiceNumber!.isNotEmpty ? ' · Số: ${receipt.einvoiceNumber}' : ''}',
                  style: pw.TextStyle(fontSize: 8),
                ),
              ),
            pw.Center(
              child: pw.Text(
                receipt.title,
                style: pw.TextStyle(
                    font: fontBold,
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 3),
            pw.Center(
                child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
            pw.SizedBox(height: 3),

            if (receipt.orderCode != null && receipt.orderCode!.isNotEmpty)
              pw.Text('Mã đơn: ${receipt.orderCode}',
                  style: pw.TextStyle(
                      font: fontBold,
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold)),
            pw.Text(
                'Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(receipt.date ?? DateTime.now())}',
                style: pw.TextStyle(fontSize: 9)),
            if (receipt.table.isNotEmpty)
              pw.Text('Bàn: ${receipt.table}', style: pw.TextStyle(fontSize: 9)),
            if (receipt.customer.isNotEmpty)
              pw.Text('Khách hàng: ${receipt.customer}',
                  style: pw.TextStyle(fontSize: 9)),
            if (receipt.paymentMethod != null &&
                receipt.paymentMethod!.isNotEmpty)
              pw.Text('Thanh toán: ${receipt.paymentMethod}',
                  style: pw.TextStyle(fontSize: 9)),
            pw.SizedBox(height: 3),
            pw.Center(
                child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

            pw.Text(fmtRow('Tên sản phẩm', 'Thành tiền'),
                style: pw.TextStyle(
                    font: fontBold,
                    fontSize: 9,
                    fontWeight: pw.FontWeight.bold)),
            pw.Center(
                child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

            ...receipt.items.map((item) {
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(item.name,
                      style: pw.TextStyle(
                          font: fontBold,
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold)),
                  if (item.extra.isNotEmpty)
                    pw.Text('  + ${item.extra}', style: pw.TextStyle(fontSize: 8)),
                  pw.Text(
                    fmtRow(
                        '  ${item.quantity == item.quantity.roundToDouble() ? item.quantity.toInt().toString() : item.quantity.toStringAsFixed(2)} x ${_currency.format(item.unitPrice)}',
                        _currency.format(item.total)),
                    style: pw.TextStyle(fontSize: 9),
                  ),
                  pw.SizedBox(height: 2),
                ],
              );
            }),

            pw.Center(
                child: pw.Text('-' * width, style: pw.TextStyle(fontSize: 8))),

            pw.Text(fmtRow('Tạm tính:', _currency.format(receipt.subtotal)),
                style: pw.TextStyle(fontSize: 9)),
            if (receipt.discount > 0)
              pw.Text(fmtRow('Giảm giá:', '-${_currency.format(receipt.discount)}'),
                  style: pw.TextStyle(fontSize: 9)),
            if (receipt.vat > 0)
              pw.Text(fmtRow('Thuế (VAT):', _currency.format(receipt.vat)),
                  style: pw.TextStyle(fontSize: 9)),
            pw.SizedBox(height: 3),
            pw.Center(
                child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),
            pw.Text(fmtRow('TỔNG CỘNG:', _currency.format(receipt.grandTotal)),
                style: pw.TextStyle(
                    font: fontBold,
                    fontSize: 11,
                    fontWeight: pw.FontWeight.bold)),
            pw.Center(
                child: pw.Text('=' * width, style: pw.TextStyle(fontSize: 8))),

            if (receipt.cashReceived != null && receipt.change != null) ...[
              pw.SizedBox(height: 3),
              pw.Text(fmtRow('Khách đưa:', _currency.format(receipt.cashReceived!)),
                  style: pw.TextStyle(fontSize: 9)),
              if (receipt.change! > 0)
                pw.Text(fmtRow('Tiền thừa:', _currency.format(receipt.change!)),
                    style: pw.TextStyle(fontSize: 9)),
            ],

            if (receipt.note.isNotEmpty)
              pw.Text('Ghi chú: ${receipt.note}',
                  style: pw.TextStyle(fontSize: 9)),

            pw.SizedBox(height: 5),
            pw.Center(
                child: pw.Text(receipt.footer,
                    style: pw.TextStyle(
                        font: fontBold,
                        fontSize: 9,
                        fontWeight: pw.FontWeight.bold))),
          ],
        ),
      ],
    ),
  );

  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
    name: filename ?? 'HoaDon_${receipt.orderCode ?? DateTime.now().millisecondsSinceEpoch}.pdf',
  );
}
