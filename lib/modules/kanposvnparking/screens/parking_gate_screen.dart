import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/parking_providers.dart';
import '../models/parking_ticket.dart';

class ParkingGateScreen extends ConsumerStatefulWidget {
  const ParkingGateScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ParkingGateScreen> createState() => _ParkingGateScreenState();
}

class _ParkingGateScreenState extends ConsumerState<ParkingGateScreen> {
  final _plateController = TextEditingController();

  void _handleCheckIn() {
    if (_plateController.text.isEmpty) return;

    final ticket = ParkingTicket()
      ..ticketId = 'TICKET_${DateTime.now().millisecondsSinceEpoch}'
      ..licensePlate = _plateController.text.toUpperCase()
      ..checkInTime = DateTime.now()
      ..status = 'parking';

    ref.read(parkingActiveTicketsProvider.notifier).saveTicket(ticket);
    _plateController.clear();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã nhận xe thành công!'), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trạm Gác - Nhận/Trả Xe'),
        backgroundColor: const Color(0xFF0F766E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('NHẬN XE MỚI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F766E))),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _plateController,
                      decoration: const InputDecoration(
                        labelText: 'Nhập Biển Số Xe',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.car_rental),
                      ),
                      textCapitalization: TextCapitalization.characters,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _handleCheckIn,
                      icon: const Icon(Icons.login, color: Colors.white),
                      label: const Text('NHẬN XE (CHECK-IN)', style: TextStyle(color: Colors.white, fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F766E),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Giả lập Camera (OCR)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.black87,
              child: const Center(
                child: Text('Camera Feed\n(Đang chờ xe...)', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
