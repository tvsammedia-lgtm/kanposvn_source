import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bus_ticket_provider.dart';

class BusScannerScreen extends ConsumerStatefulWidget {
  const BusScannerScreen({super.key});

  @override
  ConsumerState<BusScannerScreen> createState() => _BusScannerScreenState();
}

class _BusScannerScreenState extends ConsumerState<BusScannerScreen> {
  final _codeCtrl = TextEditingController();

  void _scan() async {
    final code = _codeCtrl.text.trim();
    if (code.isEmpty) return;

    final success = await ref.read(busTicketProvider.notifier).scanTicket(code);
    
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ CHECK-IN THÀNH CÔNG. KHÁCH LÊN XE!'), backgroundColor: Colors.green));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('❌ MÃ VÉ KHÔNG HỢP LỆ!'), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Máy Quét Vé (Lơ Xe)'), backgroundColor: Colors.black),
      backgroundColor: Colors.black87,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 4),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: const Center(
                  child: Text('Đưa QR Code vào vùng này', style: TextStyle(color: Colors.white70), textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 32),
              // Nhập mã tay mô phỏng quét
              TextField(
                controller: _codeCtrl,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Nhập mã vé (Ví dụ: KAN-BUS-...)',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _scan,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('QUÉT VÉ'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
