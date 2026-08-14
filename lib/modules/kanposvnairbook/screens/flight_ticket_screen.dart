import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/booking.dart';
import '../models/flight_offer.dart';

class FlightTicketScreen extends StatelessWidget {
  final BookingLocal booking;
  final FlightOffer flight;
  
  const FlightTicketScreen({super.key, required this.booking, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vé Điện Tử (E-Ticket)'), backgroundColor: Colors.green.shade700),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header vé
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(flight.airline ?? 'KanAir', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(flight.flightNumber ?? '', style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
                
                // PNR Code
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      const Text('MÃ ĐẶT CHỖ (PNR)', style: TextStyle(color: Colors.grey)),
                      Text(booking.pnrCode ?? 'UNKNOWN', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2)),
                    ],
                  ),
                ),
                
                // Lịch trình
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(flight.origin ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(DateFormat('HH:mm').format(flight.departureTime!)),
                        ],
                      ),
                      const Icon(Icons.flight_takeoff, color: Colors.blue),
                      Column(
                        children: [
                          Text(flight.destination ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(DateFormat('HH:mm').format(flight.arrivalTime!)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text('Ngày bay: ${DateFormat('dd/MM/yyyy').format(flight.departureTime!)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(thickness: 2, indent: 24, endIndent: 24),
                ),
                
                // Hành khách
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(booking.passengerName ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Fake Barcode/QR
                Container(
                  height: 80,
                  width: 250,
                  color: Colors.black12,
                  child: const Center(child: Text('|||||||||||||||||||||||||||||', style: TextStyle(fontSize: 24, letterSpacing: 2))),
                ),
                const SizedBox(height: 24),
                
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
                  child: const Text('TRỞ VỀ TRANG CHỦ', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
