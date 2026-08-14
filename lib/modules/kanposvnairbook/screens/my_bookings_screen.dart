import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/airbook_booking_provider.dart';
import '../providers/airbook_sync_provider.dart';
import '../models/booking.dart';
import 'flight_checkin_screen.dart';
import 'flight_reschedule_screen.dart';
import 'commission_report_screen.dart';

class MyBookingsScreen extends ConsumerWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsState = ref.watch(myBookingsProvider);
    final isSyncing = ref.watch(airbookSyncProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vé Của Tôi'), 
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CommissionReportScreen())),
          ),
          isSyncing 
            ? const Padding(padding: EdgeInsets.all(16), child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)))
            : IconButton(
                icon: const Icon(Icons.cloud_sync),
                onPressed: () async {
                  await ref.read(airbookSyncProvider.notifier).syncNow();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đồng bộ hoàn tất!')));
                },
              )
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: bookingsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
        data: (bookings) {
          if (bookings.isEmpty) {
            return const Center(child: Text('Bạn chưa đặt vé nào.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final b = bookings[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.flight_takeoff, color: Colors.blue, size: 36),
                  title: Text('Mã PNR: ${b.pnrCode}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('Hành khách: ${b.passengerName}'),
                      Text('Ngày đặt: ${DateFormat('dd/MM/yyyy HH:mm').format(b.createdAt!)}'),
                      if (b.isCheckedIn) Text('Ghế: ${b.seatNumber}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (!b.isCheckedIn)
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => FlightCheckinScreen(pnr: b.pnrCode!)));
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              child: const Text('Check-in', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                          const SizedBox(width: 8),
                          if (!b.isCheckedIn)
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => FlightRescheduleScreen(pnr: b.pnrCode!, origin: 'HAN', dest: 'SGN')));
                              },
                              child: const Text('Đổi lịch', style: TextStyle(fontSize: 12)),
                            )
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Xem chi tiết vé ${b.pnrCode}')));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
