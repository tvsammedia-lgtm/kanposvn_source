import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/hotel_providers.dart';
import '../models/hotel_room.dart';
import '../models/hotel_checkin_checkout.dart';
import 'room_pos_screen.dart';

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
              ref.read(hotelCheckInsProvider.notifier).loadCheckIns();
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

          final floorNames = groupedRooms.keys.toList()..sort();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: floorNames.length,
            itemBuilder: (context, index) {
              final floor = floorNames[index];
              final floorRooms = groupedRooms[floor]!;
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
    final typeName = room.roomType.value?.typeName ?? 'N/A';
    return InkWell(
      onTap: () => _onRoomTap(room),
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
              typeName,
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

  void _onRoomTap(HotelRoom room) {
    if (room.status == RoomStatus.OCCUPIED) {
      final checkIn = _findActiveCheckIn(room);
      if (checkIn != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RoomPosScreen(room: room, checkIn: checkIn),
          ),
        );
        return;
      }
    }
    _showRoomActionDialog(room);
  }

  RoomCheckIn? _findActiveCheckIn(HotelRoom room) {
    if (room.activeCheckInId.isEmpty) return null;
    final async = ref.read(hotelCheckInsProvider);
    if (async is! AsyncData<List<RoomCheckIn>>) return null;
    for (final c in async.value) {
      if (c.checkInId == room.activeCheckInId && !c.isCheckedOut) return c;
    }
    return null;
  }

  void _openPos(HotelRoom room, RoomCheckIn checkIn) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RoomPosScreen(room: room, checkIn: checkIn),
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
                if (room.status == RoomStatus.OCCUPIED && room.activeCheckInId.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.point_of_sale, color: Color(0xFF0284C7)),
                    title: const Text('Mở POS (Gọi món + tính tiền)'),
                    subtitle: const Text('Chọn món ăn, đồ uống, theo dõi timer thuê phòng'),
                    onTap: () {
                      final checkIn = _findActiveCheckIn(room);
                      Navigator.pop(ctx);
                      if (checkIn != null) _openPos(room, checkIn);
                    },
                  ),
                ListTile(
                  leading: const Icon(Icons.login, color: Colors.green),
                  title: const Text('Nhận phòng (Check-in)'),
                  subtitle: const Text('Bắt đầu tính tiền theo giờ / qua đêm / ngày'),
                  onTap: () {
                    Navigator.pop(ctx);
                    _showCheckInDialog(room);
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

  void _showCheckInDialog(HotelRoom room) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final identityCtrl = TextEditingController();
    final prepaidCtrl = TextEditingController();
    var rentalType = RentalType.HOURLY;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocalState) => AlertDialog(
          title: Text('Nhận phòng ${room.roomName}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Loại phòng: ${room.roomType.value?.typeName ?? 'N/A'}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Tên khách hàng'),
                ),
                TextField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Số điện thoại'),
                ),
                TextField(
                  controller: identityCtrl,
                  decoration: const InputDecoration(labelText: 'CMND/CCCD (tuỳ chọn)'),
                ),
                TextField(
                  controller: prepaidCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(labelText: 'Tiền cọc / trả trước (đ)'),
                ),
                const SizedBox(height: 8),
                const Text('Loại thuê:', style: TextStyle(fontWeight: FontWeight.bold)),
                for (final rt in RentalType.values)
                  RadioListTile<RentalType>(
                    dense: true,
                    title: Text(rt.label),
                    value: rt,
                    groupValue: rentalType,
                    onChanged: (v) {
                      if (v != null) setLocalState(() => rentalType = v);
                    },
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                final now = DateTime.now();
                DateTime? expected;
                switch (rentalType) {
                  case RentalType.HOURLY:
                    expected = now.add(const Duration(hours: 1));
                  case RentalType.OVERNIGHT:
                    expected = DateTime(now.year, now.month, now.day).add(const Duration(days: 1, hours: 12));
                  case RentalType.DAILY:
                    expected = now.add(const Duration(days: 1));
                }
                Navigator.pop(ctx);
                final checkIn = await ref.read(hotelCheckInsProvider.notifier).createCheckIn(
                      room: room,
                      rentalType: rentalType,
                      customerName: nameCtrl.text.trim(),
                      customerPhone: phoneCtrl.text.trim(),
                      customerIdentity: identityCtrl.text.trim(),
                      prePaid: double.tryParse(prepaidCtrl.text) ?? 0,
                      expectedCheckOut: expected,
                    );
                if (mounted) _openPos(room, checkIn);
              },
              child: const Text('NHẬN PHÒNG & MỞ POS',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
