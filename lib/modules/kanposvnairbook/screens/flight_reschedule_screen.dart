import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/airbook_booking_provider.dart';
import '../providers/flight_provider.dart';

class FlightRescheduleScreen extends ConsumerStatefulWidget {
  final String pnr;
  final String origin;
  final String dest;
  const FlightRescheduleScreen({super.key, required this.pnr, required this.origin, required this.dest});

  @override
  ConsumerState<FlightRescheduleScreen> createState() => _FlightRescheduleScreenState();
}

class _FlightRescheduleScreenState extends ConsumerState<FlightRescheduleScreen> {
  DateTime _newDate = DateTime.now().add(const Duration(days: 2));

  void _searchNewFlights() {
    ref.read(flightSearchProvider.notifier).searchFlights(widget.origin, widget.dest, _newDate);
  }

  void _confirmReschedule(flight) async {
    // Hiển thị dialog xác nhận phí
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận đổi lịch bay'),
        content: Text('Phí đổi vé cố định là 500,000đ. \nSố tiền này sẽ được trừ vào Ví ảo của bạn.\nBạn có chắc chắn muốn đổi sang chuyến bay ${flight.flightNumber} không?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Đồng ý')),
        ],
      )
    );

    if (confirm == true) {
      final success = await ref.read(airbookBookingProvider.notifier).rescheduleFlight(widget.pnr, flight);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đổi vé thành công! Đã trừ 500k từ Ví.')));
        Navigator.pop(context); // Trở về
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lỗi: Số dư ví không đủ hoặc lỗi hệ thống.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(flightSearchProvider);
    final isRescheduling = ref.watch(airbookBookingProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text('Đổi lịch bay PNR: ${widget.pnr}')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Row(
              children: [
                const Text('Chọn ngày mới: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton.icon(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _newDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) {
                      setState(() => _newDate = picked);
                      _searchNewFlights();
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: Text('${_newDate.day}/${_newDate.month}/${_newDate.year}'),
                ),
                const Spacer(),
                ElevatedButton(onPressed: _searchNewFlights, child: const Text('Tìm'))
              ],
            ),
          ),
          Expanded(
            child: isRescheduling 
              ? const Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Đang xử lý đổi vé và trừ tiền...')
                  ],
                ))
              : searchState.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Lỗi: $e')),
                  data: (flights) {
                    if (flights.isEmpty) return const Center(child: Text('Hãy bấm Tìm để xem chuyến bay ngày mới.'));
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: flights.length,
                      itemBuilder: (context, index) {
                        final flight = flights[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.flight, color: Colors.blue),
                            title: Text('${flight.airline} - ${flight.flightNumber}'),
                            subtitle: Text('Khởi hành: ${flight.departureTime!.hour}:${flight.departureTime!.minute}'),
                            trailing: ElevatedButton(
                              onPressed: () => _confirmReschedule(flight),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                              child: const Text('ĐỔI SANG CHUYẾN NÀY', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                          ),
                        );
                      }
                    );
                  }
                )
          )
        ],
      ),
    );
  }
}
