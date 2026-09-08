import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nongsan_providers.dart';
import 'package:intl/intl.dart';
import 'weighing_ticket_form.dart';

class PurchasingScreen extends ConsumerWidget {
  const PurchasingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsync = ref.watch(nongsanWeighingTicketsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thu Mua Nông Sản'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (ctx) => const WeighingTicketForm(),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Phiếu Cân Mới'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ticketsAsync.when(
        data: (tickets) {
          if (tickets.isEmpty) {
            return const Center(child: Text('Chưa có phiếu cân nào.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.local_shipping),
                  ),
                  title: Text('Mã phiếu: ${ticket.ticketNumber}'),
                  subtitle: Text(
                      'Xe: ${ticket.vehiclePlate} - Tài xế: ${ticket.driverName}\n'
                      'Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(ticket.updatedAt)}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('TL Hàng: ${ticket.netWeight.toStringAsFixed(1)} kg',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('Vào: ${ticket.grossWeight} | Ra: ${ticket.tareWeight}'),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () {
                    // TODO: Mở chi tiết phiếu cân
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
