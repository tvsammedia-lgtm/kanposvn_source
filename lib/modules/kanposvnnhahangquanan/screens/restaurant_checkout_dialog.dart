import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_promotion.dart';
import '../models/restaurant_partner_models.dart';
import '../providers/restaurant_providers.dart';
import '../services/restaurant_business_logic.dart';

class CheckoutResult {
  final List<RestaurantOrderPayment> payments;
  final double discountAmount;
  final String promotionName;
  final RestaurantCustomer? customer;

  const CheckoutResult({
    required this.payments,
    required this.discountAmount,
    required this.promotionName,
    this.customer,
  });
}

/// XVIII. Thu ngân: chọn khuyến mãi, khách hàng và kết hợp nhiều phương thức
/// thanh toán (Tiền mặt / QR / Chuyển khoản / Thẻ / Ví điện tử).
Future<CheckoutResult?> showRestaurantCheckoutDialog(
  BuildContext context,
  WidgetRef ref, {
  required double subtotal,
  required List<RestaurantOrderDetail> details,
  required String tableName,
}) {
  final promotions = (ref.read(restaurantPromotionsProvider).value ?? []);
  final customers = (ref.read(restaurantCustomersProvider).value ?? []);

  RestaurantPromotion? selectedPromo;
  RestaurantCustomer? selectedCustomer;
  final cashCtrl = TextEditingController();
  final qrCtrl = TextEditingController();
  final cardCtrl = TextEditingController();
  final walletCtrl = TextEditingController();

  double parse(String s) => double.tryParse(s.replaceAll(',', '').trim()) ?? 0;

  return showDialog<CheckoutResult>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setDialogState) {
        final promo = selectedPromo;
        final discount = RestaurantBusinessLogic.calculateDiscount(
          promotion: promo,
          subtotal: subtotal,
          details: details,
        );
        final finalAmount = subtotal - discount;
        final payments = <RestaurantOrderPayment>[
          if (parse(cashCtrl.text) > 0)
            RestaurantOrderPayment()
              ..method = RestaurantPaymentMethod.CASH
              ..amount = parse(cashCtrl.text),
          if (parse(qrCtrl.text) > 0)
            RestaurantOrderPayment()
              ..method = RestaurantPaymentMethod.QR
              ..amount = parse(qrCtrl.text),
          if (parse(cardCtrl.text) > 0)
            RestaurantOrderPayment()
              ..method = RestaurantPaymentMethod.CARD
              ..amount = parse(cardCtrl.text),
          if (parse(walletCtrl.text) > 0)
            RestaurantOrderPayment()
              ..method = RestaurantPaymentMethod.E_WALLET
              ..amount = parse(walletCtrl.text),
        ];
        final paid = RestaurantBusinessLogic.totalPaid(payments);
        final change = paid - finalAmount;
        // Chọn khách hàng -> cho phép ghi nợ (trả thiếu)
        final enough = paid + 1 >= finalAmount || selectedCustomer != null;

        InputDecoration deco(String label) => InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              isDense: true,
            );

        Widget payField(String label, TextEditingController ctrl, IconData icon,
            {bool cash = false}) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(children: [
              Icon(icon, size: 20, color: Colors.orange),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: ctrl,
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setDialogState(() {}),
                  decoration: deco('$label (đ)'),
                ),
              ),
              TextButton(
                child: Text(cash ? 'Đủ' : 'Còn lại',
                    style: const TextStyle(fontSize: 12)),
                onPressed: () {
                  final remain = (finalAmount -
                          parse(cashCtrl.text) -
                          parse(qrCtrl.text) -
                          parse(cardCtrl.text) -
                          parse(walletCtrl.text))
                      .clamp(0, finalAmount);
                  ctrl.text = remain.toStringAsFixed(0);
                  setDialogState(() {});
                },
              ),
            ]),
          );
        }

        return AlertDialog(
          title: Text('THANH TOÁN - $tableName',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          content: SizedBox(
            width: 440,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tạm tính:'),
                        Text('${subtotal.toStringAsFixed(0)} đ',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<RestaurantPromotion?>(
                    value: selectedPromo,
                    isExpanded: true,
                    decoration: deco('Khuyến mãi'),
                    items: [
                      const DropdownMenuItem(
                          value: null, child: Text('— Không áp dụng —')),
                      ...promotions.map((p) => DropdownMenuItem(
                            value: p,
                            child: Text(p.name,
                                overflow: TextOverflow.ellipsis),
                          )),
                    ],
                    onChanged: (v) => setDialogState(() => selectedPromo = v),
                  ),
                  if (discount > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text('Giảm giá (${promo!.name}):',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.green)),
                            ),
                            Text('-${discount.toStringAsFixed(0)} đ',
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  const Divider(height: 16),
                  DropdownButtonFormField<RestaurantCustomer?>(
                    value: selectedCustomer,
                    isExpanded: true,
                    decoration:
                        deco('Khách hàng (tùy chọn - tích điểm/công nợ)'),
                    items: [
                      const DropdownMenuItem(
                          value: null, child: Text('— Khách vãng lai —')),
                      ...customers.map((c) => DropdownMenuItem(
                            value: c,
                            child: Text(
                                '${c.name} (${c.phone}) • ${c.points} điểm',
                                overflow: TextOverflow.ellipsis),
                          )),
                    ],
                    onChanged: (v) =>
                        setDialogState(() => selectedCustomer = v),
                  ),
                  if (selectedCustomer != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                          'Điểm sẽ tích: ${RestaurantBusinessLogic.pointsEarnedFor(finalAmount)} • Nợ hiện tại: ${selectedCustomer!.debt.toStringAsFixed(0)}đ (cho phép trả thiếu)',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ),
                  const Divider(height: 16),
                  const Text('Phương thức thanh toán (kết hợp được):',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  payField('Tiền mặt', cashCtrl, Icons.payments, cash: true),
                  payField('QR / Chuyển khoản', qrCtrl, Icons.qr_code_2),
                  payField('Thẻ', cardCtrl, Icons.credit_card),
                  payField('Ví điện tử', walletCtrl,
                      Icons.account_balance_wallet),
                  const Divider(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('PHẢI THU:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text('${finalAmount.toStringAsFixed(0)} đ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red)),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(change >= 0 ? 'Tiền thừa trả khách:' : 'Khách còn thiếu:',
                        style: TextStyle(
                            color: change >= 0 ? Colors.green : Colors.red)),
                    Text('${change.abs().toStringAsFixed(0)} đ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: change >= 0 ? Colors.green : Colors.red)),
                  ]),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Hủy')),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: Colors.green),
              icon: const Icon(Icons.check_circle),
              label: const Text('XÁC NHẬN'),
              onPressed: !enough
                  ? null
                  : () => Navigator.pop(
                        ctx,
                        CheckoutResult(
                          payments: payments,
                          discountAmount: discount,
                          promotionName:
                              discount > 0 && promo != null
                                  ? promo.name
                                  : '',
                          customer: selectedCustomer,
                        ),
                      ),
            ),
          ],
        );
      },
    ),
  );
}
