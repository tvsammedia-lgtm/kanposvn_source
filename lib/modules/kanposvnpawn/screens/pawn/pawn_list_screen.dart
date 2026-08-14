import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pawn_provider.dart';
import 'pawn_create_screen.dart';

class PawnListScreen extends ConsumerWidget {
  const PawnListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pawnState = ref.watch(pawnProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Cầm Đồ'),
      ),
      body: pawnState.when(
        data: (contracts) {
          if (contracts.isEmpty) {
            return const Center(child: Text('Chưa có hợp đồng cầm đồ nào.'));
          }
          return ListView.builder(
            itemCount: contracts.length,
            itemBuilder: (context, index) {
              final contract = contracts[index];
              return ListTile(
                title: Text('Hợp đồng: ${contract.contractNumber ?? "Không tên"}'),
                subtitle: Text('Số tiền: ${contract.pawnAmount} - Khách: ${contract.customer.value?.fullName ?? ""}'),
                trailing: Chip(label: Text(contract.status.name)),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const PawnCreateScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
