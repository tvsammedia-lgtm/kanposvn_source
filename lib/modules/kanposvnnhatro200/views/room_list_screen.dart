import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/nhatro_providers.dart';
import '../models/room.dart';

class RoomListScreen extends ConsumerStatefulWidget {
  const RoomListScreen({super.key});

  @override
  ConsumerState<RoomListScreen> createState() => _RoomListScreenState();
}

class _RoomListScreenState extends ConsumerState<RoomListScreen> {
  String _filter = 'ALL';
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final roomsAsync = ref.watch(roomsProvider);
    final fmt = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      appBar: AppBar(title: const Text('Danh Sách Phòng')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Tìm phòng...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              isDense: true,
            ),
            onChanged: (v) => setState(() => _search = v.toLowerCase()),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            _chip('Tất cả', 'ALL'),
            _chip('Đang thuê', 'rented'),
            _chip('Trống', 'empty'),
            _chip('Sửa chữa', 'repairing'),
            _chip('Giữ chỗ', 'reserved'),
          ]),
        ),
        Expanded(
          child: roomsAsync.when(
            data: (rooms) {
              var filtered = rooms;
              if (_filter != 'ALL') {
                filtered = rooms.where((r) => r.status.name == _filter).toList();
              }
              if (_search.isNotEmpty) {
                filtered = filtered.where((r) =>
                  (r.roomCode ?? '').toLowerCase().contains(_search) ||
                  (r.roomName ?? '').toLowerCase().contains(_search) ||
                  (r.block ?? '').toLowerCase().contains(_search)
                ).toList();
              }
              if (filtered.isEmpty) return const Center(child: Text('Không tìm thấy phòng.'));
              return ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_, i) => _roomTile(filtered[i], fmt),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Lỗi: $e')),
          ),
        ),
      ]),
    );
  }

  Widget _chip(String label, String value) {
    final selected = _filter == value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => setState(() => _filter = value),
      ),
    );
  }

  Color _statusColor(RoomStatus s) {
    switch (s) {
      case RoomStatus.rented: return Colors.green;
      case RoomStatus.empty: return Colors.orange;
      case RoomStatus.repairing: return Colors.red;
      case RoomStatus.reserved: return Colors.purple;
    }
  }

  Widget _roomTile(Room room, NumberFormat fmt) {
    final statusColor = _statusColor(room.status);
    String statusText;
    switch (room.status) {
      case RoomStatus.rented:
        statusText = 'Đang thuê';
        break;
      case RoomStatus.empty:
        statusText = 'Trống';
        break;
      case RoomStatus.repairing:
        statusText = 'Sửa chữa';
        break;
      case RoomStatus.reserved:
        statusText = 'Giữ chỗ';
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.15),
          child: Text(room.floor?.toString() ?? '?', style: TextStyle(color: statusColor)),
        ),
        title: Text('${room.roomCode} - ${room.roomName}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${room.block} | ${(room.areaSize ?? 0).toStringAsFixed(0)}m² | ${fmt.format(room.rentPrice ?? 0)}/tháng'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: statusColor.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
          child: Text(statusText, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
