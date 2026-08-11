import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/hotel_checkin_checkout.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_billing_service.dart';
import 'room_pos_screen.dart';

class CheckinCheckoutScreen extends ConsumerWidget {
  const CheckinCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(hotelClockProvider);
    final checkInsAsync = ref.watch(hotelCheckInsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check-in / Check-out'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(hotelCheckInsProvider.notifier).loadCheckIns();
              ref.read(hotelRoomsProvider.notifier).loadRooms();
            },
          ),
        ],
      ),
      body: checkInsAsync.when(
        data: (checkIns) {
          final active = checkIns.where((c) => !c.isCheckedOut).toList();
          if (active.isEmpty) {
            return const Center(child: Text('Không có khách đang ở. Hãy nhận phòng từ Sơ đồ phòng.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: active.length,
            itemBuilder: (context, index) {
              final c = active[index];
              return _CheckInCard(checkIn: c, now: now);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}

class _CheckInCard extends ConsumerWidget {
  final RoomCheckIn checkIn;
  final DateTime now;
  const _CheckInCard({required this.checkIn, required this.now});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = checkIn.room.value;
    final roomType = room?.roomType.value;
    final checkInTime = checkIn.actualCheckIn ?? checkIn.createdAt;
    final elapsed = HotelBillingCalculator.formatElapsed(checkInTime, now);
    final roomCharge = roomType != null
        ? HotelBillingCalculator.computeRoomCharge(
            roomType: roomType,
            rentalType: checkIn.rentalType,
            checkIn: checkInTime,
            now: now,
          )
        : 0.0;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0284C7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(room?.roomName ?? '?',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    const SizedBox(width: 8),
                    Text(checkIn.rentalType.label,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    elapsed,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Khách: ${checkIn.customerName.isEmpty ? 'Khách vãng lai' : checkIn.customerName}'),
            Text('SĐT: ${checkIn.customerPhone.isEmpty ? '—' : checkIn.customerPhone}'),
            Text('Giờ vào: ${_fmt(checkInTime)}'),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tiền phòng hiện tại:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${roomCharge.toStringAsFixed(0)} đ',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.point_of_sale),
                  label: const Text('POS'),
                  onPressed: () {
                    if (room != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RoomPosScreen(room: room, checkIn: checkIn)),
                      );
                    }
                  },
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text('CHECK-OUT', style: TextStyle(color: Colors.white)),
                  onPressed: () => _confirmCheckout(context, ref, roomCharge),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmCheckout(BuildContext context, WidgetRef ref, double roomCharge) async {
    final controller = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận Check-out'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phòng ${checkIn.room.value?.roomName ?? ''} - ${checkIn.rentalType.label}'),
            const SizedBox(height: 8),
            Text('Tiền phòng: ${roomCharge.toStringAsFixed(0)} đ'),
            Text('Đã cọc: ${checkIn.prePaid.toStringAsFixed(0)} đ'),
            const Divider(),
            const Text('Giảm giá (đ):'),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('HỦY')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('XÁC NHẬN')),
        ],
      ),
    );
    if (confirmed != true) return;

    final discount = double.tryParse(controller.text) ?? 0;
    await ref.read(hotelCheckInsProvider.notifier).checkout(
          checkIn,
          roomTotalCharge: roomCharge,
          discount: discount,
        );
    ref.read(hotelRoomsProvider.notifier).loadRooms();
  }

  String _fmt(DateTime t) =>
      '${t.day.toString().padLeft(2, '0')}/${t.month.toString().padLeft(2, '0')}/${t.year} '
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
}
