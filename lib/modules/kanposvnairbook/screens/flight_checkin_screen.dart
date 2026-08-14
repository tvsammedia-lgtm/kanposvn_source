import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/airbook_booking_provider.dart';

class FlightCheckinScreen extends ConsumerStatefulWidget {
  final String pnr;
  const FlightCheckinScreen({super.key, required this.pnr});

  @override
  ConsumerState<FlightCheckinScreen> createState() => _FlightCheckinScreenState();
}

class _FlightCheckinScreenState extends ConsumerState<FlightCheckinScreen> {
  String? _selectedSeat;

  void _confirmCheckIn() async {
    if (_selectedSeat == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng chọn 1 ghế')));
      return;
    }

    final success = await ref.read(airbookBookingProvider.notifier).checkIn(widget.pnr, _selectedSeat!);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check-in thành công ghế $_selectedSeat')));
      Navigator.pop(context); // Quay lại trang vé
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lỗi hệ thống khi check-in')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(airbookBookingProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text('Check-in PNR: ${widget.pnr}'), backgroundColor: Colors.blue.shade800),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _LegendItem(color: Colors.white, text: 'Ghế trống'),
                _LegendItem(color: Colors.green, text: 'Đang chọn'),
                _LegendItem(color: Colors.grey, text: 'Đã có người'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              itemCount: 20, // 20 hàng ghế
              itemBuilder: (context, rowIndex) {
                final rowNum = rowIndex + 1;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSeat('$rowNum', 'A'),
                      _buildSeat('$rowNum', 'B'),
                      _buildSeat('$rowNum', 'C'),
                      SizedBox(width: 30, child: Center(child: Text('$rowNum', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)))),
                      _buildSeat('$rowNum', 'D'),
                      _buildSeat('$rowNum', 'E'),
                      _buildSeat('$rowNum', 'F'),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedSeat != null ? 'Ghế đã chọn: $_selectedSeat' : 'Chưa chọn ghế', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: (_selectedSeat != null && !isLoading) ? _confirmCheckIn : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: isLoading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text('XÁC NHẬN CHỖ NGỒI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSeat(String row, String letter) {
    final seat = '$row$letter';
    // Giả lập: Các ghế số chẵn chữ A, C đã bị đặt
    final isOccupied = (int.parse(row) % 2 == 0) && (letter == 'A' || letter == 'C');
    final isSelected = _selectedSeat == seat;

    return GestureDetector(
      onTap: () {
        if (!isOccupied) {
          setState(() {
            _selectedSeat = isSelected ? null : seat;
          });
        }
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: isOccupied ? Colors.grey.shade400 : (isSelected ? Colors.green : Colors.white),
          border: Border.all(color: isOccupied ? Colors.grey.shade400 : Colors.blue.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              color: isOccupied ? Colors.white : (isSelected ? Colors.white : Colors.blue.shade800),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 16, height: 16, decoration: BoxDecoration(color: color, border: Border.all(color: Colors.grey))),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
