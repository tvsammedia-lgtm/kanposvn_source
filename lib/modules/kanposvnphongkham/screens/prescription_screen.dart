import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/phongkham_provider.dart';

class PrescriptionScreen extends ConsumerWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(currentPrescriptionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kê Đơn Thuốc'),
        backgroundColor: Colors.purple.shade700,
      ),
      body: draft == null 
        ? const Center(child: Text('Chưa có dữ liệu đơn thuốc'))
        : Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.purple.shade50,
                child: Row(
                  children: [
                    const Icon(Icons.auto_awesome, color: Colors.purple),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Đây là bản nháp (Draft) được tạo bởi AI Assistant. Bác sĩ cần kiểm tra và xác nhận trước khi phát hành.',
                        style: TextStyle(color: Colors.purple.shade900),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const ListTile(
                      title: Text('Paracetamol 500mg'),
                      subtitle: Text('Sáng 1 viên, Chiều 1 viên - Uống sau ăn'),
                      trailing: Text('10 Viên'),
                    ),
                    const ListTile(
                      title: Text('Amoxicillin 500mg'),
                      subtitle: Text('Ngày 2 lần, mỗi lần 1 viên - Kháng sinh'),
                      trailing: Text('14 Viên'),
                    ),
                    // TODO: Hiển thị PrescriptionItem thực tế từ Isar model
                  ],
                ),
              ),
            ],
          ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  // Lọc bớt/sửa đơn
                  Navigator.pop(context);
                },
                child: const Text('Từ chối / Sửa lại'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Xác nhận đơn thuốc, đổi status -> 'confirmed'
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã xác nhận toa thuốc thành công!')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Xác Nhận Kê Đơn'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
