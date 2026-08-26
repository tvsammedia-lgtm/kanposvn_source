import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/pos_provider.dart';
import '../providers/barber_service_provider.dart';
import '../models/barber_invoice.dart';
import '../models/barber_invoice_detail.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posState = ref.watch(posProvider);
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      appBar: AppBar(title: const Text('Thanh Toán')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Thông tin hóa đơn', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text('Mã: ${posState.invoice.invoiceId}'),
                Text('Khách: ${posState.invoice.customerName ?? 'Khách lẻ'}'),
                const Divider(),
                Text('Tổng: ${fmt.format(posState.total)}',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red)),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Phương thức thanh toán:', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Wrap(spacing: 8, children: [
            _paymentChip(Icons.money, 'Tiền mặt', true),
            _paymentChip(Icons.qr_code, 'QR Code', false),
            _paymentChip(Icons.credit_card, 'Chuyển khoản', false),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.print, color: Colors.white),
                label: const Text('IN 80mm', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: Colors.orange),
                onPressed: () => _completePayment(context, ref, ReceiptPrintMode.thermal80),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                label: const Text('IN PDF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: Colors.red),
                onPressed: () => _completePayment(context, ref, ReceiptPrintMode.pdf),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle, color: Colors.white),
                label: const Text('HOÀN TẤT', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: Colors.blue),
                onPressed: () => _completePayment(context, ref, ReceiptPrintMode.auto),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Future<void> _completePayment(BuildContext context, WidgetRef ref, ReceiptPrintMode mode) async {
    final posState = ref.read(posProvider);
    final invoice = posState.invoice;

    // Save invoice to Isar
    try {
      final isar = await ref.read(barberIsarProvider.future);
      await isar.writeTxn(() async {
        invoice.status = 'Đã thanh toán';
        await isar.barberInvoices.put(invoice);
        for (final d in posState.details) {
          await isar.barberInvoiceDetails.put(d);
        }
      });
    } catch (e) {
      // Still proceed with print even if save fails
    }

    ref.read(posProvider.notifier).clearCart();
    if (!context.mounted) return;

    try {
      await printReceiptByMode(
        context,
        ref,
        ReceiptData(
          shopName: 'KANPOS BARBER SHOP',
          title: 'HÓA ĐƠN THANH TOÁN',
          orderCode: invoice.invoiceId,
          customer: invoice.customerName ?? 'Khách lẻ',
          qrData: invoice.invoiceId,
          items: posState.details
              .map((d) => ReceiptItem(
                    name: d.itemName,
                    quantity: d.quantity,
                    unitPrice: d.unitPrice,
                    total: d.quantity * d.unitPrice,
                  ))
              .toList(),
          subtotal: invoice.subTotal,
          discount: invoice.discount,
          grandTotal: invoice.total,
        ),
        mode,
        pdfFilename: 'HoaDon_${invoice.invoiceId}.pdf',
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('In hóa đơn thất bại: $e')));
    }
    if (!context.mounted) return;
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thanh toán thành công!')));
  }

  Widget _paymentChip(IconData icon, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade100 : Colors.white,
        border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: isSelected ? Colors.blue : Colors.grey, size: 20),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(color: isSelected ? Colors.blue : Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
      ]),
    );
  }
}
