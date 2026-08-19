import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/nhatro_providers.dart';
import '../models/payment.dart';

class PaymentListScreen extends ConsumerWidget {
  const PaymentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentsAsync = ref.watch(paymentsProvider);
    final expensesAsync = ref.watch(expensesProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thu Chi'),
          bottom: const TabBar(tabs: [
            Tab(text: 'PHIEU THU'),
            Tab(text: 'PHIEU CHI'),
          ]),
        ),
        body: TabBarView(children: [
          paymentsAsync.when(
            data: (payments) {
              if (payments.isEmpty) return const Center(child: Text('Chua co phieu thu.'));
              final sorted = List<Payment>.from(payments)..sort((a, b) =>
                  (b.paymentDate ?? DateTime(0)).compareTo(a.paymentDate ?? DateTime(0)));
              return ListView.builder(
                itemCount: sorted.length,
                itemBuilder: (_, i) => _paymentTile(sorted[i]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
          expensesAsync.when(
            data: (expenses) {
              if (expenses.isEmpty) return const Center(child: Text('Chua co phieu chi.'));
              final sorted = List.from(expenses)..sort((a, b) =>
                  (b.expenseDate ?? DateTime(0)).compareTo(a.expenseDate ?? DateTime(0)));
              return ListView.builder(
                itemCount: sorted.length,
                itemBuilder: (_, i) => _expenseTile(sorted[i]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ]),
      ),
    );
  }

  Widget _paymentTile(Payment p) {
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'dd');
    final hasDebt = (p.debtAmount ?? 0) > 0;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: hasDebt ? Colors.orange.shade100 : Colors.green.shade100,
          child: Icon(hasDebt ? Icons.money_off : Icons.check, color: hasDebt ? Colors.orange : Colors.green, size: 20),
        ),
        title: Text(p.receiptNumber ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phong: ${p.roomUuid?.substring(0, 8) ?? "N/A"} | Thang: ${p.month}/${p.year}'),
            Text('Phong: ${fmt.format(p.rentAmount ?? 0)} | DT: ${fmt.format(p.electricAmount ?? 0)} | Nuoc: ${fmt.format(p.waterAmount ?? 0)}'),
            Text('Tong: ${fmt.format(p.totalAmount ?? 0)} | Da thu: ${fmt.format(p.paidAmount ?? 0)}'),
          ],
        ),
        trailing: hasDebt
            ? Text('No: ${fmt.format(p.debtAmount ?? 0)}', style: const TextStyle(color: Colors.red, fontSize: 11, fontWeight: FontWeight.bold))
            : const Icon(Icons.check_circle, color: Colors.green, size: 20),
        isThreeLine: true,
      ),
    );
  }

  Widget _expenseTile(dynamic e) {
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'dd');
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red.shade100,
          child: Icon(Icons.arrow_upward, color: Colors.red.shade400, size: 20),
        ),
        title: Text(e.expenseNumber ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Danh muc: ${e.category ?? "N/A"}'),
            Text(e.description ?? ''),
            Text('Ngay: ${_fmtDate(e.expenseDate)} | Nguoi chi: ${e.paidBy ?? "N/A"}'),
          ],
        ),
        trailing: Text(fmt.format(e.amount ?? 0), style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        isThreeLine: true,
      ),
    );
  }

  String _fmtDate(DateTime? d) {
    if (d == null) return 'N/A';
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }
}
