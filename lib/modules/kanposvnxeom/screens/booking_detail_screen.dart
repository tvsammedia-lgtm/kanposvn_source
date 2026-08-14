import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/booking.dart';
import '../providers/booking_provider.dart';
import 'payment_screen.dart';

class BookingDetailScreen extends ConsumerStatefulWidget {
  final XeOmBooking booking;
  const BookingDetailScreen({super.key, required this.booking});

  @override
  ConsumerState<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends ConsumerState<BookingDetailScreen> {
  void _updateStatus(BookingStatus newStatus) async {
    await ref.read(xeOmBookingProvider.notifier).updateBookingStatus(widget.booking.uuid!, newStatus);
    
    if (newStatus == BookingStatus.completed && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PaymentScreen(booking: widget.booking)),
      );
    } else if (mounted) {
      Navigator.pop(context); // Trở về danh sách (trong thực tế có thể update UI realtime)
    }
  }

  @override
  Widget build(BuildContext context) {
    // Đọc trạng thái từ Provider (nếu muốn realtime thì dùng ref.watch, ở đây tĩnh)
    final b = widget.booking;

    Widget actionButton;
    switch (b.status) {
      case BookingStatus.driverAccepted:
      case BookingStatus.searchingDriver:
        actionButton = ElevatedButton.icon(
          onPressed: () => _updateStatus(BookingStatus.driverArriving),
          icon: const Icon(Icons.directions_run),
          label: const Text('ĐANG ĐẾN ĐÓN KHÁCH'),
        );
        break;
      case BookingStatus.driverArriving:
        actionButton = ElevatedButton.icon(
          onPressed: () => _updateStatus(BookingStatus.pickedUp),
          icon: const Icon(Icons.emoji_people),
          label: const Text('ĐÃ ĐÓN KHÁCH'),
        );
        break;
      case BookingStatus.pickedUp:
        actionButton = ElevatedButton.icon(
          onPressed: () => _updateStatus(BookingStatus.inProgress),
          icon: const Icon(Icons.speed),
          label: const Text('BẮT ĐẦU CHUYẾN ĐI'),
        );
        break;
      case BookingStatus.inProgress:
        actionButton = ElevatedButton.icon(
          onPressed: () => _updateStatus(BookingStatus.completed),
          icon: const Icon(Icons.check_circle),
          label: const Text('HOÀN THÀNH & THANH TOÁN'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
        );
        break;
      default:
        actionButton = const Text('Cuốc xe đã kết thúc', style: TextStyle(fontSize: 16, color: Colors.grey));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Cuốc: ${b.bookingCode}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Khách: ${b.customerName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('SĐT: ${b.customerPhone}'),
                    const Divider(),
                    Text('Đón: ${b.pickupAddress}', style: const TextStyle(color: Colors.blue)),
                    const SizedBox(height: 8),
                    Text('Đến: ${b.dropoffAddress}', style: const TextStyle(color: Colors.red)),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Cước phí dự kiến:', style: TextStyle(fontSize: 16)),
                        Text('${b.price ?? 0} đ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('Trạng thái hiện tại: ${b.status.name.toUpperCase()}'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              child: actionButton,
            ),
          ],
        ),
      ),
    );
  }
}
