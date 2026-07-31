import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/batdongsan_providers.dart';
import 'broker_form_screen.dart';

class BrokerListScreen extends ConsumerWidget {
  const BrokerListScreen({super.key});

  void _deleteBroker(BuildContext context, WidgetRef ref, int id) async {
    final repo = ref.read(brokerRepositoryProvider);
    await repo.deleteBroker(id);
    ref.invalidate(brokersProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã xoá Môi giới')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(brokersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Môi giới'),
      ),
      body: asyncValue.when(
        data: (brokers) {
          if (brokers.isEmpty) {
            return const Center(child: Text('Chưa có dữ liệu.'));
          }
          return ListView.builder(
            itemCount: brokers.length,
            itemBuilder: (context, index) {
              final broker = brokers[index];
              return ListTile(
                title: Text(broker.fullName ?? 'Không có tên'),
                subtitle: Text('${broker.phone ?? ''} - ${broker.branch ?? ''}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Xác nhận xoá'),
                        content: const Text('Bạn có chắc chắn muốn xoá?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _deleteBroker(context, ref, broker.id);
                            },
                            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BrokerFormScreen(broker: broker)),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BrokerFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
