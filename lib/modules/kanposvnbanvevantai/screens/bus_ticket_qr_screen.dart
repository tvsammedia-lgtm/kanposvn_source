import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/bus_ticket.dart';
import 'bus_scanner_screen.dart'; // Để demo chuyển qua màn scan

class BusTicketQrScreen extends StatelessWidget {
  final BusTicketLocal ticket;

  const BusTicketQrScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vé Điện Tử'), 
        backgroundColor: Colors.indigo,
        actions: [
          // Nút giả lập để sang màn hình Máy Quét (Dành cho Lơ xe test)
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BusScannerScreen())),
            tooltip: 'Mở máy quét vé',
          )
        ],
      ),
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('KANPOS EXPRESS', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo)),
              const Divider(thickness: 2),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Mã vé:', style: TextStyle(color: Colors.grey)),
                  Text(ticket.ticketCode ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ghế:', style: TextStyle(color: Colors.grey)),
                  Text(ticket.selectedSeats?.join(', ') ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tổng tiền:', style: TextStyle(color: Colors.grey)),
                  Text(NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(ticket.totalPrice), style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 32),
              
              // Mã QR giả lập bằng UI thay vì dùng package QR
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Mẫu pattern giả
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
                      itemCount: 64,
                      itemBuilder: (context, index) {
                        // random đen trắng tạo cảm giác QR
                        return Container(color: (index % 2 == 0 || index % 3 == 0) ? Colors.black : Colors.white);
                      },
                    ),
                    // Logo giữa QR
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(4),
                      child: const Icon(Icons.directions_bus, color: Colors.indigo, size: 30),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('Đưa mã này cho Lơ xe khi lên xe', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
    );
  }
}
