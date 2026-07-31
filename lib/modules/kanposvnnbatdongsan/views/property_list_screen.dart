import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/batdongsan_providers.dart';
import 'property_form_screen.dart';

class PropertyListScreen extends ConsumerWidget {
  const PropertyListScreen({super.key});

  void _deleteProperty(BuildContext context, WidgetRef ref, int id) async {
    final repo = ref.read(propertyRepositoryProvider);
    await repo.deleteProperty(id);
    ref.invalidate(propertiesProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã xoá')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsyncValue = ref.watch(propertiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Bất động sản'),
      ),
      body: propertiesAsyncValue.when(
        data: (properties) {
          if (properties.isEmpty) {
            return const Center(child: Text('Chưa có dữ liệu.'));
          }
          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final property = properties[index];
              return ListTile(
                title: Text(property.title ?? 'Không có tiêu đề'),
                subtitle: Text('${property.price ?? 0} tỷ - ${property.province ?? ''}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Xác nhận xoá'),
                        content: const Text('Bạn có chắc chắn muốn xoá BĐS này?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _deleteProperty(context, ref, property.id);
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
                    MaterialPageRoute(builder: (context) => PropertyFormScreen(property: property)),
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
            MaterialPageRoute(builder: (context) => const PropertyFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
