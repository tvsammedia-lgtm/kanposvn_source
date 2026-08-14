import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/flight_provider.dart';
import 'flight_booking_screen.dart';

class FlightListScreen extends ConsumerWidget {
  const FlightListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(flightSearchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Kết quả tìm kiếm')),
      backgroundColor: Colors.grey.shade200,
      body: searchState.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Đang tìm chuyến bay tốt nhất...'),
            ],
          ),
        ),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
        data: (flights) {
          if (flights.isEmpty) return const Center(child: Text('Không tìm thấy chuyến bay nào phù hợp.'));

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: flights.length,
            itemBuilder: (context, index) {
              final flight = flights[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.flight, color: _getAirlineColor(flight.airline)),
                              const SizedBox(width: 8),
                              Text(flight.airline ?? '', style: TextStyle(fontWeight: FontWeight.bold, color: _getAirlineColor(flight.airline))),
                              const SizedBox(width: 8),
                              Text(flight.flightNumber ?? '', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(4)),
                            child: const Text('Phổ thông', style: TextStyle(color: Colors.green, fontSize: 10)),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat('HH:mm').format(flight.departureTime!), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(flight.origin ?? '', style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('${flight.durationMinutes}m', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              Container(height: 2, width: 50, color: Colors.grey.shade400),
                              const Text('Bay thẳng', style: TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(DateFormat('HH:mm').format(flight.arrivalTime!), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(flight.destination ?? '', style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Tổng giá vé (đã gồm thuế phí)', style: TextStyle(fontSize: 12)),
                              Text(NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(flight.totalFare), style: const TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => FlightBookingScreen(flight: flight)));
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                            child: const Text('CHỌN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _getAirlineColor(String? airline) {
    if (airline == 'Vietjet Air') return Colors.red;
    if (airline == 'Vietnam Airlines') return Colors.blue.shade700;
    if (airline == 'Bamboo Airways') return Colors.green.shade800;
    return Colors.black;
  }
}
