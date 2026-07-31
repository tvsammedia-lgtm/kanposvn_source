import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/hotel_providers.dart';
import '../models/hotel_room.dart';

class RoomsScreen extends ConsumerStatefulWidget {
  const RoomsScreen({super.key});

  @override
  ConsumerState<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends ConsumerState<RoomsScreen> {
  @override
  Widget build(BuildContext context) {
    final roomsAsyncValue = ref.watch(hotelRoomsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sơ đồ phòng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(hotelRoomsProvider.notifier).loadRooms();
            },
          )
        ],
      ),
      body: roomsAsyncValue.when(
        data: (rooms) {
          if (rooms.isEmpty) {
            return const Center(child: Text('Chưa có phòng nào. Hãy kiểm tra dữ liệu mẫu (Seed Data).'));
          }
          
          // Group rooms by floorName
          final Map<String, List<HotelRoom>> groupedRooms = {};
          for (var r in rooms) {
            final floorName = r.floor.value?.floorName ?? 'Khác';
            if (!groupedRooms.containsKey(floorName)) {
              groupedRooms[floorName] = [];
            }
            groupedRooms[floorName]!.add(r);
          }
          
          // Sort floor names if needed
          final floorNames = groupedRooms.keys.toList()..sort();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: floorNames.length,
            itemBuilder: (context, index) {
              final floor = floorNames[index];
              final floorRooms = groupedRooms[floor]!;
              
              // sort rooms by name
              floorRooms.sort((a, b) => a.roomName.compareTo(b.roomName));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      floor,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                      childAspectRatio: 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: floorRooms.length,
                    itemBuilder: (context, rIndex) {
                      final room = floorRooms[rIndex];
                      return _buildRoomCard(room);
                    },
                  ),
                ],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Widget _buildRoomCard(HotelRoom room) {
    return InkWell(
      onTap: () => _showRoomActionDialog(room),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Color(room.status.colorValue),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              room.roomName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              room.roomType.value?.typeName ?? 'N/A',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                room.status.label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showRoomActionDialog(HotelRoom room) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Phòng ${room.roomName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Trạng thái hiện tại: ${room.status.label}'),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.login, color: Colors.green),
                  title: const Text('Nhận phòng (Check-in)'),
                  onTap: () {
                    Navigator.pop(ctx);
                    ref.read(hotelRoomsProvider.notifier).updateRoomStatus(room.id, RoomStatus.OCCUPIED);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book_online, color: Colors.orange),
                  title: const Text('Đặt trước'),
                  onTap: () {
                    Navigator.pop(ctx);
                    ref.read(hotelRoomsProvider.notifier).updateRoomStatus(room.id, RoomStatus.RESERVED);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.cleaning_services, color: Colors.blue),
                  title: const Text('Dọn phòng'),
                  onTap: () {
                    Navigator.pop(ctx);
                    ref.read(hotelRoomsProvider.notifier).updateRoomStatus(room.id, RoomStatus.CLEANING);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.check_circle_outline, color: Colors.teal),
                  title: const Text('Phòng trống (Sẵn sàng)'),
                  onTap: () {
                    Navigator.pop(ctx);
                    ref.read(hotelRoomsProvider.notifier).updateRoomStatus(room.id, RoomStatus.AVAILABLE);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.build, color: Colors.grey),
                  title: const Text('Bảo trì'),
                  onTap: () {
                    Navigator.pop(ctx);
                    ref.read(hotelRoomsProvider.notifier).updateRoomStatus(room.id, RoomStatus.MAINTENANCE);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
