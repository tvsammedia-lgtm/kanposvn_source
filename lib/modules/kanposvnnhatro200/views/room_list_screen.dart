import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nhatro_providers.dart';

class RoomListScreen extends ConsumerWidget {
  const RoomListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomsAsyncValue = ref.watch(roomsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Phòng'),
      ),
      body: roomsAsyncValue.when(
        data: (rooms) {
          if (rooms.isEmpty) {
            return const Center(child: Text('Chưa có dữ liệu.'));
          }
          return ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              final room = rooms[index];
              return ListTile(
                title: Text(room.roomName ?? 'Phòng không tên'),
                subtitle: Text('Giá: ${room.rentPrice ?? 0} - Trạng thái: ${room.status.name}'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to details
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
          // Add new room
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
