import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/wallet_provider.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txState = ref.watch(walletProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Ví nội bộ KanRide')),
      body: Column(
        children: [
          // Số dư
          Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            color: Colors.blue.shade800,
            child: FutureBuilder<double>(
              future: ref.read(walletProvider.notifier).getBalance(),
              builder: (context, snapshot) {
                final balance = snapshot.data ?? 0.0;
                return Column(
                  children: [
                    const Text('Số dư hiện tại', style: TextStyle(color: Colors.white70, fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('${balance.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Nạp 100k
                        ref.read(walletProvider.notifier).topUp(100000);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('NẠP 100.000đ'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                    )
                  ],
                );
              },
            ),
          ),
          
          // Lịch sử giao dịch
          Expanded(
            child: txState.when(
              data: (txs) {
                if (txs.isEmpty) return const Center(child: Text('Chưa có giao dịch nào'));
                return ListView.builder(
                  itemCount: txs.length,
                  itemBuilder: (context, index) {
                    final tx = txs[index];
                    final isPositive = tx.amount > 0;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isPositive ? Colors.green.shade100 : Colors.red.shade100,
                        child: Icon(isPositive ? Icons.arrow_downward : Icons.arrow_upward, color: isPositive ? Colors.green : Colors.red),
                      ),
                      title: Text(tx.description ?? ''),
                      subtitle: Text(tx.createdAt != null ? '${tx.createdAt!.hour}:${tx.createdAt!.minute} - ${tx.createdAt!.day}/${tx.createdAt!.month}' : ''),
                      trailing: Text(
                        '${isPositive ? '+' : ''}${tx.amount.toStringAsFixed(0)}đ', 
                        style: TextStyle(color: isPositive ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 16)
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Lỗi: $e')),
            ),
          )
        ],
      ),
    );
  }
}
