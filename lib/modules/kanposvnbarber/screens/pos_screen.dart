import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/pos_provider.dart';
import 'checkout_screen.dart';

class PosScreen extends ConsumerWidget {
  const PosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posState = ref.watch(posProvider);
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('POS Bán Hàng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => ref.read(posProvider.notifier).clearCart(),
          )
        ],
      ),
      body: Row(
        children: [
          // Bên trái: Danh sách Dịch vụ/Sản phẩm (giả lập 2 dịch vụ mẫu)
          Expanded(
            flex: 2,
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildItemCard(
                  context: context,
                  ref: ref,
                  id: 'SRV01',
                  name: 'Cắt tóc nam',
                  price: 80000,
                  type: 'Service',
                  color: Colors.blue.shade100,
                ),
                _buildItemCard(
                  context: context,
                  ref: ref,
                  id: 'SRV02',
                  name: 'Nhuộm tóc đen',
                  price: 250000,
                  type: 'Service',
                  color: Colors.purple.shade100,
                ),
                _buildItemCard(
                  context: context,
                  ref: ref,
                  id: 'PRD01',
                  name: 'Sáp vuốt tóc Volcanic',
                  price: 320000,
                  type: 'Product',
                  color: Colors.orange.shade100,
                ),
              ],
            ),
          ),
          // Bên phải: Giỏ hàng
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Khách hàng:', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {
                            // TODO: Mở popup chọn khách
                            ref.read(posProvider.notifier).setCustomer('CUST-01', 'Anh Quân');
                          },
                          child: Text(posState.invoice.customerName ?? 'Khách lẻ'),
                        )
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: ListView.builder(
                      itemCount: posState.details.length,
                      itemBuilder: (context, index) {
                        final item = posState.details[index];
                        return ListTile(
                          title: Text(item.itemName),
                          subtitle: Text('${item.quantity} x ${currencyFormatter.format(item.unitPrice)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(currencyFormatter.format(item.total)),
                              IconButton(
                                icon: const Icon(Icons.remove_circle, color: Colors.red),
                                onPressed: () => ref.read(posProvider.notifier).removeItem(item.itemId),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTotalRow('Tạm tính:', posState.subTotal, currencyFormatter),
                        _buildTotalRow('Giảm giá:', posState.invoice.discount, currencyFormatter),
                        const Divider(),
                        _buildTotalRow('Tổng cộng:', posState.total, currencyFormatter, isBold: true),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.green,
                          ),
                          onPressed: posState.details.isEmpty ? null : () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen()));
                          },
                          child: const Text('THANH TOÁN', style: TextStyle(fontSize: 18, color: Colors.white)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemCard({
    required BuildContext context,
    required WidgetRef ref,
    required String id,
    required String name,
    required double price,
    required String type,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        ref.read(posProvider.notifier).addItem(id, name, type, price);
      },
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Text(NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(price)),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount, NumberFormat formatter, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isBold ? 18 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(formatter.format(amount), style: TextStyle(fontSize: isBold ? 18 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.red : Colors.black)),
        ],
      ),
    );
  }
}
