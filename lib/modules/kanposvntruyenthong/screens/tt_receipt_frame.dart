import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

/// Khung chứng từ in (hóa đơn bán, phiếu nhập, phiếu thu/chi).
class TtReceiptFrame {
  /// In PDF một phiếu đơn giản (hóa đơn bán lẻ, phiếu nhập, phiếu thu/chi...).
  static Future<void> printReceipt({
    required String storeName,
    required String title,
    required String number,
    required List<String> lines,
    required Map<String, double> totals,
    String? customer,
    String? footer,
    Map<String, String>? meta,
  }) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 297 * PdfPageFormat.mm),
        build: (context) => [
          pw.Center(
            child: pw.Text(storeName, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
          ),
          pw.SizedBox(height: 2),
          pw.Center(
            child: pw.Text(title, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
          ),
          pw.Center(child: pw.Text('Số: $number')),
          pw.Center(child: pw.Text('Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}')),
          pw.SizedBox(height: 4),
          if (customer != null && customer.isNotEmpty) pw.Text('Khách hàng: $customer'),
          if (meta != null) for (final e in meta.entries) pw.Text('${e.key}: ${e.value}'),
          pw.Divider(),
          for (final l in lines) pw.Padding(padding: const pw.EdgeInsets.only(bottom: 2), child: pw.Text(l, style: const pw.TextStyle(fontSize: 9))),
          pw.Divider(),
          for (final t in totals.entries)
            pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 1),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(child: pw.Text(t.key, style: pw.TextStyle(fontSize: 9))),
                  pw.Text(t.value.toStringAsFixed(0), style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ),
          pw.SizedBox(height: 6),
          if (footer != null) pw.Center(child: pw.Text(footer, style: const pw.TextStyle(fontSize: 9))),
        ],
      ),
    );
    try {
      await Printing.layoutPdf(onLayout: (format) async => pdf.save());
    } catch (_) {}
  }
}

/// Hộp thoại xem trước chứng từ trước khi in.
class TtReceiptPreviewDialog extends StatelessWidget {
  final String title;
  final String number;
  final List<String> lines;
  final Map<String, double> totals;
  final String? customer;
  final String? footer;
  final Map<String, String>? meta;

  const TtReceiptPreviewDialog({
    super.key,
    required this.title,
    required this.number,
    required this.lines,
    required this.totals,
    this.customer,
    this.footer,
    this.meta,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: Container(
        width: 320,
        padding: const EdgeInsets.all(12),
        color: Colors.grey[100],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Số: $number', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}', textAlign: TextAlign.center),
            const Divider(),
            if (customer != null && customer!.isNotEmpty) Text('Khách hàng: $customer'),
            if (meta != null) for (final e in meta!.entries) Text('${e.key}: ${e.value}'),
            const Divider(),
            for (final l in lines) Padding(padding: const EdgeInsets.only(bottom: 3), child: Text(l, style: const TextStyle(fontSize: 12))),
            const Divider(),
            for (final t in totals.entries)
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.key),
                    Text(t.value.toStringAsFixed(0), style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            const Divider(),
            if (footer != null) Text(footer!, textAlign: TextAlign.center),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Đóng')),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('In PDF'),
        ),
      ],
    );
  }
}