import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/bus_ticket_provider.dart';
import 'bus_ticket_qr_screen.dart';

class BusSeatSelectionScreen extends ConsumerWidget {
  const BusSeatSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketState = ref.watch(busTicketProvider);
    final notifier = ref.read(busTicketProvider.notifier);

    // Tính tiền
    final totalPrice = ticketState.selectedSeats.length * 150000.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Chọn Ghế Ngồi'), backgroundColor: Colors.indigo),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          // Header chú thích
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegend(Colors.white, 'Ghế trống', true),
                _buildLegend(Colors.indigo, 'Đang chọn', false),
                _buildLegend(Colors.grey, 'Đã đặt', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Sơ đồ xe
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
              child: Column(
                children: [
                  const Icon(Icons.drive_eta, size: 40, color: Colors.grey),
                  const Divider(thickness: 2),
                  const SizedBox(height: 16),
                  
                  // Lưới ghế
                  Expanded(
                    child: GridView.builder(
                      itemCount: 25, // 5 hàng, 5 cột (bao gồm lối đi)
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        // Tính toán tọa độ lưới
                        int row = index ~/ 5; // Hàng 0, 1, 2, 3, 4
                        int col = index % 5;  // Cột 0, 1, 2, 3, 4

                        // Cột 2 (chính giữa) là lối đi trừ hàng cuối cùng
                        if (col == 2 && row < 4) {
                          return const SizedBox(); // Lối đi
                        }

                        // Mã ghế: VD A1, B1...
                        // Cột 0, 1 -> Dãy A. Cột 3, 4 -> Dãy B
                        String colName = (col < 2) ? 'A' : 'B';
                        if (row == 4) colName = 'C'; // Hàng cuối
                        
                        String seatId = '$colName${row + 1}${col + 1}';

                        bool isSelected = ticketState.selectedSeats.contains(seatId);
                        bool isBooked = ticketState.bookedSeats.contains(seatId);

                        return GestureDetector(
                          onTap: () => notifier.toggleSeat(seatId),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isBooked ? Colors.grey.shade400 : (isSelected ? Colors.indigo : Colors.white),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: isBooked ? Colors.grey : Colors.indigo),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              seatId,
                              style: TextStyle(
                                color: isBooked ? Colors.white : (isSelected ? Colors.white : Colors.indigo),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Bar Mua vé
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Đã chọn: ${ticketState.selectedSeats.length} ghế', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(totalPrice),
                      style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: ticketState.selectedSeats.isEmpty ? null : () async {
                    final ticket = await notifier.buyTicket();
                    if (ticket != null) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BusTicketQrScreen(ticket: ticket)));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12)
                  ),
                  child: const Text('THANH TOÁN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String text, bool hasBorder) {
    return Row(
      children: [
        Container(
          width: 20, height: 20,
          decoration: BoxDecoration(
            color: color,
            border: hasBorder ? Border.all(color: Colors.indigo) : null,
            borderRadius: BorderRadius.circular(4)
          ),
        ),
        const SizedBox(width: 8),
        Text(text)
      ],
    );
  }
}
