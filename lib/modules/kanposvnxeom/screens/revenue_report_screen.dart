import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/payment_provider.dart';
import '../models/payment.dart';

class RevenueReportScreen extends ConsumerWidget {
  const RevenueReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(xeOmPaymentProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo Cáo Chi Tiết Giao Dịch')),
      body: paymentState.when(
        data: (payments) {
          if (payments.isEmpty) {
            return const Center(child: Text('Chưa có dữ liệu giao dịch nào.'));
          }

          final completedPayments = payments.where((p) => p.status == PaymentStatus.completed).toList();
          
          return ListView.builder(
            itemCount: completedPayments.length,
            itemBuilder: (context, index) {
              final payment = completedPayments[index];
              return ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.check, color: Colors.white)),
                title: Text('Hoá đơn cuốc: ${payment.bookingUuid?.split('-').last ?? "..."}'),
                subtitle: Text('HT: ${payment.method.name.toUpperCase()} - Cước: ${payment.amount}đ'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Hoa hồng (20%)', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text('+${payment.driverCommission ?? 0}đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
