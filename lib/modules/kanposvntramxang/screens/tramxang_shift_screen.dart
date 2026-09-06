import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tramxang_providers.dart';
import '../models/sale.dart';

class TramXangShiftScreen extends ConsumerStatefulWidget {
  const TramXangShiftScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TramXangShiftScreen> createState() => _TramXangShiftScreenState();
}

class _TramXangShiftScreenState extends ConsumerState<TramXangShiftScreen> {
  final TextEditingController _actualCashController = TextEditingController();

  @override
  void dispose() {
    _actualCashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeShift = ref.watch(tramXangActiveShiftProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản Lý Ca Bán Hàng'),
      ),
      body: activeShift == null ? _buildOpenShiftView() : _buildActiveShiftView(activeShift),
    );
  }

  Widget _buildOpenShiftView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock_clock, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text('Hiện không có ca bán hàng nào đang mở.', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text('MỞ CA LÀM VIỆC MỚI'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () {
              final newShift = TramXangShift()
                ..stationId = 'STATION_1' // Should get from current context
                ..employeeId = 'EMP_1'
                ..openedAt = DateTime.now()
                ..openingCash = 0 // Tồn quỹ đầu ca
                ..status = 'OPEN';
              
              ref.read(tramXangActiveShiftProvider.notifier).openShift(newShift);
            },
          )
        ],
      ),
    );
  }

  Widget _buildActiveShiftView(TramXangShift shift) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.access_time, color: Colors.green),
              title: const Text('Ca đang hoạt động'),
              subtitle: Text('Bắt đầu lúc: ${shift.openedAt.toString().substring(0, 16)}'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('Thống kê tạm tính:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          
          _buildStatRow('Tiền đầu ca', shift.openingCash),
          _buildStatRow('Doanh thu tiền mặt (ước tính)', 15500000), // Should query from Isar
          _buildStatRow('Chuyển khoản / QR', 5500000),
          const Divider(),
          _buildStatRow('Tiền mặt dự kiến (Expected)', shift.openingCash + 15500000, isBold: true),
          
          const SizedBox(height: 32),
          const Text('Đóng ca (Kết toán):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          
          TextField(
            controller: _actualCashController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Nhập số tiền mặt thực tế thu được',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.attach_money),
            ),
          ),
          
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.stop),
            label: const Text('CHỐT SỐ & ĐÓNG CA'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              // Calculate difference
              double actual = double.tryParse(_actualCashController.text) ?? 0;
              double expected = shift.openingCash + 15500000;
              double diff = actual - expected;
              
              shift.actualCash = actual;
              shift.expectedCash = expected;
              shift.difference = diff;
              
              if (diff < 0) {
                shift.status = 'SHORT'; // Hụt tiền
              } else if (diff > 0) {
                shift.status = 'OVER'; // Dư tiền
              } else {
                shift.status = 'BALANCED';
              }
              
              ref.read(tramXangActiveShiftProvider.notifier).closeShift(shift);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Đã đóng ca. Trạng thái: ${shift.status}. Chênh lệch: $diff đ')),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('${value.toStringAsFixed(0)} đ', style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
