import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/pos_provider.dart';
import '../services/invoice_print_service.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posState = ref.watch(posProvider);
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      appBar: AppBar(title: const Text('Thanh Toán')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Thông tin hóa đơn', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('Mã: ${posState.invoice.invoiceId}'),
                    Text('Khách hàng: ${posState.invoice.customerName ?? 'Khách lẻ'}'),
                    const Divider(),
                    Text('Tổng tiền cần thanh toán: ${currencyFormatter.format(posState.total)}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Phương thức thanh toán:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: [
                _buildPaymentMethod(Icons.money, 'Tiền mặt', true),
                _buildPaymentMethod(Icons.qr_code, 'QR Code', false),
                _buildPaymentMethod(Icons.credit_card, 'Thẻ', false),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.print),
                    label: const Text('IN HÓA ĐƠN'),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    onPressed: () {
                      InvoicePrintService.printInvoice(posState.invoice, posState.details);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check_circle),
                    label: const Text('HOÀN TẤT', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      // TODO: Lưu vào Database
                      ref.read(posProvider.notifier).clearCart();
                      Navigator.pop(context); // Trở về POS
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thanh toán thành công!')));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(IconData icon, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade100 : Colors.white,
        border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: isSelected ? Colors.blue : Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
