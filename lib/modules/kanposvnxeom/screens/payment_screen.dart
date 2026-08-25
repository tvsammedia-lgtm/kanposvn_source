import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/booking.dart';
import '../models/payment.dart';
import '../providers/payment_provider.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final XeOmBooking booking;
  const PaymentScreen({super.key, required this.booking});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  PaymentMethod _selectedMethod = PaymentMethod.cash;
  
  void _processPayment() {
    final payment = XeOmPayment()
      ..bookingUuid = widget.booking.uuid
      ..customerUuid = widget.booking.customerUuid
      ..driverUuid = widget.booking.driverUuid
      ..amount = widget.booking.price
      ..method = _selectedMethod;
      
    ref.read(xeOmPaymentProvider.notifier).processPayment(payment);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thanh toán thành công! Đã trích 20% hoa hồng.')),
    );
    Navigator.pop(context); // Trở về danh sách booking
  }

  @override
  Widget build(BuildContext context) {
    final amountStr = '${widget.booking.price ?? 0} đ';
    
    return Scaffold(
      appBar: AppBar(title: const Text('Thanh Toán Cước Phí')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
            const SizedBox(height: 16),
            const Text('Chuyến đi đã hoàn thành!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tổng tiền thu khách:', style: TextStyle(fontSize: 18)),
                    Text(amountStr, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Chọn phương thức:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ListTile(
              title: const Text('Tiền mặt'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.cash,
                groupValue: _selectedMethod,
                onChanged: (v) => setState(() => _selectedMethod = v!),
              ),
            ),
            ListTile(
              title: const Text('Chuyển khoản / QR Momo'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.qr,
                groupValue: _selectedMethod,
                onChanged: (v) => setState(() => _selectedMethod = v!),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                child: const Text('XÁC NHẬN ĐÃ THU TIỀN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
