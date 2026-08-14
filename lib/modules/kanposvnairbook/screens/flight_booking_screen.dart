import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/flight_offer.dart';
import '../providers/airbook_booking_provider.dart';
import 'flight_ticket_screen.dart';

class FlightBookingScreen extends ConsumerStatefulWidget {
  final FlightOffer flight;
  const FlightBookingScreen({super.key, required this.flight});

  @override
  ConsumerState<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends ConsumerState<FlightBookingScreen> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  void _payAndBook() async {
    if (_nameCtrl.text.isEmpty || _phoneCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập tên và số điện thoại')));
      return;
    }

    final bookingState = ref.read(airbookBookingProvider.notifier);
    final booking = await bookingState.createBookingAndPay(widget.flight, _nameCtrl.text, _phoneCtrl.text);

    if (booking != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thanh toán thành công! Đã xuất vé.')));
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => FlightTicketScreen(booking: booking, flight: widget.flight)),
        );
      }
    } else {
      final err = ref.read(airbookBookingProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err?.toString() ?? 'Lỗi thanh toán')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(airbookBookingProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Điền thông tin hành khách'), backgroundColor: Colors.blue.shade800),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin chuyến bay
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chuyến bay ${widget.flight.flightNumber}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 8),
                    Text('${widget.flight.origin} ✈ ${widget.flight.destination}'),
                    Text('Khởi hành: ${DateFormat('dd/MM/yyyy HH:mm').format(widget.flight.departureTime!)}'),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tổng thanh toán:'),
                        Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(widget.flight.totalFare),
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Thông tin hành khách
            const Text('THÔNG TIN LIÊN HỆ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameCtrl,
                      decoration: const InputDecoration(labelText: 'Họ và tên hành khách', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: 'Số điện thoại', border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : _payAndBook,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('THANH TOÁN & ĐẶT VÉ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
