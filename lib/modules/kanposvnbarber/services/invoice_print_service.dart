import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import '../models/barber_invoice.dart';
import '../models/barber_invoice_detail.dart';

class InvoicePrintService {
  static Future<void> printInvoice(BarberInvoice invoice, List<BarberInvoiceDetail> details) async {
    final pdf = pw.Document();
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text('KANPOS BARBER SHOP', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 8),
              pw.Text('HÓA ĐƠN THANH TOÁN', style: pw.TextStyle(fontSize: 14)),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Mã: ${invoice.invoiceId}'),
                  pw.Text(DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())),
                ]
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text('Khách: ${invoice.customerName ?? 'Khách lẻ'}'),
                ]
              ),
              pw.Divider(),
              pw.ListView.builder(
                itemCount: details.length,
                itemBuilder: (context, index) {
                  final item = details[index];
                  return pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 2),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(child: pw.Text(item.itemName)),
                        pw.Text('${item.quantity} x ${currencyFormatter.format(item.unitPrice)}'),
                      ]
                    )
                  );
                }
              ),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Tạm tính:'),
                  pw.Text(currencyFormatter.format(invoice.subTotal)),
                ]
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Giảm giá:'),
                  pw.Text(currencyFormatter.format(invoice.discount)),
                ]
              ),
              pw.SizedBox(height: 8),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('TỔNG CỘNG:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                  pw.Text(currencyFormatter.format(invoice.total), style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                ]
              ),
              pw.SizedBox(height: 16),
              pw.Text('Cảm ơn quý khách và hẹn gặp lại!', style: const pw.TextStyle(fontSize: 10)),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
